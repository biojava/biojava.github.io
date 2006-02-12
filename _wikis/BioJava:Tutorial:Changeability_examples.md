---
title: BioJava:Tutorial:Changeability examples
tags:
 - Tutorial
---

**By [Matthew Pocock](mailto:mrp@sanger.ac.uk)**

We are going to play with the `Changeability` code using the example of
a GUI for viewing the roles on a rulet wheel. We will try to estimate
the probability of the ball falling on any one of the 40 slots and of it
falling on red or black.

The imports
-----------

We will need to import some standard graphical packages to make the GUI,
and `java.util` as it gives us stuff like iterators. From BioJava, we
will need all of the Changeability API. The other BioJava packages give
us things like `Symbol` objects, alphabets, annotations and probability
distributions.

    import java.awt.*;
    import java.awt.event.*;
    import java.awt.geom.*;
    import java.util.*;
    import javax.swing.*;

    import org.biojava.utils.*;
    import org.biojava.bio.*;
    import org.biojava.bio.symbol.*;
    import org.biojava.bio.dist.*;

Setting up the roulet data
--------------------------

Firstly, we need to declare the class as extending `JApplet` so that we
can use it inside a web-page and also rely on Swing working properly.

    public class Roulet extends JApplet {

Then we can declare the static variables that will define the game.

      public static final FiniteAlphabet rolls;
      public static final Symbol [] allRolls;

      public static final FiniteAlphabet redBlack;
      public static final Symbol red;
      public static final Symbol black;

      // probability distribution used to sample rolls of the wheel
      public static final Distribution wheelRoler;

Of course, all of these items must be initialized. We will use a static
initialization block.

      // stuff to make the roulet wheel exist.
      static {
        final int numRolls = 40;

        // make the rolls alphabet
        rolls = new SimpleAlphabet("Rolls");
        allRolls = new Symbol[numRolls];

Having made the rolls alphabet, we now must populate it with each
possible roulet wheel outcome - *1..40* - as a symbol instance.

        for(int i = 1; i <= numRolls; i++) {
          Symbol s = allRolls[i-1] = AlphabetManager.createSymbol(
            (char) (i + '0'),
            i + "",
            Annotation.EMPTY_ANNOTATION
          );

          // attempt to add the symbol
          // this should work, but we still have to catch the exceptions. Since they
          // should be impossible throw, we re-throw them as assertion-failures.
          try {
            rolls.addSymbol(s);
          } catch (ChangeVetoException cve) {
            throw new BioError(
              "Assertoin Failure: Can't add symbol to the rolls alphabet", cve
            );
          } catch (IllegalSymbolException ise) {
            throw new BioError(
              "Assertoin Failure: Can't add symbol to the rolls alphabet", ise
            );
          }
        }

Notice that we have to catch exceptions that should be imposible to
generate, but are specified in the API. Under different circumstances,
these exceptions may be legitimately thrown, and we would have caught
them and done something more sensible to handle the error.

        rolls.addChangeListener(ChangeListener.ALWAYS_VETO, Alphabet.SYMBOLS);

This is an example of using `ALWAYS_VETO` to prevent things from
changing. Here we lock the `SYMBOLS` property of rolls so that no more
symbol instances can be added or removed from the alphabet. This ensures
data-integrity and makes it harder to write syntacticaly correct bugs.

We must now make the red/black alphabet.

        redBlack = new SimpleAlphabet("Red/Black");

        // the "red" symbol
        red = AlphabetManager.createSymbol(
          'r', "red",
          Annotation.EMPTY_ANNOTATION
        );
        // the "black" symbol"
        black = AlphabetManager.createSymbol(
          'b', "black",
          Annotation.EMPTY_ANNOTATION
        );

        // again, add them and throw any exceptions on as assertion-failures.
        try {
          redBlack.addSymbol(red);
          redBlack.addSymbol(black);
        } catch (ChangeVetoException cve) {
          throw new BioError(
            cve, "Assertoin Failure: Can't add symbol to the red/black alphabet"
          );
        } catch (IllegalSymbolException ise) {
          throw new BioError(
            ise, "Assertoin Failure: Can't add symbol to the red/black alphabet"
          );
        }
        // and again lock the alphabet
        redBlack.addChangeListener(ChangeListener.ALWAYS_VETO, Alphabet.SYMBOLS);

Notice that again while the symbols are added we must check that nothing
goes wrong. Also, again, we lock the red/black alphabet so that it can't
be tampered with.

Now we will set up a probability distribution that can be sampled from
to simulate the rolling of a roulet wheel. We will simply use an
instance of UniformDistribution rather than generating a special
distribution ourselves - cassinoes should have un-biassed wheels.

        wheelRoler = new UniformDistribution(rolls);
      }

And there we close the static block. Everything is set up for a game of
chance.

Applet for playing the game
---------------------------

Let us start by setting up the state of the applet that will be used for
estimating how the game is played, and for rendering the current
best-guess for the outcomes of multiple roles of the wheel.

      private Distribution rollDist;
      private Distribution redBlackDist;
      private boolean running = false;
      private Thread countAdder;

`rollDist` will be our estimate of the probability of any one of the
roles. `redBlackDist` is our estimate of getting one of red or black
(even/odd). We will use the thread in `countAdder` to repeatedly sample
the game, and when running is set to false, we will temporarily suspend
sampling.

In the applet's init method we will set up all the state and build the
GUI.

      public void init() {
        super.init(); // can't hurt...

Firstly, lets create the `rollDist` and `redBlackDist` objects.

        try {
          rollDist = DistributionFactory.DEFAULT.createDistribution(rolls);
        } catch (IllegalAlphabetException iae) {
          throw new BioError("Could not create distribution", iae);
        }

        redBlackDist = new RedBlackDist(rollDist);

Now we must make an object to estimate the `rollDist` probabilities.
This is done using a `DistributionTrainerContext` instance called `dtc`.
`dtc` will colate counts for each of the forty outcomes so that
`rollDist` can then represent these frequencies as a probability
distribution.

        final DistributionTrainerContext dtc =
          new SimpleDistributionTrainerContext();
        dtc.registerDistribution(rollDist);

Now we will create the thread that samples roles from the roulet wheel.
It will synchronize upon itself so that we can suspend it as we wish.

        countAdder = new Thread(new Runnable() {
          public void run() {
            while(true) {

We will check the value of the running member variable to check if we
should be sampling the wheel.

              boolean running;
              synchronized(countAdder) {
                running = Roulet.this.running;
              }
              if(running == true) {

Here we perform the sampling and inform the trainer of the role. To
force `rollDist` to reflect the new counts, we also call `tdc.train`,
and catch all the resulting exceptions (which should be imposible if
everything is set up coorectly).

                Symbol s = Roulet.wheelRoler.sampleSymbol();
                try {
                  dtc.addCount(rollDist, s, 1.0);
                  dtc.train();
                } catch (IllegalSymbolException ise) {
                  // should be impossible!
                  throw new BioError(
                     "Assertion Failure: Sampled symbol not in alphabet", ise
                  );
                } catch (ChangeVetoException cve) {
                  cve.printStackTrace();
                }

Now we will synchronize on the thread and sleep for a half seccond.

                synchronized(countAdder) {
                  try {
                    countAdder.wait(500);
                  } catch (InterruptedException ie) {
                  }
                }

This code handles the case when the sampling thread has been asked to
stop running temporarily. Again, we must synchronize on the sampling
thread.

              } else {
                synchronized(countAdder) {
                  try {
                    countAdder.wait();
                  } catch (InterruptedException ie) {
                  } catch (IllegalMonitorStateException imse) {
                    throw new Error("Ouch", imse);
                  }
                }
              }
            }
          }
        });

That is the end of the sampling thread.

Now we can move onto the GUI. Let's set up buttons to start and stop the
sampler thread and to clear the counts so far.

        final JButton start = new JButton("Start");
        final JButton stop = new JButton("Stop");
        final JButton clear = new JButton("Clear");
    The start button must start of enabled, and should cause sampling to start. 
        start.setEnabled(true);
        start.addActionListener(new ActionListener() {
          public void actionPerformed(ActionEvent ae) {
            synchronized(countAdder) {
              running = true;
              start.setEnabled(false);
              stop.setEnabled(true);
              countAdder.notify();
            }
          }
        });

The stop button should start off dissabled, and should cause the
sampling to stop.

        stop.setEnabled(false);
        stop.addActionListener(new ActionListener() {
          public void actionPerformed(ActionEvent ae) {
            synchronized(countAdder) {
              running = false;
              start.setEnabled(true);
              stop.setEnabled(false);
              countAdder.notify();
            }
          }
        });

The clear button should be enabled, and should both clear the counts and
susspend sampling.

        clear.setEnabled(true);
        clear.addActionListener(new ActionListener() {
          public void actionPerformed(ActionEvent ae) {
            synchronized(countAdder) {
              running = false;
              start.setEnabled(true);
              stop.setEnabled(false);
              dtc.clearCounts();
              countAdder.notify();
            }
          }
        });

Now we should build the GUI components to render the probability
distributions as pie-charts.

        Pie allPie;
        try {
          allPie = new Pie(rollDist, AlphabetManager.getAlphabetIndex(allRolls));
        } catch (IllegalSymbolException ise) {
          throw new BioError("Assertion Failure: Can't make indexer", ise);
        } catch (BioException be) {
          throw new BioError("Assertion Failure: Can't make indexer", be);
        }
        Pie redBlackPie = new Pie(redBlackDist);

Now, we add all of these components to the applet.

        getContentPane().setLayout(new BorderLayout());
        JPanel top = new JPanel();
        top.setLayout(new FlowLayout());
        top.add(start);
        top.add(stop);
        top.add(clear);
        getContentPane().add(top, BorderLayout.NORTH);

        JPanel center = new JPanel();
        center.setLayout(new FlowLayout());
        center.add(redBlackPie);
        center.add(allPie);
        Dimension d = new Dimension(200, 200);
        redBlackPie.setPreferredSize(d);
        allPie.setPreferredSize(d);

        getContentPane().add(center, BorderLayout.CENTER);
      }

This is the end of init. It has set up the state of the object, ready
for it to render estimated probabilities of each wheel outcome being
observed by repeatedly sampling the roulet wheel.

Starting the game off
---------------------

The last bit of the applet is the command to set the sampler thread into
motion. This realy fits into the applet's `start` method naturaly.

      public void start() {
        super.start();

        countAdder.start();
      }
    }

