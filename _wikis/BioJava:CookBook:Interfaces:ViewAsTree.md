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

```java
import java.awt.\*; import java.awt.event.\*; import java.io.\*;

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

}
```

To draw Tree by Clustering Algorithms (**UPGMA** and **NJ**) a Distance
Matrix is taken as input. Graphics allow to draw tree with the drawLine
function. Match7 will be the main class for the call of NewClass having
functions for UPGMA and NJ.

```java
package ClusteringAlgorithms public class Match7 { public static
void main(String[] args) {

double[][] ds1 = { { },

`              {3.5},`  
`              {17.0,14.0},`  
`              {13.0,13.0,13.0},`  
`              {17.5,16.5,13.0,5.0}};`

`   UPGMA upclu = new UPGMA(ds1);`  
`   new TreeFrame("UPGMA tree", upclu.getRoot());`  
`   `  
`    double[][] ds2 = { { },`  
`              { 0.3 },`  
`              { 0.5, 0.6 },`  
`              { 0.6, 0.5, 0.9 } };`  
`   NJ njclu = new NJ(ds2);`  
`   new TreeFrame("Neighbour tree", njclu.getRoot());`  
` }`

}

```

```java

import java.awt.\*; import java.awt.event.\*;

abstract class Cluster {

` public abstract void draw(Graphics g, int w, int h);`

}

//UPGMA clusters or trees, built by the UPGMA algorithm

class UPCluster extends Cluster {

` int lab;          // Cluster identifier`  
` int card;         // The number of sequences in the cluster`  
` double height;        // The height of the node`  
` UPCluster left, right;    // Left and right children, or null`  
` double[] dmat;        // Distances to lower-numbered nodes, or null`

` public UPCluster(int lab, double[] dmat) {    // Leaves = single sequences`  
`   this.lab = lab + 1;`  
`   card = 1;`  
`   this.dmat = dmat;`  
` }`

` public UPCluster(int lab, UPCluster left, UPCluster right, double height,`  
`        double[] dmat) {`  
`   this.lab = lab + 1;`  
`   this.left = left;`  
`   this.right = right;`  
`   card = left.card + right.card;`  
`   this.height = height;`  
`   this.dmat = dmat;`  
` }`

` public boolean live()`  
` { return dmat != null; }`

` public void kill()`  
` { dmat = null; }`

` public void print()`  
` { print(0); }`

` void print(int n) {`  
`   if (right != null)`  
`     right.print(n + 6);`  
`   indent(n);`  
`   System.out.println("[" + lab + "] (" + (int)(100*height)/100.0 + ")");`  
`   if (left != null)`  
`     left.print(n + 6);`  
` }`

` void indent(int n) {`  
`   for (int i=0; i`<n; i++)
      System.out.print(" ");
  }

  public void draw(Graphics g, int w, int h) {
    draw(g, w, h, 0, (double)w/card, (double)(h-50)/height, 10);
  }

  // Draw tree and return x-coordinate of root

  public int draw(Graphics g, int w, int h, int leftcard,
          double xsc, double ysc, int fromy) {
    if (left != null && right != null) {    // Internal node
      int y = (int)(h - 30 - height * ysc);
      int leftx  = left.draw(g, w, h, leftcard, xsc, ysc, y);
      int rightx = right.draw(g, w, h, leftcard+left.card, xsc, ysc, y);
      g.drawLine(leftx, y, rightx, y);
      int x = (leftx + rightx) / 2;
      g.drawLine(x, y, x, fromy);
      g.fillOval(x-4, y-4, 8, 8);
      return x;
    } else {                    // Leaf node
      int x = (int)((leftcard + 0.5) * xsc);
      g.drawLine(x, h-30, x, fromy);
      g.fillOval(x-4, h-30-4, 8, 8);
      g.drawString(Integer.toString(lab), x-5, h-10);
      return x;
    }
  }
}


// The UPGMA algorithm

class UPGMA {
  int K;            // The number of clusters created so far
  UPCluster[] cluster;      // The nodes (clusters) of the resulting tree

  public UPGMA(double[][] ds) {
    int N = ds.length;
    cluster = new UPCluster[2*N-1];
    for (int i=0; i<N; i++)
      cluster[i] = new UPCluster(i, ds[i]);
    K = N;
    while (K < 2*N-1)
      findAndJoin();
  }

  public UPCluster getRoot()
  { return cluster[K-1]; }

  public double d(int i, int j)
  { return cluster[Math.max(i, j)].dmat[Math.min(i, j)]; }

  void findAndJoin() { // Find closest two live clusters and join them
    int mini = -1, minj = -1;
    double mind = Double.POSITIVE_INFINITY;
    for (int i=0; i<K; i++)
      if (cluster[i].live())
    for (int j=0; j<i; j++)
      if (cluster[j].live()) {
        double d = d(i, j);
        if (d < mind) {
          mind = d;
          mini = i;
          minj = j;
        }
      }
    join(mini, minj);
  }

