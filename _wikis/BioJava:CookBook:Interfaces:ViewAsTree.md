---
title: BioJava:CookBook:Interfaces:ViewAsTree
---

How can I view the Features and Annotations as a tree?
------------------------------------------------------

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
`  * This program will read files supported by SeqIOTools and display its`  
`  * Sequence, Annotations and Features as a Tree. It takes three`  
`  * arguments, the first is the file name the second is the file type`  
`  * and the third is the alphabet type`  
`  *`  
`  */`  
` public static void main(String[] args) throws Exception{`

`   //read the sequence flat file`  
`   BufferedReader br = new BufferedReader(new FileReader(args[0]));`  
`   //get the format type from the command line`  
`   String format = args[1];`  
`   //get the alphabet from the command line`  
`   String alpha = args[2];`

`   //read the sequences into a DB that will serve as the model for the tree`  
`   SequenceDB db = new HashSequenceDB();`  
`   SequenceIterator iter =`  
`       (SequenceIterator)SeqIOTools.fileToBiojava(format, alpha, br);`  
`   while(iter.hasNext()){`  
`     db.addSequence(iter.nextSequence());`  
`   }`  
`   UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());`  
`   TreeFrame treeFrame = new TreeFrame();`  
`   //set the SequenceDB to serve as the data model`  
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
