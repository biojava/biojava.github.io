---
title: BioJava:CookbookPortuguese:Interfaces:ViewAsTree
---

Como eu posso visualizar Anotações e características como árvore
----------------------------------------------------------------

Given that Sequences can hold Annotations, with their key value pairs,
and Features, and that Features can hold information, Annotations and
nested Features, which can contain still more annotations, nested
features etc it would be useful to be able to view it all as a
structured tree.

Fortunately the friendly BioJava team have made the FeatureTree class to
let you see where all that structure goes. The FeatureTree extends the
JTree component and can easily be used in a GUI. The data used by the
tree is supplied in the form of a SequenceDB that can be made by reading
a text file.

The following program demonstrates the use of a FeatureTree. It takes
two arguments. The first is the name of a file containing sequence data.
The second is a number specifying the format of the data.

<java> import java.awt.\*; import java.awt.event.\*; import java.io.\*;

import javax.swing.\*;

import org.biojava.bio.gui.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.seq.db.\*; import org.biojava.bio.seq.io.\*;

public class TreeFrame extends JFrame {

` private JPanel jPanel = new JPanel();`  
` private JScrollPane jScrollPane1 = new JScrollPane();`  
` private BorderLayout borderLayout = new BorderLayout();`  
` private FeatureTree featureTree = new FeatureTree();`

` public TreeFrame() {`  
`   try {`  
`     init();`  
`   }`  
`   catch(Exception e) {`  
`     e.printStackTrace();`  
`   }`  
` }`

` /**`  
`  * Este programa lerá arquivos suportados por SeqIOTools e exibirá esta `  
`  * Sequence, Annotations e Features como uma árvore. Ela recebe tres `  
`  * argumentos, primeiro o nome do arquivo, a seguir, o tipo de arquivo `  
`  * e por ultimo é o tipo de alfabeto`  
`  *`  
`  */`  
` public static void main(String[] args) throws Exception{`

`   //Le a sequencia do arquivo`  
`   BufferedReader br = new BufferedReader(new FileReader(args[0]));`  
`   //pega o tipo do formato da linha de comando`  
`   String format = args[1];`  
`   //pega o alphabeto da linha de comando`  
`   String alpha = args[2];`

`   //Le as sequencias dentro de um DB que servirá de modelo para a árvore`  
`   SequenceDB db = new HashSequenceDB();`  
`   SequenceIterator iter =`  
`       (SequenceIterator)SeqIOTools.fileToBiojava(format, alpha, br);`  
`   while(iter.hasNext()){`  
`     db.addSequence(iter.nextSequence());`  
`   }`  
`   UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());`  
`   TreeFrame treeFrame = new TreeFrame();`  
`   //seta o SequenceDB para servir como modelo de dados`  
`   treeFrame.getFeatureTree().setSequenceDB(db);`  
`   treeFrame.pack();`  
`   treeFrame.show();`  
` }`

` private void init() throws Exception {`  
`   jPanel.setLayout(borderLayout);`  
`   this.setTitle("FeatureTree Demo");`  
`   this.getContentPane().add(jPanel, BorderLayout.CENTER);`  
`   jPanel.add(jScrollPane1,  BorderLayout.CENTER);`  
`   jScrollPane1.getViewport().add(featureTree, null);`  
` }`

` public FeatureTree getFeatureTree() {`  
`   return featureTree;`  
` }`

` protected void processWindowEvent(WindowEvent we){`  
`   if(we.getID() == WindowEvent.WINDOW_CLOSING){`  
`     System.exit(0);`  
`   }else{`  
`     super.processWindowEvent(we);`  
`   }`  
` }`

} </java>