And that is the end of the `Roulet` class.

The pie-chart rendering component
---------------------------------

To render a distribution as a pie-chart, we need a custom sub-class of
`JComponent`. It will have to respond to changes in the distribution and
consistently paint itself on the screen. Here is the state it will need.

    class Pie extends JComponent {
      private Distribution dist;
      private AlphabetIndex indexer;
      private ChangeListener repainter;

`dist` is the distribution that this pie-chart will render. `indexer`
will be used to consistently order the states, and `repainter` is a
`ChangeListener` instance that will repaint the pie whenever `dist`
changes.

The first constructor just creates an alphabet indexer and chains onto
the second one.

      public Pie(Distribution dist) {
        this(dist, AlphabetManager.getAlphabetIndex((FiniteAlphabet) dist.getAlphabet()));
      }

The second constructor builds a couple of `ChangeListener` instances

      public Pie(Distribution dist, AlphabetIndex indexer) {
        this.dist = dist;
        this.indexer = indexer;

        repainter = new ChangeAdapter() {
          public void postChange(ChangeEvent ce) {
            repaint();
          }
        };

        dist.addChangeListener(repainter, Distribution.WEIGHTS);
      }

We must provide a way to render the pie-chart. `JComponent` likes us to
override the `paintComponent` method, so this is what we shall do. The
first job for the paint method is to work out some basic geometric
points around which to render.

      protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D) g;

        double pad = 5.0;
        Rectangle2D boundingBox = new Rectangle2D.Double(
          pad, pad,
          getWidth() - 2.0 * pad, getHeight() - 2.0 * pad
        );
        double midx = getWidth() * 0.5;
        double midy = getHeight() * 0.5;

