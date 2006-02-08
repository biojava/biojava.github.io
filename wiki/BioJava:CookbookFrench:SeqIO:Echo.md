---
title: BioJava:CookbookFrench:SeqIO:Echo
---

Comment fonctionne les entrées / sorties de fichiers de séquence avec Biojava?
------------------------------------------------------------------------------

La majorité de bases de données de séquences présente leur contenu aux
utilisateurs sous la forme de simples fichiers texte écrits dans un
format standardisé tel EMBL ou FASTA. Biojava peut lire un certain
nombre de ces formats pour les convertir en objets de type *Sequence*.
La classe *SeqIOTools* possède plusieurs méthodes statiques pour le
faire. C'est magnifique mais que faire si vous aviez à écrire un lecteur
(*parser*) afin de lire un fichier écrit dans un format que BioJava ne
supporte pas? Ou bien, par exemple, comment faire pour simplement
obtenir le nom de toutes les séquences contenues dans un grand fichier
sans avoir à créer autant d'objets *Sequence* afin de seulement utiliser
le méthode **getName()** et ensuite laisser le vidangeur de Java néttoyé
derrière vous? Ce ne serait pas très effice: essayer avec le fichier nr
de GenBank et prévener l'arthrite en vous tournant les pouces pendant
que le lecteur travaille fort afin d'assembler toutes l'information sous
forme de *SymbolLists*, de *Features* et d*'Annotations*! Grâce à l'API
de lecture/sortie de BioJava, il vous est tout à fait possible d'écrire
vos propres lecteurs comme il vous est possible d'utiliser vos lecteurs
comme modules supplémentaires aux lecteurs existants afin de créer une
architecture très spécialisée.

Le coeur de l'API se trouve au sein des interfaces *SequenceFormat* et
*SeqIOListener*. L'API fait appel au modèle "event/ call-back". De
manière conceptuelle, une implémentation de *SequenceFormat* sait
comment lire (et écrire) un fichier de séquence d'un certain format.
Lorsqu'il lit le fichier, il "émet" des signaux (*events*) basés sur ce
qu'il trouve dans le fichier. Ces signaux sont transmis à une
implémentation de *SeqIOListener*. L'objet *SequenceFormat* fait alors
des appels aux méthodes de l'objet *SeqIOListener*. L'objet
*SequenceFormat* fait également usage d'un *SymbolTokenizer* qui
convertit la séquence textuelle en Symbols BioJava.

L'opportunité pour la personalisation se trouve vraiment au sein de
l'implémentation de *SeqIOListener*. La documentation Javadocs de
BioJava montre qu'il existe plusieurs implémentations possible de cette
interface. Un *SeqIOListener* peut évidemment créer un objet Sequence.
Une autre chose qu'un *SeqIOListener* peut faire est de relier plusieurs
autres *SeqIOListener* ensembles en envoyant une partie des signaux à un
et une partie à un autre; ceux-ci prennent alors ces signaux et
effeectus leur propre travail. En pratique, ceci revient à créer un
filtre car le premier *SeqIOListener* peut ignorer certains signaux pour
ne conserver que ceux que vous désirez, à être envoyer à d'autres
*SeqIOListener*. Vous pourriez ainsi filtré des fichiers entiers en ne
conservant que ceux correspondant à un certain critère dans un objet
SequenceBuilder, comme par exemple les séquences provenant d'une
certaine espèce et contenant un mot-clé. Le *SeqIOListener* peut même
modifié des signaux avant de les envoyé. Ceci est particulièrement utile
si vous désirez ajouter de l'information supplémentaire pour chaque
séquence que vous être en train de construire. Pour le problème que nous
avions ci-dessus,, vous pourriez implémenter un *SeqIOListener* qui ne
retiendrait que le nom car vous y mettriez le code nécessaire dans la
méthode **setName(String name)** et ne ferait strictement rien du
reste...

