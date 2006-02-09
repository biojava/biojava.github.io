---
title: BioJava:CookbookFrench:Distribution:XML
---

Comment écrire une Distribution en format XML?
----------------------------------------------

Si vous construisez fréquemment des *Distributions* à partir de grands
ensembles de données d'entrainement pour analyse, il est souhaitable de
stocker ces *Distributions* pour un usage futur. Une possibilité est de
sérialiser la distribution en format binaire. Cette sérialisation, si
elle est idéale pour le stockage à court terme ou la communication entre
Machines Virtuelles Java, est fragile et sujette à se briser entre
différentes versions de BioJava. De plus, c'est un format impossible à
vérifier pour l'oeil du programmeur. Une meilleure solution est d'écrire
la *Distribution* en format XML, se qui assure une solution à long
terme, lisible par le programmeur et indépendante du language de
programmation utilisé.

L'exemple suivant montre comment une *Distribution* peut être écrite en
XML et lûe à nouveau. Cet exemple demande une version récente BioJava
puisque les classes *XMLDistributionWriter* et *XMLDistributionReader*
sont de nouvelles additions. La version 1.3 ou plus récente est
suffisante.

    import java.io.*;

    import org.biojava.bio.dist.*;
    import org.biojava.bio.seq.*;

    public class Dist2XMLandBack {
    public static void main(String[] args) {    
        XMLDistributionWriter writer = new XMLDistributionWriter();
        XMLDistributionReader reader = new XMLDistributionReader();

        try {
          File temp = File.createTempFile("xmltemp",".xml");

          //créer une Distribution à écrire
          Distribution d =
              DistributionFactory.DEFAULT.createDistribution(DNATools.getDNA());

          //donner à la Distribution des valeurs aléatoires
          DistributionTools.randomizeDistribution(d);

          //écrire sur "temp"
          writer.writeDistribution(d, new FileOutputStream(temp));

          //lire le XML
          Distribution d2 = reader.parseXML(new FileInputStream(temp));

          //vérifier ques les valeurs sont reproduites
          boolean b = DistributionTools.areEmissionSpectraEqual(d,d2);
          System.out.println("Are values reproduced? "+b);
        }

        catch (Exception ex) {
          ex.printStackTrace();
        }
      }
    }
