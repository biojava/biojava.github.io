---
title: BioJava:CookbookFrench:ExternalSources:NCBIFetch
---

How do I get a sequence from NCBI?
----------------------------------

Il n'est évidemment pas toujours souhaitable de construire sa propre
base de données de séquences et, pour la plupart des utilisateurs,
l'accès aux sources publiques de données est suffisant. Une des sources
les plus importantes de données de séquence est bien entendue le NCBI
[1](http://www.ncbi.nlm.nih.gov). Depuis le début, Biojava est capable
d'aller chercher des séquences directement au NCBI en utilisant un
ensemble de classes et de méthodes, qui ont maintenant été adaptés au
modèle de séquence développé par l'extension Biojavax.

L'exemple qui suit est un point de départ pour vous permettre d'explorer
les possibilités de collecte de données. Prenez garde de ne pas
succomber à la tentation de vous construire un miroir de Genbank avec
une telle technique. Le NCBI s'en rendrait vite compte et pourrait vous
limiter votre accès...

<java> import org.biojava.bio.BioException; import
org.biojava.bio.symbol.SymbolList; import
org.biojavax.bio.db.ncbi.GenbankRichSequenceDB; import
org.biojavax.bio.seq.RichSequence;

public class NCBIFileReader {

`  public static void main(String[] args) {`  
`       `  
`     RichSequence rs = null;`  
`       `  
`     GenbankRichSequenceDB grsdb = new GenbankRichSequenceDB();`  
`     try{`  
`   // Demonstration avec un code d'acces GenBank`  
`   rs = grsdb.getRichSequence("M98343");`  
`   System.out.println(rs.getName()+" | "+rs.getDescription());`  
`   SymbolList sl = rs.getInternalSymbolList();`  
`   System.out.println(sl.seqString());`  
`           `  
`   // Demonstration avec un numero unique d'acces GenBank`  
`   rs = grsdb.getRichSequence("182086");           `  
`   System.out.println(rs.getName()+" | "+rs.getDescription());`  
`   sl = rs.getInternalSymbolList();`  
`   System.out.println(sl.seqString());`

`     }`  
`     catch(BioException be){`  
`   be.printStackTrace();`  
`   System.exit(-1);`  
`     }`  
`  }`

} </java>
