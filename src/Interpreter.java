import generated.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

public class Interpreter {
    public static void main(String[] args) throws Exception {
        CharStream codeCharStream = CharStreams.fromFileName("test.wh");
        WHILELexer lexer = new WHILELexer(codeCharStream);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        WHILEParser parser = new WHILEParser(tokens);
        ParseTree tree = parser.program();
    }
}
