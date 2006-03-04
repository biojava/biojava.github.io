---
title: BioJava:CookBook:Interfaces:Coordinates
---

How do I display Sequence coordinates?
--------------------------------------

When displaying a sequence it is useful to display the coordinates of
the sequence so you can tell where you are up to. BioJava contains a
SequenceRenderer implementation called a RulerRenderer that displays
Sequence coordinates.

Because a SequenceRenderContext can only use a single SequenceRenderer
at a time you will need to use a MultiLineRenderer. A MultiLineRenderer
implements SequenceRenderer and can wrap up multiple SequenceRenderers
coordinating their displays as several tracks.

The use of a RulerRenderer and a MultiLineRenderer is demonstrated in
the program below. A screen shot of the GUI is displayed below the
program.

[frame|center|View Sequence coordinates in a
GUI](image:Multiview.jpg "wikilink")

    import java.awt.*;
    import java.awt.event.*;
    import javax.swing.*;
    import org.biojava.bio.gui.sequence.*;
    import org.biojava.bio.seq.*;
    import org.biojava.bio.symbol.*;

    public class MultiView extends JFrame {
      private JPanel jPanel = new JPanel();
      private MultiLineRenderer mlr = new MultiLineRenderer();
      private SequenceRenderer symR = new SymbolSequenceRenderer();
      private RulerRenderer ruler = new RulerRenderer();
      private SequencePanel seqPanel = new SequencePanel();
      private Sequence seq;


      public MultiView() {
        try {
          seq = ProteinTools.createProteinSequence(
              "agcgstyravlivtymaragrsecharlvahklchg",
              "protein 1");
          init();
        }
        catch(Exception e) {
          e.printStackTrace();
        }
      }
      public static void main(String[] args) {
        MultiView multiView = new MultiView();
        multiView.pack();
        multiView.show();
      }

      /**
       * OverRide to allow termination of program.
       */
      protected void processWindowEvent(WindowEvent we){
        if (we.getID() == WindowEvent.WINDOW_CLOSING) {
          System.exit(0);
        }
        else {
          super.processWindowEvent(we);
        }
      }

      /**
       * Set up GUI components
       */
      private void init() throws Exception {
        this.setTitle("MultiView");
        this.getContentPane().add(jPanel, BorderLayout.CENTER);
        jPanel.add(seqPanel, BorderLayout.CENTER);

        //add the SymbolSequenceRenderer and RulerRenderer to the MultiLineRenderer
        mlr.addRenderer(symR);
        mlr.addRenderer(ruler);

        //set the MultiLineRenderer as the main renderer
        seqPanel.setRenderer(mlr);

        //set the Sequence
        seqPanel.setSequence(seq);

        //set the range to show
        seqPanel.setRange(new RangeLocation(1,seq.length()));
      }
    }
