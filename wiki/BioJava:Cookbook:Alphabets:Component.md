---
title: BioJava:Cookbook:Alphabets:Component
---

How do I break Symbols from CrossProductAlphabets into their component Symbols?
-------------------------------------------------------------------------------

[CrossProductAlphabets](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")
are used to represent groups of
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
as a single Symbol. This is very useful for treating things like codons
as single
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html).
Sometimes however, you might want to covert the
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
back into their component
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html).
The following recipe demonstrates how this can be done.

The
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
from a
[CrossProductAlphabet](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")
are implementations of the
[AtomicSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AtomicSymbol.html)
interface. The prefix 'Atomic' suggests that the
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
cannot be divided so one might ask, 'how can an indivisible Symbol be
divided into it's component parts?'. The full definition of the
[AtomicSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AtomicSymbol.html)
is that it cannot be divided into a simpler Symbol that is still part of
the same
[Alphabet](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html).
The component parts of an
[AtomicSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AtomicSymbol.html)
from a
[CrossProductAlphabet](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")
are not members of the same
[Alphabet](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
so the 'Atomic' definition still stands. A [codon](wp:codon "wikilink")
would be from the (DNA x DNA x DNA) Alphabet whereas the components of
the [codon](wp:codon "wikilink")
[Symbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
are from the DNA alphabet.

Contrast this with the definition of a
[BasisSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html).
A
[BasisSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html)
can be validly divided into components that are still part of the same
[Alphabet](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html).
In this way a
[BasisSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html)
can be ambiguous. For further discussion of
[BasisSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html)
follow this link.

    <FONT COLOR="#000080"><B>package</B></FONT><FONT COLOR="#000000"> biojava_in_anger;
    <FONT COLOR="#000000">
    <FONT COLOR="#000080"><B>import</B></FONT><FONT COLOR="#000000"> java.util.*;
    <FONT COLOR="#000080"><B>import</B></FONT><FONT COLOR="#000000"> org.biojava.bio.seq.*;

    <FONT COLOR="#000080"><B>import</B></FONT><FONT COLOR="#000000"> org.biojava.bio.symbol.*;
    <FONT COLOR="#000000">
    <FONT COLOR="#000080"><B>public</B></FONT><FONT COLOR="#000000"> </FONT><FONT COLOR="#000080"><B>class</B></FONT><FONT COLOR="#000000"> BreakingComponents {
    <FONT COLOR="#000000">  </FONT><FONT COLOR="#000080"><B>public</B></FONT><FONT COLOR="#000000"> </FONT><FONT COLOR="#000080"><B>static</B></FONT><FONT COLOR="#000000"> </FONT><FONT COLOR="#000080"><B>void</B></FONT><FONT COLOR="#000000"> main(String[] args) {

    <FONT COLOR="#000000">    </FONT><FONT COLOR="#008000">//make the 'codon' alphabet</FONT><FONT COLOR="#000000">
    <FONT COLOR="#000000">    List l = Collections.nCopies(</FONT><FONT COLOR="#0000ff">3</FONT><FONT COLOR="#000000">, DNATools.getDNA());
    <FONT COLOR="#000000">    Alphabet alpha = AlphabetManager.getCrossProductAlphabet(l);
    <FONT COLOR="#000000">
    <FONT COLOR="#000000">    </FONT><FONT COLOR="#008000">//get the first symbol in the alphabet</FONT><FONT COLOR="#000000">
    <FONT COLOR="#000000">    Iterator iter = ((FiniteAlphabet)alpha).iterator();
    <FONT COLOR="#000000">    AtomicSymbol codon = (AtomicSymbol)iter.next();

    <FONT COLOR="#000000">    System.out.print(codon.getName()+</FONT><FONT COLOR="#0000ff">" is made of: "</FONT><FONT COLOR="#000000">);
    <FONT COLOR="#000000">
    <FONT COLOR="#000000">    </FONT><FONT COLOR="#008000">//break it into a list its components</FONT><FONT COLOR="#000000">
    <FONT COLOR="#000000">    List symbols = codon.getSymbols();
    <FONT COLOR="#000000">    </FONT><FONT COLOR="#000080"><B>for</B></FONT><FONT COLOR="#000000">(</FONT><FONT COLOR="#000080"><B>int</B></FONT><FONT COLOR="#000000"> i = </FONT><FONT COLOR="#0000ff">0</FONT><FONT COLOR="#000000">; i &LT; symbols.size(); i++){

    <FONT COLOR="#000000">      </FONT><FONT COLOR="#000080"><B>if</B></FONT><FONT COLOR="#000000">(i != </FONT><FONT COLOR="#0000ff">0</FONT><FONT COLOR="#000000">)
    <FONT COLOR="#000000">        System.out.print(</FONT><FONT COLOR="#0000ff">", "</FONT><FONT COLOR="#000000">);
    <FONT COLOR="#000000">      Symbol sym = (Symbol)symbols.get(i);
    <FONT COLOR="#000000">      System.out.print(sym.getName());
    <FONT COLOR="#000000">    }
    <FONT COLOR="#000000">  }

    <FONT COLOR="#000000">}
    </FONT>

Teste
-----

    package biojava_in_anger;

    import java.util.*;
    import org.biojava.bio.seq.*;
    import org.biojava.bio.symbol.*;

    public class BreakingComponents {
      public static void main(String[] args) {
        //make the 'codon' alphabet
        List l = Collections.nCopies(3, DNATools.getDNA());
        Alphabet alpha = AlphabetManager.getCrossProductAlphabet(l);

        //get the first symbol in the alphabet
        Iterator iter = ((FiniteAlphabet)alpha).iterator();
        AtomicSymbol codon = (AtomicSymbol)iter.next();
        System.out.print(codon.getName()+" is made of: ");

        //break it into a list its components
        List symbols = codon.getSymbols();
        for(int i = 0; i < symbols.size(); i++){
          if(i != 0)
            System.out.print(", ");
          Symbol sym = (Symbol)symbols.get(i);
          System.out.print(sym.getName());
        }
      }
    }