Now we can render each slice of the pie-chart, using a width
proportional to the probability of each symbol, skipping each zero
probability.

        double angle = 0.0;
        for(int i = 0; i < indexer.getAlphabet().size(); i++) {
          try {
            Symbol s = indexer.symbolForIndex(i);
            double p = dist.getWeight(s);
            if(p != 0.0) {
              double extent = p * 365.0;

              Arc2D slice = new Arc2D.Double(boundingBox, angle, extent, Arc2D.PIE);
              char token = s.getToken();
              if(s == Roulet.red) {
                g2.setPaint(Color.red);
              } else if(s == Roulet.black) {
                g2.setPaint(Color.black);
              } else if( ((token - '0') % 2) == 0) {
                g2.setPaint(Color.red);
              } else {
                g2.setPaint(Color.black);
              }

              g2.fill(slice);
              g2.setPaint(Color.blue);
              g2.draw(slice);

              angle += extent;
            }
          } catch (IllegalSymbolException ise) {
            ise.printStackTrace();
          }
        }

The last task is to render on some labels so that we know what each
slice represents.

        angle = 0.0;
        g2.setPaint(Color.yellow);
        for(int i = 0; i < indexer.getAlphabet().size(); i++) {
          try {
            Symbol s = indexer.symbolForIndex(i);
            double p = dist.getWeight(s);
            if(p != 0.0) {
              double extent = p * 365.0;

              double a2 = Math.toRadians(angle + 0.5 * extent);
              g2.drawString(
                s.getName(),
                (float) (midx + Math.cos(a2) * midx * 0.8),
                (float) (midy - Math.sin(a2) * midy * 0.8)
              );

              angle += extent;
            }
          } catch (IllegalSymbolException ise) {
            ise.printStackTrace();
          }
        }
      }
    }

That is the end of the pie-chart class.

