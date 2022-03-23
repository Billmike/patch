public class token {
    public int cat;
    public String text;
    public int lineno;
    public token(int c, String s, int i) {
        cat = c;
        text = s;
        lineno = i;
    }
}