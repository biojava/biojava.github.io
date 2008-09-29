---
title: BioJava:CookbookKorean
---

BioJava In Anger - 바쁜 사람을 위한 튜토리얼과 레시피북
-------------------------------------------------------

BioJava는 거대하고 다가서기 힘든 면이 있습니다. 따라서 BioJava를 빨리
사용하고 싶은 사용자들은 해야 할 것들이 많이 존재합니다. 이 문서는
BioJava API에 대해서 모두 이해하지 않고서도 99%의 일반적인 BioJava
프로그램을 개발 할 수 있도록 돕기 위해 만들어졌습니다.

본 페이지들은 프로그래밍의 여러가지 쿡 북 형식을 참고로 하고 있으며
"어떻게 하면 되나요?" 의 형식을 취하고 있습니다. 각각의 "어떻게 하면
되나요?"의 형식은 당신이 하고 싶은것과 그에 대한 코딩 예제에 링크되어
있습니다. 기본적으로 코딩 예제를 찾아내면 당신을 그 프로그램을
복사&붙여넣기 하여 재빨리 프로그래밍 할 수 있습니다. 프로그래밍에 이해를
돕기 위해 코드에 주석을 넣는 것에 힘을 썼기 때문에 조금 커진 코딩 예제도
있습니다.