RedBlackDist as a view onto the rollDist distribution
-----------------------------------------------------

The RedBlackDist class will implement Distribution, but will need to map
the 40-symbol alphabet of the entire roulet wheel into the 2-symbol
alphabet of red/black. It must remain synchronized with the main wheel,
updating its state whenever its parent does.

    class RedBlackDist extends AbstractDistribution {
      private Distribution parent;
      private Distribution nullModel;
      private double red;
      private double black;

      private ChangeListener parentL;
      private ChangeListener propUpdater;

parent is the distribution being viewed. nullModel represents a view of
the parent's null model. red and black will store the probabilities of
comming up red or black in the parent. parentL will listen to the parent
for when it changes and notify all interested parties that this
distribution is changing in response. propUpdater will do the job of
actualy calculating red and black from the parent.

Let's set up our distribution.

      public RedBlackDist(final Distribution parent) {
        this.parent = parent;
        generateChangeSupport(Distribution.WEIGHTS);

        parent.addChangeListener(parentL = new ChangeForwarder(
          this, changeSupport
        ) {

This listener will forward changes to the parent weights as changes to
this distribution. It extends ChangeForwarder that is a special instance
that passes on changes to one object as knock-on events to another. By
using the ChangeEvent constructor that includes a ChangeEvent, we can
pass on the complete chain-of-evidence that allows listeners to work out
why we are claiming to alter.

          protected ChangeEvent generateEvent(ChangeEvent ce) {
            return new ChangeEvent(
              getSource(), Distribution.WEIGHTS,
              null, null,
              ce
            );
          }
        }, Distribution.WEIGHTS);

We must also add a listener to ourselves to trap successful attempts to
change (those that are not vetoed), and to update the values of red and
black.

        addChangeListener(propUpdater = new ChangeAdapter() {
          public void postChange(ChangeEvent ce) {
            red = 0.0;
            black = 0.0;
            for(
              Iterator i = ((FiniteAlphabet) (parent.getAlphabet())).iterator();
              i.hasNext();
            ) {
              Symbol s = (Symbol) i.next();
              try {
                if( (s.getToken() - '0') % 2 == 0) { // even - red
                  red += parent.getWeight(s);
                } else { // odd - black
                  black += parent.getWeight(s);
                }
              } catch (IllegalSymbolException ise) {
                throw new BioError("Assertion Failure: Can't find symbol", ise);
              }
            }
          }
        }, Distribution.WEIGHTS);
      }

And that is the end of the constructor.

Now we must provide the missing methods in AbstractDistribution. These
are fairly booring. Our alphabet is the same as the roulet redBlack
object, and getWeightImpl will return the value of red for the red
symbol and the value of black for the black symbol.

      public Alphabet getAlphabet() {
        return Roulet.redBlack;
      }

      protected double getWeightImpl(AtomicSymbol sym)
      throws IllegalSymbolException {
        if(sym == Roulet.red) {
          return red;
        } else if(sym == Roulet.black) {
          return black;
        } else {
          throw new IllegalSymbolException("No symbol known for " + sym);
        }
      }

All of these methods are just stubs. Notice that they throw
ChangeVetoExceptions to indicate that they are not implemented.
ChangeVetoException can either mean that the change is dissalowed
because some listener explicitly stops it, or that the method is not
supported. Either way, the state of the object will not be updated.

      protected void setWeightImpl(AtomicSymbol as, double weight)
      throws ChangeVetoException, IllegalSymbolException {
        throw new ChangeVetoException("RedBlackDist is immutable");
      }

      protected void setNullModelImpl(Distribution nullModel)
      throws ChangeVetoException, IllegalAlphabetException {
        throw new ChangeVetoException("RedBlackDist is immutable");
      }

      public Distribution getNullModel() {
        if(nullModel == null) {
          nullModel = new RedBlackDist(parent.getNullModel());
        }
        return nullModel;
      }
    }

What you should see
-------------------

If you type this in and compile, or run the applet
[directly](http://www.biojava.org/tutorials/Roulet.html), you should see
a gui with a start, stop and clear button. If you click on start, the
applet will start sampling the table every 1/2 seccond. You will notice
that the two pie-charts reflect these roles by repainting. If you click
stop, the sampling thread will stop getting new roles. If you click
start again, then more counts will be collected. If you click clear,
then the sampling will stop. Pressing start again will start the process
off from the initial point of just one count collected.

By the end of this, you should feel comefortable with listening for
events and writing custom ChangeListener implementations. You should be
able to prevent a property from altering by adding an ALWAYS\_VETO
listener. You should have an understanding of how when one object
changes, it may cause the state of another object to change, and off how
to write a ChangeAdapter instance that will wire this together. I hope
it was fun.
