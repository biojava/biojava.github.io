---
title: BioJava:CookBook:Interfaces:ViewInGUI
---

How can I display a Sequence in a GUI
-------------------------------------

When building a bioinformatics GUI you will probably want to display the
sequence of residues in the Sequence you are displaying. BioJava
contains a number of GUI components that can render various aspects of a
Sequence.

The basic unit of any Sequence based GUI is the SequenceRenderContext
which holds the Sequence and sends instructions to a SequenceRenderer
which does the actual drawing of the Sequence. There are several
SequenceRenderer implementations in BioJava. The one to display the
order of residues is the SymbolSequenceRenderer.

The following program demonstrates the use of a SequenceRenderContext
and a SequenceRenderer to display the symbols in a Sequence.

    import java.awt.*;
    import java.awt.event.*;

    import javax.swing.*;

    import org.biojava.bio.gui.sequence.*;
    import org.biojava.bio.seq.*;
    import org.biojava.bio.symbol.*;

    public class SeqView extends JFrame {
      private Sequence seq;
      private JPanel jPanel = new JPanel();
      private SequencePanel seqPanel = new SequencePanel();
      private SequenceRenderer symSeqRenderer = new SymbolSequenceRenderer();

      public SeqView() {
        try {
          //create the sequence to display
          seq = RNATools.createRNASequence("accggcgcgagauuugcagcgcgcgcgcaucgcg"+
                                           "gggcgcauuaccagacuucauucgacgacucagc"
                                           ,"rna1");
          init();
        }
        catch(Exception e) {
          e.printStackTrace();
        }

      }
      public static void main(String[] args) {
        SeqView seqView = new SeqView();
        seqView.pack();
        seqView.show();
      }

      /**
       * Set up the components to display the graphics
       */
      private void init() throws Exception {
        this.getContentPane().setLayout(new BorderLayout());
        this.getContentPane().add(jPanel, BorderLayout.CENTER);
        this.setTitle("SeqView");
        jPanel.add(seqPanel, BorderLayout.CENTER);

        //set the sequence to display
        seqPanel.setSequence(seq);

        //set the object responsible for painting the sequence
        seqPanel.setRenderer(symSeqRenderer);

        //the amount of sequence to display
        seqPanel.setRange(new RangeLocation(1,seq.length()));
      }

      /**
       * Overide this to close the program when the window closes.
       */
      protected void processWindowEvent(WindowEvent we){
        if (we.getID() == WindowEvent.WINDOW_CLOSING) {
          System.exit(0);
        }
        else {
          super.processWindowEvent(we);
        }
      }
    }

Below the program is a screen shot of the GUI.
