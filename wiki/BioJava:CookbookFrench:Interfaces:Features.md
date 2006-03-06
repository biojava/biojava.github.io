---
title: BioJava:CookbookFrench:Interfaces:Features
---

Comment montrer les Features dans une interface graphique?
----------------------------------------------------------

Les *Features* sont dessinés grâce à des implémentations de l'interface
*FeatureRenderer*. Les *FeatureRenderers* fonctionnent comme les
*SequenceRenderers* et s'occupent de dessiner les *Features* d'une
*Sequence* contenue dans un *SequenceRenderContext*.

Un SequenceRenderContext n'a aucun moyen d'interagir directement avec un
*FeatureRenderer*; pour se faire, un *FeatureBlockSequenceRenderer* est
utilisé pour encapsuler le *FeatureRenderer* et agir comme
intermédiaire.

L'utilisation d'un *FeatureBlockSequenceRenderer* et d'un
*FeatureRenderer* sont monté dans le programme ci-dessous. Une capture
d'écran suit le programme.

    import java.awt.*;
    import java.awt.event.*;
    import javax.swing.*;

    import org.biojava.bio.*;
    import org.biojava.bio.gui.sequence.*;
    import org.biojava.bio.seq.*;
    import org.biojava.bio.symbol.*;

    public class FeatureView extends JFrame {
      private Sequence seq;
      private JPanel jPanel1 = new JPanel();
      private MultiLineRenderer mlr = new MultiLineRenderer();
      private FeatureRenderer featr = new BasicFeatureRenderer();
      private SequenceRenderer seqR = new SymbolSequenceRenderer();
      private SequencePanel seqPanel = new SequencePanel();
      
      //l'intermédiaire entre featr et seqPanel
      private FeatureBlockSequenceRenderer fbr = new FeatureBlockSequenceRenderer();
      public FeatureView() {
        try {
          seq = DNATools.createDNASequence(
              "atcgcgcatgcgcgcgcgcgcgcgctttatagcgatagagatata",
              "dna 1");
          // créer une caractéristique entre 10 et 25
          StrandedFeature.Template temp = new StrandedFeature.Template();
          temp.annotation = Annotation.EMPTY_ANNOTATION;
          temp.location = new RangeLocation(10,25);
          temp.source = "";
          temp.strand = StrandedFeature.POSITIVE;
          temp.type = "";
          // créer une autre entre 30 et 35
          Feature f = seq.createFeature(temp);
          temp = (StrandedFeature.Template)f.makeTemplate();
          temp.location = new RangeLocation(30,35);
          temp.strand = StrandedFeature.NEGATIVE;
          seq.createFeature(temp);
          // initialiser l'interface
          init();
        }
        catch(Exception e) {
          e.printStackTrace();
        }
      }
      public static void main(String[] args) {
        FeatureView featureView = new FeatureView();
        featureView.pack();
        featureView.show();
      }
      
      /**
       * initialiser les composantes de l'interface
       */
      private void init() throws Exception {
        this.setTitle("FeatureView");
        this.getContentPane().add(jPanel1, BorderLayout.CENTER);
        jPanel1.add(seqPanel, null);
        //Enregister le FeatureRenderer avec le FeatureBlockSequenceRenderer
        fbr.setFeatureRenderer(featr);
        //ajouter les Renderers au MultiLineRenderer
        mlr.addRenderer(fbr);
        mlr.addRenderer(seqR);
        //assigner le MultiLineRenderer comme routine de rendu graphique des SequencePanels
        seqPanel.setRenderer(mlr);
        //faire le rendu de la Sequence
        seqPanel.setSequence(seq);
        //afficher la Sequence complète
        seqPanel.setRange(new RangeLocation(1,seq.length()));
      }
      
      /**
       * Redéfinir pour permettre de terminer le programme lorsque la fenêtre est fermée
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

[frame|center|Affichage des Features d'une
séquence](image:Featview.jpg "wikilink")
