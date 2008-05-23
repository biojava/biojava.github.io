---
title: BioJava:CookBook:PDB:hibernate
---

How to serialize a protein structure to a database
--------------------------------------------------

There is an add-on to BioJava that provides
[Hibernate](http://www.hibernate.org) mappings for the protein structure
classes at [BioJava Structure
Hibernate](http://www.spice-3d.org/hibernatePDB/). It mainly consists of
the Hibernate mappings files,with a few Java helper classes.

I am not sure if this code should be joint with the core BioJava SVN,
but then BioJava should not directly depend on
Hibernate... --[Andreas](User:Andreas "wikilink") 17:42, 8 October 2007
(EDT)

If you have BioJava Structure Hibernate installed, you can do something
like:

See also the [example
page](http://www.spice-3d.org/hibernatePDB/examples.jsp)

<java>

import org.biojava.bio.structure.Chain; import
org.biojava.bio.structure.Compound; import
org.biojava.bio.structure.Group; import
org.biojava.bio.structure.Structure; import
org.biojava.bio.structure.hibernate.HibernateUtil; import
org.biojava.bio.structure.hibernate.StructureFile; import
org.biojava.bio.structure.io.PDBFileReader; import
org.hibernate.HibernateException; import org.hibernate.Session; import
java.io.File; import java.io.FileFilter; import java.util.ArrayList;
import java.util.List;

/\*\* A class that finds all PDB files from the filesystem and stores
them in the database.

`* A current release of PDB (2007 - September) takes about one night for an upload`  
`* (without the atoms).`  
`* `  
`*`  
`*/`

public class DemoWritePDBFiles {

`   public static void main(String[] args) {`  
`   `  
`       // init log4j`  
`       //org.apache.log4j.BasicConfigurator.configure();`

`       if (args.length < 1 ) {`  
`           System.err.println("please provide PDB directory as argument");`  
`           System.exit(0);`  
`       }`

// init the installation

`       File pdbLocation = new File(args[0]);`

`       System.out.println("searching in " + pdbLocation);`

`       // init the demo class`  
`       DemoWritePDBFiles demo = new DemoWritePDBFiles();`  
`       `  
`       // now we find all PDB files under the provided directory`  
`       List`<File>` pdbfiles = demo.getAllPDB(pdbLocation);`  
`       System.out.println("serializing "+ pdbfiles.size() + " PDB files...");`  
`       try {`  
`           demo.storeFiles(pdbfiles);`  
`       } catch (Exception e) {`  
`           e.printStackTrace();`  
`       }`  
`       `  
`   }`

`   /** get all PDBfiles from a directory`  
`    * `  
`    * @param dir the directory where the PDB files are located`  
`    * @return all PDB files`  
`    */`  
`   public  List`<File>` getAllPDB(File dir)  {`

`       List`<File>` allpdbs = new ArrayList`<File>`();`

`       if ( ! dir.isDirectory()){`  
`           throw new IllegalArgumentException("path is not a directory " + dir);`  
`       }`

`       //  This filter only returns directories`  
`       FileFilter fileFilter = new FileFilter() {`  
`           public boolean accept(File file) {`  
`               return file.isDirectory();`  
`           }`  
`       };`  
`       File[] subfiles = dir.listFiles(fileFilter);`

`       for (File f: subfiles){`  
`           List`<File>` pdbs = getAllPDB(f);`  
`           allpdbs.addAll(pdbs);`

`       }`

`       String[] all = dir.list();`

`       for (int i = 0 ; i < all.length;i++ ){`  
`           // filenames are like 'pdb1234.ent.gz'`  
`           String file = all[i];`  
`           if ( (file.endsWith(".pdb.gz")) || `  
`                   ( file.endsWith(".ent.gz")) ||`  
`                   (file.endsWith(".pdb")) ||`  
`                   (file.endsWith(".ent"))                                 `  
`           ){`  
`               allpdbs.add(new File(dir+File.separator + file));`  
`           }`  
`       }`

`       return allpdbs;`  
`   }`

`   /** upload the set of PDB files into the database`  
`    * `  
`    * @param pdbfiles - list of PDBFiles`  
`    * @throws HibernateException`  
`    */`  
`   public void storeFiles(List`<File>` pdbfiles) throws HibernateException{`  
`       //Object ownership = HibernateSession.createSession();`  
`       //Session session = HibernateSession.getSession();`  
`       int l = pdbfiles.size();`

`       //long loopStart = System.currentTimeMillis();`  
`       PDBFileReader pdbreader = new PDBFileReader();`

`       int i=0;`  
`       for (File f: pdbfiles){`  
`           i++;`  
`           `  
`           System.out.println(f);`  
`           StructureFile struFile = new StructureFile();`  
`           struFile.setPath(f.toString());`

`           System.out.println("# "+i + " / " + l + " " + f);`  
`           try {`  
`               `  
`               // associate the biojava Structure container class with`  
`               // the location of the PDB file in the filesystem               `  
`               Structure s = pdbreader.getStructure(f);`  
`               struFile.setPDBCode(s.getPDBCode());`  
`               struFile.setStructure(s);`

`               // now we write it`  
`               createAndStoreStructure(struFile);`

`           } catch (Exception e){`  
`               e.printStackTrace();`  
`           }`

`       }`  
`   }`

`   /** does the actual Hibernate serialisation`  
`    * `  
`    * @param struFile `  
`    */`  
`   private void createAndStoreStructure(StructureFile struFile ) {`  
`       //System.out.println(s);`

`       Structure s = struFile.getStructure();`

`       // open a new Hibernate session`  
`       Session session = HibernateUtil.getSessionFactory().openSession();`  
`       session.beginTransaction();`

`       //System.err.println("saving struc");`  
`       for (Compound compound : s.getCompounds()){`  
`           session.save(compound);`  
`       }`  
`       `  
`       // save the toplevel container`  
`       session.saveOrUpdate(s);`  
`       `  
`       `  
`       // save the file path`  
`       session.saveOrUpdate(struFile);`  
`       `  
`       for (Chain chain:s.getChains(0)){   `  
`           `  
`           session.saveOrUpdate(chain);`  
`           `  
`           for (Group g: chain.getAtomGroups()){   `  
`               g.setParent(chain);`  
`               session.saveOrUpdate(g);    `  
`               `  
`               /* at the moment writing Atoms is very slow,`  
`                * it needs some more optimization ... :-(`  
`                * patches are welcome!`  
`                * `  
`                * Therefore by default writing the Atoms is disabled.`  
`                * if you want to do that, uncomment these lines, as well as the `  
`                * lines in HetatomImpl.hbm.xml`  
`                */`  
`                //for ( Atom a: g.getAtoms())`  
`                //     session.saveOrUpdate(a);`  
`               `  
`               `  
`           }`  
`           //System.err.println("saving groups seqres");`  
`           for (Group g: chain.getSeqResGroups()){`  
`               g.setParent(chain);`  
`               session.saveOrUpdate(g);                `  
`               `  
`               /* see above`  
`                */`  
`                //for ( Atom a: g.getAtoms())                  `  
`               //  session.saveOrUpdate(a);`  
`               `  
`           }`  
`       }`  
`       `  
`       `  
`       `  
`       session.flush();`  
`       `  
`       session.getTransaction().commit();`  
`       session.clear();        `  
`       `  
`       HibernateUtil.getSessionFactory().close();`  
`       `

`   }`

} </java>