  public void join(int i, int j) { // Join i and j to form node K
    // System.out.println("Joining " + (i+1) + " and " + (j+1) + " to form "
    //         + (K+1) + " at height " + (int)(d(i, j) * 50)/100.0);
    double[] dmat = new double[K];
    for (int m=0; m<K; m++)
      if (cluster[m].live() && m != i && m != j)
    dmat[m] = (d(i, m) * cluster[i].card + d(j, m) * cluster[j].card)
              / (cluster[i].card + cluster[j].card);
    cluster[K] = new UPCluster(K, cluster[i], cluster[j], d(i, j) / 2, dmat);
    cluster[i].kill();
    cluster[j].kill();
    K++;
  }
}


// Neighbour clusters or trees, built by the neighbour joining algorithm

class NJCluster extends Cluster {
  int lab;          // Cluster identifier
  int card;         // The number of sequences in the cluster
  NJCluster left, right;    // Left and right children, or null
  double dleft, dright;     // Length of edges to the children, if any
  double[] dmat;        // Distances to lower-numbered nodes, or null

  public NJCluster(int lab, double[] dmat) {    // Leaves = single sequences
    this.lab = lab + 1;
    card = 1;
    this.dmat = dmat;
  }

  public NJCluster(int lab, NJCluster left, double dleft,
           NJCluster right, double dright, double[] dmat) {
    this.lab = lab + 1;
    this.left = left;   this.dleft  = dleft;
    this.right = right; this.dright = dright;
    card = left.card + right.card;
    this.dmat = dmat;
  }

  public boolean live()
  { return dmat != null; }

  public void kill()
  { dmat = null; }

  double height() {
    if (left != null && right != null)
      return Math.max(left.height() + dleft, right.height() + dright);
    else
      return 0.0;
  }

  public void print()
  { print(0); }

  void print(int n) {
    if (right != null)
      right.print(n + 6);
    indent(n);
    System.out.println("[" + lab + "] (" + (int)(100*height())/100.0 + ")");
    if (left != null)
      left.print(n + 6);
  }

  void indent(int n) {
    for (int i=0; i<n; i++)
      System.out.print(" ");
  }

  public void draw(Graphics g, int w, int h) {
    double height = height();
    draw(g, w, h, 0, (double)w/card, (double)(h-50)/height, height, 10);
  }

  // Draw tree and return x-coordinate of root

  public int draw(Graphics g, int w, int h, int leftcard,
          double xsc, double ysc, double depth, int fromy) {
    if (left != null && right != null) {    // Internal node
      double leftdepth  = depth - dleft;
      double rightdepth = depth - dright;
      int y = (int)(h - 30 - depth * ysc);
      int leftx  = left.draw(g, w, h, leftcard, xsc, ysc, leftdepth, y);
      int rightx = right.draw(g, w, h, leftcard+left.card, xsc, ysc,
                  rightdepth, y);
      g.drawLine(leftx, y, rightx, y);
      int x = (leftx + rightx) / 2;
      g.drawLine(x, y, x, fromy);
      g.fillOval(x-4, y-4, 8, 8);
      return x;
    } else {                    // Leaf node
      int x = (int)((leftcard + 0.5) * xsc);
      int y = (int)(h - 30 - depth * ysc);
      g.drawLine(x, y, x, fromy);
      g.fillOval(x-4, y-4, 8, 8);
      g.drawString(Integer.toString(lab), x-5, y+20);
      return x;
    }
  }
}


// The neighbour-joining algorithm.  Make a rooted tree by arbitrarily
// adding a root node with edges to the last two leaves

class NJ {
  int N;            // The initial number of leaves
  int K;            // The number of clusters created so far
  NJCluster[] cluster;      // The nodes (clusters) of the resulting tree
  double[] r;           // The average distance to other leaves

  public NJ(double[][] ds) {
    N = ds.length;
    cluster = new NJCluster[2*N-1];
    for (int i=0; i<N; i++)
      cluster[i] = new NJCluster(i, ds[i]);
    // System.out.println("Additive = " + checkAdditivity());
    r = new double[2*N-1];
    K = N;
    while (K < 2*N-2)
      findAndJoin();
    // Two leaves remain; cluster[K-1] is one of them, go find the other
    // Arbitrarily add a root node at this point
    int K2 = K-2;
    while (!cluster[K2].live())
      K2--;
    double dij = d(K2, K-1) / 2;
    // System.out.println("Joining " + K + "[" + dij + "] and "
    //         + (K2+1) + "[" + dij + "] to form " + (K+1));
    cluster[K] = new NJCluster(K, cluster[K2], dij, cluster[K-1], dij, null);
    K++;
  }

