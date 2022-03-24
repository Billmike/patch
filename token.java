public class token {
    public int cat;
    public String text;
    public int lineno, colno, ival;
    String sval;
    double dval;

    private String deEscape(String sin) {
        String sout = "";
        sin = sin.substring(1, sin.length()-1);
        int i = 0;
        while (sin.length() > 0) {
            char c = sin.charAt(0);
            if (c == '\\') {
                sin = sin.substring(1);
                if (sin.length() < 1) {
                    jZero.lexErr("Malformed string literal");
                } else {
                    c = sin.charAt(0);
                    switch(c) {
                        case 't':
                            sout = sout + "\t";
                            break;
                        case 'n':
                            sout = sout + "\n";
                            break;
                        default:
                            jZero.lexErr("Unrecognized escape");
                    }
                }
            } else {
                sout = sout + c;
            }
        }
        return sout;
    }
    public token(int c, String s, int i, int col) {
        cat = c;
        text = s;
        lineno = i;
        colno = col;

        switch (cat) {
            case parser.INTLIT:
                ival = Integer.parseInt(s);
                break;
            case parser.DOUBLELIT:
                dval = Double.parseDouble(s);
                break;
            case parser.STRINGLIT:
                sval = deEscape(s);
                break;
        }
    }
}