L'exemple ci-dessous est une application qui affiche les signaux en
entrée/sortie sur la console en STDOUT. La classe SeqIOEcho est utile
afin de vous montrez ce qui se passe lorsqu'un fichier est lu. Elle vous
serait utile également si vous aviez à débugger une classe
*SequenceFormat* afin de vous assurez que celle-ci envoit le bon signal
au bon moment. Finalement, elle peut aussi être utile si vous aviez à
écrire un objet *SeqIOListener* spécifique en vous montrant quels
signaux vous avez à bloquer/écouter/modifier.

    /*
     * SeqIOEcho.java
     *
     * Created on May 10, 2005, 2:39 PM
     */

    import java.io.BufferedReader;
    import java.io.FileReader;
    import java.util.Iterator;
    import org.biojava.bio.Annotation;
    import org.biojava.bio.seq.Feature;
    import org.biojava.bio.seq.io.SeqIOListener;
    import org.biojava.bio.seq.io.SequenceFormat;
    import org.biojava.bio.seq.io.SymbolTokenization;
    import org.biojava.bio.symbol.Alphabet;
    import org.biojava.bio.symbol.AlphabetManager;
    import org.biojava.bio.symbol.SimpleSymbolList;
    import org.biojava.bio.symbol.Symbol;


    /**
     * Un SeqIOListener capable de rapporte les signaux émis par un objet d'un format donné
     * @auteur Mark Schreiber
     */
    public class SeqIOEcho implements SeqIOListener {
        int tab = 0;
        
        
        /** Création d'un nouvel instance de SeqIOEcho */
        public SeqIOEcho() {
            
        }

        public void setURI(String uri) {
            System.out.println(tabOut()+"Call to setURI(String uri)");
            tab++;
            System.out.println(tabOut()+"uri: "+uri);
            tab--;
        }

        public void setName(String name) {
            System.out.println(tabOut()+"Call to setName(String name)");
            tab++;
            System.out.println(tabOut()+"name: "+name);
            tab--;
        }

        public void startFeature(Feature.Template templ){
            tab++;
            System.out.println(tabOut()+"Call to startFeature(Feature.Template templ)");
            tab++;
            System.out.println(tabOut()+"type: "+templ.type);
            System.out.println(tabOut()+"source: "+templ.source);
            System.out.println(tabOut()+"location: "+templ.location);
            tab--;
        }

        public void addSymbols(Alphabet alpha, Symbol[] syms, int start, int length) {
            System.out.println(tabOut()+
                    "Call to addSymbols(Alphabet alpha, Symbol[] syms, int start, int length)");
            tab++;
            System.out.println(tabOut()+"alpha: "+alpha.getName());
            System.out.println(tabOut()+"syms.length: "+syms.length);
            System.out.println(tabOut()+"start: "+start);
            System.out.println(tabOut()+"length: "+length);
            
            SimpleSymbolList ssl = new SimpleSymbolList(alpha);
            try{
                for(int i = start; i < length; i++){
                    ssl.addSymbol(syms[i]);
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            System.out.println(tabOut()+"Symbol[]: "+ssl.seqString());
            tab--;
        }

        public void startSequence() {
            
            System.out.println(tabOut()+"Call to startSequence()");
            tab++;
        }

        public void addSequenceProperty(Object key, Object value) {
            System.out.println(tabOut()+"Call to addSequenceProperty(Object key, Object value) ");
            tab++;
            System.out.println(tabOut()+"key: "+key);
            System.out.println(tabOut()+"value: "+value);
            tab--;
        }

        public void endFeature() {
            tab--;
            System.out.println(tabOut()+"Call to endFeature()");
        }

        public void endSequence() {
            tab--;
            System.out.println(tabOut()+"Call to endSequence()");
        }

        public void addFeatureProperty(Object key, Object value) {
            System.out.println(tabOut()+"Call to addFeatureProperty(Object key, Object value)");
            tab++;
            System.out.println(tabOut()+"key: "+key);
            System.out.println(tabOut()+"value: "+value);
            tab--;
        }
        
        
        private String tabOut(){
            StringBuffer sb = new StringBuffer();
            for(int i = 0; i < tab; i++){
                sb.append("\t");
            }
            return sb.toString();
        }
        
        private void dumpAnnotation(Annotation anno){
            System.out.println(tabOut()+"Annotation: "+anno.getClass().getName());
            tab++;
            for(Iterator i = anno.keys().iterator(); i.hasNext();){
                Object key = i.next();
                Object val = anno.getProperty(key);
                System.out.println(tabOut()+"key: "+key+" value: "+val);
            }
            tab--;
        }
        
         /**
          * Execution du program. Le nom du fichier, le nom de la classe definissant 
          * le format et le nom de l'alphabet sont données en paramètres sur la ligne de commande.
          * @param args arg[0]: le fichier contenant les séquences
          * arg[1]: le nom complet et correct de la classe spécifiant le format
          * (par exemple: "org.biojava.bio.seq.io.FastaFormat")
          * arg[2]: le nom de l'alphabet en respectant la casse (eg "DNA" or "Protein");
          */
        public static void main(String[] args) throws Exception{
            BufferedReader br = new BufferedReader(new FileReader(args[0]));
            
            Class formatClass = Class.forName(args[1]);
            SequenceFormat format = (SequenceFormat)formatClass.newInstance();
            SeqIOListener echo = new SeqIOEcho();
            SymbolTokenization toke = 
                    AlphabetManager.alphabetForName(args[2]).getTokenization("token");
        
            boolean moreSeq = false;
            do{
                moreSeq = format.readSequence(br, toke, echo);
            }while(moreSeq);
            
        }
    }
