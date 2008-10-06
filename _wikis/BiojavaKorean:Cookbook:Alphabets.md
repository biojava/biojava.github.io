---
title: BiojavaKorean:Cookbook:Alphabets
---

어떻게 DNA, RNA 또는 단백질 알파벳을 얻을 수 있나요?
----------------------------------------------------

BioJava에서의
[알파벳](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)은
[심볼](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)의
컬렉션이다. 일반적인 생물학적 알파벳들([DNA](wp:DNA "wikilink"),
[RNA](wp:RNA "wikilink"), [단백질](wp:protein "wikilink") 등)은
BioJava의
[AlphabetManager](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AlphabetManager.html)에서
이름으로 접근할 수 있다. [DNA](wp:DNA "wikilink"),
[RNA](wp:RNA "wikilink") [[wp:protein|단백질] 알파벳은 또한 편리하게
[DNATools](http://www.biojava.org/docs/api14/org/biojava/bio/seq/DNATools.html),
[RNATools](http://www.biojava.org/docs/api14/org/biojava/bio/seq/RNATools.html),
P[ProteinTools](http://www.biojava.org/docs/api14/org/biojava/bio/seq/ProteinTools.html)
static 메소드로 편리하게 접근해서 사용할 수 있다.

이러한 접근 예제는 다음과 같다.

In BioJava
[Alphabets](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
are collections of
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html).
Common biological alphabets ([DNA](wp:DNA "wikilink"),
[RNA](wp:RNA "wikilink"), [protein](wp:protein "wikilink"), etc) are
registered with the BioJava
[AlphabetManager](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AlphabetManager.html)
at startup and can be accessed by name. The [DNA](wp:DNA "wikilink"),
[RNA](wp:RNA "wikilink") and [protein](wp:protein "wikilink") alphabets
can also be accessed using convenient static methods from
[DNATools](http://www.biojava.org/docs/api14/org/biojava/bio/seq/DNATools.html),
[RNATools](http://www.biojava.org/docs/api14/org/biojava/bio/seq/RNATools.html)
and
[ProteinTools](http://www.biojava.org/docs/api14/org/biojava/bio/seq/ProteinTools.html)
respectively.

Both of these approaches are shown in the example below

<java> import org.biojava.bio.symbol.\*; import java.util.\*; import
org.biojava.bio.seq.\*;

public class AlphabetExample {

` public static void main(String[] args) {`  
`   Alphabet dna, rna, prot;`

`   //get the DNA alphabet by name`  
`   dna = AlphabetManager.alphabetForName("DNA");`

`   //get the RNA alphabet by name`  
`   rna = AlphabetManager.alphabetForName("RNA");`

`   //get the Protein alphabet by name`  
`   prot = AlphabetManager.alphabetForName("PROTEIN");`  
`   //get the protein alphabet that includes the * termination Symbol`  
`   prot = AlphabetManager.alphabetForName("PROTEIN-TERM");`

`   //get those same Alphabets from the Tools classes`  
`   dna = DNATools.getDNA();`  
`   rna = RNATools.getRNA();`  
`   prot = ProteinTools.getAlphabet();`  
`   //or the one with the * symbol`  
`   prot = ProteinTools.getTAlphabet();`

` }`

} </java>