건의사항이나 질문 또는 코멘트 등이 있으면 [biojava 바이오자바 메일링
리스트](mailto:biojava-l@biojava.org)로 접근하시면 됩니다. 메일링
리스트를 구독하고 싶은 분은
[여기에서](http://biojava.org/mailman/listinfo/biojava-l) 구독하시면
됩니다.

If you re-use code from the cookbook please cite:

Announcing
----------

You can now read BioJava in Anger in
[French](Biojava:CookbookFrench "wikilink") (Translated by Sylvain
Foisy; mise à jour / updated : 28 août 2008).

You can also read Biojava in Anger in
[Portuguese](Biojava:CookbookPortuguese "wikilink") (Translated by
Dickson Guedes)

You can also read BioJava in Anger in
[Japanese](http://www.geocities.jp/bio_portal/bj_in_anger_ja/)
(Translated by Takeshi Sasayama and Kentaro Sugino, updated 14 Aug
2004).

How about simplified
[Chinese](http://www.cbi.pku.edu.cn/chinese/documents/PUMA/biojava/index-cn.html)?
(Translated by Wu Xin).

뭘 해야하나요?
--------------

### 셋업

-   [Java는 어디에서 가져와야 하나요](http://java.sun.com/downloads/)?
-   [BioJava는 어디서 다운로드해서 설치할 수
    있나요](BioJava:GetStarted "wikilink")?

### 알파벳과 심볼

-   [어떻게 DNA, RNA 또는 Protein 알파벳을 얻을 수
    있나요](Biojava:Cookbook:Alphabets "wikilink")?
-   [어떻게 커스텀 심볼로 부터 커스텀 알파벳을 만들 수
    있나요](Biojava:Cookbook:Alphabets:Custom "wikilink")?
-   [어떻게 코돈 알파벳과 같은
    크로스프로덕트알파벳(CrossProductAlphabet)을 만들 수
    있나요](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")?
-   [어떻게 컴포넌트 심볼의 크로스프로덕트(CrossProduct) 알파벳으로부터
    분해 할 수 있나요](Biojava:Cookbook:Alphabets:Component "wikilink")?
-   [어떻게 두 알파벳 또는 심볼이 같다고 말할 수
    있나요](Biojava:Cookbook:Alphabets:Cononical "wikilink")?
-   [어떻게 Y나 R과 같이 애매한 심볼을 만들 수
    있나요](Biojava:Cookbook:Alphabets:Ambiguous "wikilink")?

### 기본적인 서열 조작하기

-   [어떻게 하면 문자로 부터 서열 객체를 작성하거나 서열 객체를 문자로
    되돌릴 수 있나요](Biojava:Cookbook:Sequence "wikilink")?
-   [어떻게 서열 객체의 일부분을 가져올 수
    있나요](Biojava:Cookbook:Sequence:SubSequence "wikilink")?
-   [어떻게 DNA 서열을 RNA 서열로 전사할 수
    있나요](Biojava:Cookbook:Sequence:Transcribe "wikilink")?
-   [How do I reverse complement a DNA or RNA
    Sequence](Biojava:Cookbook:Sequence:Reverse "wikilink")?
-   [Sequences are immutable so how can I change it's
    name](Biojava:Cookbook:Sequence:ChangeName "wikilink")?
-   [How can I edit a Sequence or
    SymbolList](Biojava:Cookbook:Sequence:Edit "wikilink")?
-   [How can I make a sequence motif into a regular
    expression](Biojava:Cookbook:Sequence:Regex "wikilink")?
-   [How can I extract all regions beeing marked (or not) with a special
    feature (e.g. 'gene' or
    'CDS')](Biojava:Cookbook:Sequence:ExtractGeneRegions "wikilink")?

### 번역

-   [How do I translate a DNA or RNA Sequence or SymbolList to
    Protein](Biojava:Cookbook:Translation "wikilink")?
-   [How do I translate a single codon to a single amino
    acid](Biojava:Cookbook:Translation:Single "wikilink")?
-   [How do I use a non standard translation
    table](Biojava:Cookbook:Translation:NonStandart "wikilink")?
-   [How do I translate a nucleotide sequence in all six
    frames](Biojava:Cookbook:Translation:SixFrames "wikilink")?
-   [How do I retrieve the 1-Letter code of a translated sequence
    containing
    ambiguities](Biojava:Cookbook:Translation:OneLetterAmbi "wikilink")?

### 프로테오믹스

-   [How do I calculate the mass and pI of a
    peptide](Biojava:Cookbook:Proteomics "wikilink")?
-   [How do I analyze the symbol properties of an amino acid sequence
    using the Amino Acid Index
    database](Biojava:Cookbook:Proteomics:AAindex "wikilink")?

### 서열 입출력

-   [How do I write Sequences in Fasta
    format](Biojava:Cookbook:SeqIO:WriteInFasta "wikilink")?
-   [How do I read in a Fasta
    file](Biojava:Cookbook:SeqIO:ReadFasta "wikilink")?
-   [How do I read a GenBank/EMBL/SwissProt
    file](Biojava:Cookbook:SeqIO:ReadGES "wikilink")?
-   [How do I read a sequence file with the Biojavax
    extension](Biojava:Cookbook:SeqIO:ReadGESBiojavax "wikilink")?
-   [How do I extract GenBank/EMBL/Swissprot sequences and write them as
    Fasta](Biojava:Cookbook:SeqIO:GBtoFasta "wikilink")?
-   [How do I turn an ABI sequence trace into a BioJava
    Sequence](Biojava:Cookbook:SeqIO:ABItoSequence "wikilink")?
-   [How does sequence I/O work in
    BioJava](Biojava:Cookbook:SeqIO:Echo "wikilink")?

### 주석

-   [How do I list the Annotations in a
    Sequence](BioJava:Cookbook:Annotations:List "wikilink")?
-   [How do I filter a Sequences based on their species (or another
    Annotation
    property)](BioJava:Cookbook:Annotations:Filter "wikilink")?

### 위치 정보와 특징

-   [How do I specify a
    PointLocation](BioJava:Cookbook:Locations:Point "wikilink")?
-   [How do I specify a
    RangeLocation](BioJava:Cookbook:Locations:Range "wikilink")?
-   [How do CircularLocations
    work](BioJava:Cookbook:Locations:Circular "wikilink")?
-   [How can I make a
    Feature](BioJava:Cookbook:Locations:Feature "wikilink")?
-   [How can I filter Features by
    type](BioJava:Cookbook:Locations:Filter "wikilink")?
-   [How can I remove
    features](BioJava:Cookbook:Locations:Remove "wikilink")?

### BLAST와 FASTA

-   [어떻게 BLAST 파서를 설정
    하나요](BioJava:CookBook:Blast:Parser "wikilink")?
-   [어떻게 FASTA 파서를 설정
    하나요](BioJava:CookBook:Fasta:Parser "wikilink")?
-   [어떻게 파싱된 결과로 부터 정보를 추출
    하나요](BioJava:CookBook:Blast:Extract "wikilink")?
-   [어떻게 큰 파일을 파싱할 수 있나요;또는 어떻게 맞춤
    SearchContentHandler를 만들 수
    있나요](BioJava:CookBook:Blast:Echo "wikilink")?
-   [어떻게 XML 형태의 BLAST 결과를 HTML 페이지로 만들 수
    있나요](BioJava:CookBook:Blast:XML "wikilink")?

### 카운트와 배포

-   [How do I count the residues in a
    Sequence](BioJava:CookBook:Count:Residues "wikilink")?
-   [How do I calculate the frequency of a Symbol in a
    Sequence](BioJava:CookBook:Count:Frequency "wikilink")?
-   [How can I turn a Count into a
    Distribution](BioJava:CookBook:Count:ToDistrib "wikilink")?
-   [How can I generate a random sequence from a
    Distribution](BioJava:CookBook:Distribution:RandomSeqs "wikilink")?
-   [How can I find the amount of information or entropy in a
    Distribution](BioJava:CookBook:Distribution:Entropy "wikilink")?
-   [What is an easy way to tell if two Distributions have equal
    weights](BioJava:CookBook:Distribution:Emission "wikilink")?
-   [How can I make an OrderNDistribution over a custom
    Alphabet](BioJava:CookBook:Distribution:Custom "wikilink")?
-   [How can I write a Distribution as
    XML](BioJava:CookBook:Distribution:XML "wikilink")?
-   [Using Distributions to make a Gibbs
    sampler](BioJava:CookBook:Distribution:Gibbs "wikilink")
-   [Using Distributions to make a naive Bayes
    classifier](BioJava:CookBook:Distribution:Bayes "wikilink")
-   [How do I calculate the composition of a Sequence or collection of
    Sequences?](Biojava:CookBook:Distribution:Composition "wikilink")
    This example uses JDK 1.5 and BioJavaX

### 중요 행렬과 동적 프로그래밍

-   [How do I use a WeightMatrix to find a
    motif](BioJava:CookBook:DP:WeightMatrix "wikilink")?
-   [How do I make a HMMER like profile
    HMM](BioJava:CookBook:DP:HMM "wikilink")?
-   |How do I set up a custom HMM? (Link to
    Tutorial?? --[Guedes](User:Guedes "wikilink") 11:43, 8 February 2006
    (EST) )
-   [How do I generate a pair-wise alignment with a Hidden Markov
    Model](BioJava:CookBook:DP:PairWise "wikilink")?
-   [How do I generate a global or local alignment with the
    Needleman-Wunsch- or the
    Smith-Waterman-algorithm](BioJava:CookBook:DP:PairWise2 "wikilink")?

### 유저 인터페이스

-   [How can I visualize Annotations and Features as a
    tree](BioJava:CookBook:Interfaces:ViewAsTree "wikilink")?
-   [How can I display a Sequence in a
    GUI](BioJava:CookBook:Interfaces:ViewInGUI "wikilink")?
-   [How do I display Sequence
    coordinates](BioJava:CookBook:Interfaces:Coordinates "wikilink")?
-   [How can I display
    features](BioJava:CookBook:Interfaces:Features "wikilink")?
-   [How can I display Protein Features / a Peptide
    Digest](BioJava:CookBook:Interfaces:ProteinPeptideFeatures "wikilink")?

### BioSQL과 서열 데이터베이스

-   [How do I set up BioSQL with
    PostgreSQL?](BioJava:CookBook:BioSQL:SetupPostGre "wikilink") (by
    [David Huen](User:David "wikilink"))
-   [How do I set up BioSQL with
    Oracle?](BioJava:CookBook:BioSQL:SetupOracle "wikilink") (by
    [Richard Holland](User:Richard "wikilink"))
-   [How do I add, view and remove Sequence Objects from a BioSQL
    DB?](BioJava:CookBook:BioSQL:Manage "wikilink")
-   [How can I get a sequence straight from
    NCBI?](BioJava:CookBook:ExternalSources:NCBIFetch "wikilink")

### 유전자 알고리즘

-   [How can I make a Genetic Algorithm with
    BioJava](BioJava:CookBook:GA "wikilink")?

### 단백질 구조

-   [How can I read a PDB file?](BioJava:CookBook:PDB:read "wikilink")
-   [How can I read a .mmcif
    file?](BioJava:CookBook:PDB:mmcif "wikilink")
-   [How can I access the atoms in a
    structure?](BioJava:CookBook:PDB:atoms "wikilink")
-   [How can I do calculations on
    atoms?](BioJava:CookBook:PDB:atomsCalc "wikilink")
-   [How can I access the header information of a PDB
    file?](BioJava:CookBook:PDB:header "wikilink")
-   [How does BioJava deal with SEQRES and ATOM
    groups?](BioJava:CookBook:PDB:seqres "wikilink")
-   [How can I mutate a
    residue?](BioJava:CookBook:PDB:mutate "wikilink")
-   [How can I calculate a structure
    superimposition?](BioJava:CookBook:PDB:align "wikilink")
-   [How can I use a simple GUI to calculate a
    superimposition?](BioJava:CookBook:PDB:alignGUI "wikilink")
-   [How can I interact with
    Jmol?](BioJava:CookBook:PDB:Jmol "wikilink")
-   [How can I serialize to a
    database?](BioJava:CookBook:PDB:hibernate "wikilink")

### 온톨로지

-   [How can I parse an OBO
    file?](BioJava:CookBook:OBO:parse "wikilink")

Disclaimer
----------

This code is generously donated by people who probably have better
things to do. Where possible we test it but errors may have crept in. As
such, all code and advice here in has no warranty or guarantee of any
sort. You didn't pay for it and if you use it we are not responsible for
anything that goes wrong. Be a good programmer and test it yourself
before unleashing it on your corporate database.

Copyright
---------

The documentation on this site is the property of the people who
contributed it. If you wish to use it in a publication please make a
request through the [biojava mailing
list](mailto:biojava-l@biojava.org).

The code is [open-source](wp:Open source "wikilink"). A good definition
of open-source can be found
[here](http://www.opensource.org/docs/definition_plain.php). If you
agree with that definition then you can use it.
