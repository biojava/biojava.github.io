---
title: BioJava:CookbookFrench:Interfaces:ViewAsTree
---

Comment obtenir les Features et les Annotations graphiquement sous la forme d'un arbre?
---------------------------------------------------------------------------------------

Sachant que les *Sequences* peuvent contenir des *Annotations*, avec
leurs paires de clé-valeur, et des *Features*, et que ces *Features*
peuvent contenir des information, des *Annotations* et des *Features*
imbriqués, capables aussi de contenir d'autres *Annotations*, *Features*
imbriqués, etc, il est facile de concevoir qu'une représentation
graphique sous forme d'un arbre structuré serait d'une grande utilité.

Heureusement, la joyeuse équipe BioJava a crée la classe *FeatureTree*
pour vous faire voir comment cet arbre se présente. *FeatureTree*
prolonge la composante JTree et peut facilement être utilisé dans un
interface graphique. Les données utilisées pour créer l'arbre
proviennent d'un objet *SequenceDB* lui-même crée suite à la lecture
d'un fichier texte

Le programme suivant démontre l'utilisation d'un *FeatureTree*. Il
prends deux arguments: le premier est le nom du fichier, le deuxième est
un entier désignant le format des données.

<java> import java.awt.\*; import java.awt.event.\*; import java.io.\*;

import javax.swing.\*;

import org.biojava.bio.gui.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.seq.db.\*; import org.biojava.bio.seq.io.\*;

public class TreeFrame extends JFrame {

`  private JPanel jPanel = new JPanel();`  
`  private JScrollPane jScrollPane1 = new JScrollPane();`  
`  private BorderLayout borderLayout = new BorderLayout();`  
`  private FeatureTree featureTree = new FeatureTree();`

`  public TreeFrame() {`  
`    try {`  
`       init();`  
`    }`  
`    catch(Exception e) {`  
`     e.printStackTrace();`  
`    }`  
`  }`

`  /**`  
`   * Ce programme peut lire les fichiers en format supporté par SeqIOTools et `  
`   * dessiné ces Sequence, Annotations et Features sous forme d"arbre. Il prend   `  
`   * deux arguments: le 1er est le nom du fichier, le 2emeest une constante entière`  
`   * pour définir le type de fichier avec SeqIOTools. Consulter API pour SeqIOTools  `  
`   * pour les types possibles.  `  
`   *`  
`   * Les constantes valides sont :`  
`   *`  
`   * FASTADNA = 1;`  
`   * FASTAPROTEIN = 2;`  
`   * EMBL = 3;`  
`   * GENBANK = 4;`  
`   * SWISSPROT = 5;`  
`   * GENPEPT = 6;`  
`   *`  
`   */`  
`   public static void main(String[] args) throws Exception{`

`   //lire le fichier de séquence`  
`   BufferedReader br = new BufferedReader(new FileReader(args[0]));`  
`   `  
`   //obtenir le format du fichier à partir de la ligne de commande`  
`   int type = Integer.parseInt(args[1]);`

`   //lire les séquences dans une DB servant de modèle pour l'arbre`  
`   SequenceDB db = new HashSequenceDB();`  
`   SequenceIterator iter = (SequenceIterator)SeqIOTools.fileToBiojava(type, br);`  
`   while(iter.hasNext()){`  
`     db.addSequence(iter.nextSequence());`  
`   }`  
`   UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());`  
`   TreeFrame treeFrame = new TreeFrame();`  
`   //dicter que la SequenceDB servira de source de données`  
`   treeFrame.getFeatureTree().setSequenceDB(db);`  
`   treeFrame.pack();`  
`   treeFrame.show();`  
`   }`

`   private void init() throws Exception {`  
`     jPanel.setLayout(borderLayout);`  
`     this.setTitle("FeatureTree Demo");`  
`     this.getContentPane().add(jPanel, BorderLayout.CENTER);`  
`     jPanel.add(jScrollPane1,  BorderLayout.CENTER);`  
`     jScrollPane1.getViewport().add(featureTree, null);`  
`   }`

`   public FeatureTree getFeatureTree() {`  
`     return featureTree;`  
`   }`

`   protected void processWindowEvent(WindowEvent we){`  
`     if(we.getID() == WindowEvent.WINDOW_CLOSING){`  
`        System.exit(0);`  
`     }`  
`     else{`  
`        super.processWindowEvent(we);`  
`     }`  
` }`

} </java>
