---
title: BioJava:CookbookFrench:Alphabets
---

Comment obtenir un Alphabet d'ADN, d'ARN ou de Protéine?
--------------------------------------------------------

Dans BioJava, les *Alphabets* sont des collections de *Symbols*. Les
alphabets courants en biologie (ADN, ARN, protéine, etc.) sont
enregistrés avec le *AlphabetManager* de BioJava au démarrage et sont
accessibles par leur nom (DNA, RNA et PROTEIN respectivement). Les
alphabets d'ADN, d'ARN et de protéines peuvent aussi être obtenus en
utilisant des méthodes statiques retrouvées dans les classes *DNATools*,
*RNATools* et *ProteinTools* respectivement. Ces deux approches sont
utilisées dans l'exemple ci-dessous.

    import org.biojava.bio.symbol.*;
    import java.util.*;
    import org.biojava.bio.seq.*;
     
    public class AlphabetExample{
      public static void main(String[] args){
         Alphabet dna, rna, prot;
           
         // obtenir l'alphabet d'ADN par son nom
         dna = AlphabetManager.alphabetForName("DNA");
           
         // obtenir l'alphabet d'ARN par son nom
         rna = AlphabetManager.alphabetForName("RNA");
           
         // obtenir l'alphabet des acides aminés par son nom
         prot = AlphabetManager.alphabetForName("PROTEIN");
            
         //obtenir l'alphabet des acides aminés par nom, en incluant
         // le Symbol * de terminaison
         prot = AlphabetManager.alphabetForName("PROTEIN-TERM");
            
         //obtenir les mêmes alphabets à partir des classes Tools correspondantes
         dna = DNATools.getDNA();
         rna = RNATools.getRNA();
         prot = ProteinTools.getAlphabet();
            
         //en incluant le Symbol *
         prot = ProteinTools.getTAlphabet();
       }
    }
