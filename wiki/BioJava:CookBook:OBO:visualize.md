---
title: BioJava:CookBook:OBO:visualize
---

<java> /\*\*

`* @author Andreas Dräger Universität Tübingen.`  
`* @since 1.8`  
`*/`

public class OBO2GraphViz {

`   Ontology ontology;`  
`   List`<String>` arcs;`  
`   Set`<Term>` nodes;`

`   public OBO2GraphViz(String oboFileName, String ontoName,`  
`           String ontoDescription, String root) throws ParseException,`  
`           FileNotFoundException, IOException {`  
`       OboParser parser = new OboParser();`  
`       ontology = parser.parseOBO(new BufferedReader(new FileReader(`  
`               oboFileName)), ontoName, ontoDescription);`  
`       arcs = new Vector`<String>`();`  
`       nodes = new HashSet`<Term>`();`  
`       traverse(ontology.getTerm(root));`  
`       System.out.print("digraph ");`  
`       System.out.print(ontology.getName());`  
`       System.out.println(" {");`  
`       for (Term t : nodes) {`  
`           System.out.print("  ");`  
`           System.out.print(t.getName().replace(":", ""));`  
`           System.out.println(" [label=\""`  
`                   + lineBreaks(t.getDescription(), 18) + "\"];");`  
`       }`  
`       for (String arc : arcs) {`  
`           System.out.print("  ");`  
`           System.out.println(arc);`  
`       }`  
`       System.out.println('}');`  
`   }`

`   /**`  
`    * Inserts line breaks within the given string.`  
`    * `  
`    * @param orig`  
`    * @param length`  
`    * @return`  
`    */`  
`   private String lineBreaks(String orig, int length) {`  
`       StringBuffer out = new StringBuffer();`  
`       // Symol \u00e4 is a German umlaut a, a letter that will`  
`       // normally not occur in our original Strings.`  
`       String tmp = orig.replace("\\,", ",").replace(" ", " \u00e4");`  
`       tmp = tmp.replace("-", "-\u00e4");`  
`       String parts[] = tmp.contains("\u00e4") ? tmp.split("\u00e4")`  
`               : new String[] { orig };`  
`       for (int i = 0, curr = 0; i < parts.length; i++) {`  
`           String part = parts[i];`  
`           if ((part.length() + curr >= length)`  
`                   || (i < parts.length - 1 && part.length()`  
`                           + parts[i + 1].length() + curr >= length)) {`  
`               out.append(part.trim());`  
`               out.append("\\n");`  
`               curr = 0;`  
`           } else {`  
`               out.append(part);`  
`               curr += part.length();`  
`           }`  
`       }`  
`       return out.toString();`  
`   }`

`   private void traverse(Term subject) {`  
`       Set`<Triple>` triples = ontology.getTriples(null, subject, null);`  
`       String arc;`  
`       for (Triple triple : triples) {`  
`           nodes.add(triple.getSubject());`  
`           nodes.add(triple.getObject());`  
`           arc = triple.toString().replace(triple.getPredicate().getName(),`  
`                   "->").replace(":", "");`  
`           if (!arcs.contains(arc))`  
`               arcs.add(arc);`  
`           traverse(triple.getSubject());`  
`       }`  
`   }`

`   /**`  
`    * @param args`  
`    */`  
`   public static void main(String[] args) {`  
`       try {`  
`           new OBO2GraphViz(args[0], args[1], args[2], args[3]);`  
`       } catch (ParseException e) {`  
`           e.printStackTrace();`  
`       } catch (FileNotFoundException e) {`  
`           e.printStackTrace();`  
`       } catch (IOException e) {`  
`           e.printStackTrace();`  
`       }`  
`   }`

} </java>
