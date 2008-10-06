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

<java> import org.biojava.bio.symbol.\*; import java.util.\*; import
org.biojava.bio.seq.\*;

public class AlphabetExample {

` public static void main(String[] args) {`  
`   Alphabet dna, rna, prot;`

`   //이름으로 DNA 알파벳 얻기`  
`   dna = AlphabetManager.alphabetForName("DNA");`

`   //이름으로 RNA 알파벳 얻기`  
`   rna = AlphabetManager.alphabetForName("RNA");`

`   //이름으로 단백질 알파벳 얻기`  
`   prot = AlphabetManager.alphabetForName("PROTEIN");`  
`   //종료 심볼을 포함한 단백질 알파벳 얻기`  
`   prot = AlphabetManager.alphabetForName("PROTEIN-TERM");`

`   //같은 알파벳을 Tools 클래스로 부터 얻기`  
`   dna = DNATools.getDNA();`  
`   rna = RNATools.getRNA();`  
`   prot = ProteinTools.getAlphabet();`  
`   //or the one with the * symbol`  
`   prot = ProteinTools.getTAlphabet();`

` }`

} </java>