  void computeR() {
    for (int i=0; i<K; i++)
      if (cluster[i].live()) {
    double sum = 0;
    for (int k=0; k<K; k++)
      if (cluster[k].live() && k != i)
        sum += d(i, k);
    int L = 2 * N - K;  // The current number of leaves
    r[i] = sum / (L - 2);   // Strange, but the book says so (p 171)
      }
  }

  public NJCluster getRoot()
  { return cluster[K-1]; }

  public double d(int i, int j)
  { return cluster[Math.max(i, j)].dmat[Math.min(i, j)]; }

  void findAndJoin() { // Find closest two live clusters and join them
    computeR();
    int mini = -1, minj = -1;
    double mind = Double.POSITIVE_INFINITY;
    for (int i=0; i<K; i++)
      if (cluster[i].live())
    for (int j=0; j<i; j++)
      if (cluster[j].live()) {
        double d = d(i, j) - (r[i] + r[j]);
        if (d < mind) {
          mind = d;
          mini = i;
          minj = j;
        }
      }
    join(mini, minj);
  }

  public void join(int i, int j) { // Join i and j to form node K
    double[] dmat = new double[K];
    double dij = d(i, j);
    for (int m=0; m<K; m++)
      if (cluster[m].live() && m != i && m != j)
    dmat[m] = (d(i, m) + d(j, m) - dij) / 2;
    double dik = (dij + r[i] - r[j]) / 2;
    double djk = dij - dik;
    // System.out.println("Joining " + (i+1) + "[" + dik + "] and "
    //         + (j+1) + "[" + djk + "] to form " + (K+1));
    cluster[K] = new NJCluster(K, cluster[i], dik, cluster[j], djk, dmat);
    cluster[i].kill();
    cluster[j].kill();
    K++;
  }

  public boolean checkAdditivity() {
    for (int i=0; i<N; i++)
      for (int j=i+1; j<N; j++)
    for (int k=j+1; k<N; k++)
      for (int m=k+1; m<N; m++) {
        double dijdkm = d(i, j) + d(k, m);
        double dikdjm = d(i, k) + d(j, m);
        double dimdjk = d(i, m) + d(j, k);
        if (!(dijdkm == dikdjm && dijdkm >`= dimdjk`  
`         || dijdkm == dimdjk && dijdkm >= dikdjm`  
`         || dikdjm == dimdjk && dikdjm >= dijdkm)) {`  
`         System.out.println("(i, j, k, m) = ("+i+","+j+","+k+","+m+")");`  
`         return false;`  
`       }`  
`     }`  
`   return true;`  
` }`

}

// Displaying and printing clusters or rooted trees

class TreeFrame extends ClosableFrame {

` String title;`  
` Button printButton = new Button("Print tree");`  
` TreeCanvas tc;`

` public TreeFrame(String title, Cluster c) {`  
`   super(title);`  
`   this.title = title;`  
`   tc = new TreeCanvas(c);`  
`   add(tc, "Center");`  
`   Panel p = new Panel();`  
`   p.add(printButton);`  
`   printButton.addActionListener(new buttonListener());`  
`   add(p, "South");`  
`   pack(); show();`  
` }`

` public void setCluster(Cluster c)`  
` { tc.setCluster(c); }`

` public class buttonListener implements ActionListener {`  
`   public void actionPerformed(ActionEvent e) {`  
`     Toolkit t = getToolkit();`  
`     PrintJob pj = t.getPrintJob(TreeFrame.this, "Printing " + title, null);`  
`     `  
`     if (pj != null) {`  
`   Graphics pg = pj.getGraphics();`  
`   printAll(pg);`  
`   pg.dispose();`  
`   pj.end();`  
`     }`  
`   }`  
` }`

}

class TreeCanvas extends Canvas {

` Cluster c;`

` public TreeCanvas(Cluster c)`  
` { this.c = c; }`

` public void setCluster(Cluster c)`  
` { this.c = c; repaint(); }`

` public void paint(Graphics g) {`  
`   Dimension d = getSize();`  
`   if (c != null)`  
`     c.draw(g, d.width, d.height);`  
` }`

` public Dimension getPreferredSize()`  
` { return new Dimension(300, 300); }`

` public Dimension getMinimumSize()`  
` { return getPreferredSize(); }`

}

class CloseListener extends WindowAdapter {

`   @Override`  
` public void windowClosing(WindowEvent e) {`  
`    e.getWindow().dispose();`  
`    System.exit(0);`  
` }`

}

class ClosableFrame extends Frame {

` public ClosableFrame(String name) {`  
`   super(name);`  
`   addWindowListener(new CloseListener());`  
` }`

}

```
