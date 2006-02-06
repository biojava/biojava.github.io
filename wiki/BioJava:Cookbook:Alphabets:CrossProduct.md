---
title: BioJava:Cookbook:Alphabets:CrossProduct
---

How do I make a CrossProductAlphabet such as a codon Alphabet
-------------------------------------------------------------

CrossProductAlphabets result from the multiplication of other
[Alphabets](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html).
CrossProductAlphabets are used to wrap up 2 or more
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)into
a single "cross product"
[Symbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html).
For example using a 3 way cross of the [DNA](wp:DNA "wikilink") alphabet
you could wrap a [codon](wp:codon "wikilink") as a
[Symbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html).
You could then count those [codon](wp:codon "wikilink")
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
in a
[Count](http://www.biojava.org/docs/api14/org/biojava/bio/dist/Count.html)
or you could used them in a
<http://www.biojava.org/docs/api14/org/biojava/bio/dist/Distribution>.
.html Distribution].

CrossProductAlphabets can be created by name (if the component Alphabets
are registered in the AlphabetManager) or by making a list of the
desired Alphabets and creating the Alphabet from the List. Both
approaches are shown in the example below.

    import java.util.*;
    import org.biojava.bio.seq.*;
    import org.biojava.bio.symbol.*;

    public class CrossProduct {
      public static void main(String[] args) {

        //make a CrossProductAlphabet from a List
        List l = Collections.nCopies(3, DNATools.getDNA());
        Alphabet codon = AlphabetManager.getCrossProductAlphabet(l);

        //get the same Alphabet by name
        Alphabet codon2 =
            AlphabetManager.generateCrossProductAlphaFromName("(DNA x DNA x DNA)");

        //show that the two Alphabets are canonical
        System.out.println(codon == codon2);
      }
    }
