---
title: BioJava:CookbookFrench:PDB:Jmol
---

Comment faire interagir un objet de type Structure avec Jmol?
-------------------------------------------------------------

[Jmol](http://jmol.sourceforge.net) est un logiciel Java de
visualisation de structure 3D de plus en plus populaire. L'exemple qui
suit fait la démonstration de la procédure à suivre pour faire suivre
une structure BioJava vers Jmol. Un exemple plus complexe des
interactions possibles entre BioJava et Jmol se trouve [dans le
repertoire SVN de
SPICE](http://www.derkholm.net/svn/repos/spice/trunk/src/org/biojava/spice/jmol/).

<java> /\*

Jmol.jar doit etre dans votre classpath pour que cet exemple fonctionne.
Vous pouvez l'obtenir a <http://jmol.sourceforge.net>

-   /

package org.biojava.jmoltest;

import java.awt.Container; import java.awt.Dimension; import
java.awt.Graphics; import java.awt.Rectangle; import
java.awt.event.WindowAdapter; import java.awt.event.WindowEvent; import
javax.swing.JFrame; import javax.swing.JPanel; import
org.biojava.bio.structure.Structure; import
org.biojava.bio.structure.io.PDBFileReader; import
org.jmol.adapter.smarter.SmarterJmolAdapter; import
org.jmol.api.JmolAdapter; import org.jmol.api.JmolSimpleViewer;

public class SimpleJmolExample {

`   JmolSimpleViewer viewer;`  
`   Structure structure; `

`   JmolPanel jmolPanel;`  
`   JFrame frame ;`

`   public static void main(String[] args){`  
`       try {`

`           PDBFileReader pdbr = new PDBFileReader();          `  
`           pdbr.setPath("/Path/To/PDBFiles/");`

`           String pdbCode = "5pti";`

`           Structure struc = pdbr.getStructureById(pdbCode);`

`           SimpleJmolExample ex = new SimpleJmolExample();`  
`           ex.setStructure(struc);`  
`          `  
`           `  
`       } catch (Exception e){`  
`           e.printStackTrace();`  
`       }`  
`   }`

`   public SimpleJmolExample() {`  
`       frame = new JFrame();`  
`       frame.addWindowListener(new ApplicationCloser());`  
`       Container contentPane = frame.getContentPane();`  
`       jmolPanel = new JmolPanel();`  
`  `  
`       jmolPanel.setPreferredSize(new Dimension(200,200));`  
`       contentPane.add(jmolPanel);`

`       frame.pack();`  
`       frame.setVisible(true); `

`   }`  
`   public void setStructure(Structure s) {`  
`       `  
`       frame.setName(s.getPDBCode());`

`       // Procedure tres simple:`  
`       // convertir la structure en fichier PDB`  
` `  
`       String pdb = s.toPDB();`  
`      `  
`       Structure = s;`  
`       JmolSimpleViewer viewer = jmolPanel.getViewer();`

`       // Jmol peut egalment lire un fichier directement a partir`  
`       // de votre systeme de fichiers local`  
`       // Exemple:`  
`       // viewer.openFile("/Path/To/PDB/1tim.pdb");`  
` `  
`       // Expedier le fichier PDB a Jmol.`  
`       // D'autres manieres existent, necessitant plus de code. `  
`       // Voir le lien SPICE ci-dessus...`  
`       viewer.openStringInline(pdb);`  
`       viewer.evalString("select *; spacefill off; wireframe off; backbone 0.4;  ");`  
`       viewer.evalString("color chain;  ");`  
`       this.viewer = viewer;`

`   }`

`   public void setTitle(String label){`  
`       frame.setTitle(label);`  
`   }`

`   public JmolSimpleViewer getViewer(){`

`       return jmolPanel.getViewer();`  
`   }`

`   static class ApplicationCloser extends WindowAdapter {`  
`       public void windowClosing(WindowEvent e) {`  
`           System.exit(0);`  
`       }`  
`   }`

`   static class JmolPanel extends JPanel {`  
`       /**`  
`        * `  
`        */`  
`       private static final long serialVersionUID = -3661941083797644242L;`  
`       JmolSimpleViewer viewer;`  
`       JmolAdapter adapter;`  
`       JmolPanel() {`  
`           adapter = new SmarterJmolAdapter();`  
`           viewer = JmolSimpleViewer.allocateSimpleViewer(this, adapter);`  
`           `  
`       }`

`       public JmolSimpleViewer getViewer() {`  
`           return viewer;`  
`       }`

`       public void executeCmd(String rasmolScript){`  
`           viewer.evalString(rasmolScript);`  
`       }`

`       final Dimension currentSize = new Dimension();`  
`       final Rectangle rectClip = new Rectangle();`

`       public void paint(Graphics g) {`  
`           getSize(currentSize);`  
`           g.getClipBounds(rectClip);`  
`           viewer.renderScreenImage(g, currentSize, rectClip);`  
`       }`  
`   }`

} </java>
