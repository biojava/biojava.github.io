---
title: BioJava:CookbookFrench:Blast:Parser
---

Comment lire les résultats d'un fichier BLAST?
----------------------------------------------

La plus grande part du crédit pour cet exemple revient à Keith James.

Une des tâches les plus fréquentes en bio-informatique est la production
de résultats de comparaison de séquences avec BLAST. BioJava est capable
lire les fichiers de sortie "BLAST-like" provenant de BLAST et de HMMER
en utilisant un truc qui transforme les sorties BLAST en évènements SAX
qui sont "écoutés" par des écouteurs (*listeners*) enregistrés.

Voici le pipeline de base:

Blast\_sortie -\> Génère les SAX events --\> Convertit les SAX
events --\> Construit les objets à partir des résultats --\> Stockage
des objets dans une liste.

En pratique, ça donne le processus suivant:

InputStream--\> BLASTLikeSAXParser --\> SeqSimilartyAdapter --\>
BlastLikeSearchBuilder --\> List

L'API est très flexible mais dans la plupart des cas, la recette qui
suit vous donnera les résultats que vous recherchez.

    import java.io.*;
    import java.util.*;

    import org.biojava.bio.program.sax.*;
    import org.biojava.bio.program.ssbind.*;
    import org.biojava.bio.search.*;
    import org.biojava.bio.seq.db.*;
    import org.xml.sax.*;
    import org.biojava.bio.*;

    public class BlastParser {
      /**
       * args[0] est assumé être le nom du fichier de sortie BLAST */
      public static void main(String[] args) {
        try {
          //obtenir les entrées Blast sous la forme de Stream
          InputStream is = new FileInputStream(args[0]);

          //construire un BlastLikeSAXParser
          BlastLikeSAXParser parser = new BlastLikeSAXParser();

          //construire un adaptateur pour SAX event qui les passera a un Handler.
          SeqSimilarityAdapter adapter = new SeqSimilarityAdapter();

          //initialiser l'adaptateur des SAX events  de l'objet parser
          parser.setContentHandler(adapter);

          //la liste qui contiendra les SeqSimilaritySearchResults
          List results = new ArrayList();

          //créer le SearchContentHandler qui construira les SeqSimilaritySearchResults
          //dans la liste results
          SearchContentHandler builder = new BlastLikeSearchBuilder(results,
              new DummySequenceDB("queries"), new DummySequenceDBInstallation());

          //enregistrer builder aupres de adapter
          adapter.setSearchContentHandler(builder);

          //parcourir le fichier; après, la liste result contiendra
          //les SeqSimilaritySearchResults

          parser.parse(new InputSource(is));
          formatResults(results);
        }
        catch (SAXException ex) {
          //probleme de XML
          ex.printStackTrace();
        }catch (IOException ex) {
          //probleme de IO, comme un fichier introuvable
          ex.printStackTrace();
        }
      }
