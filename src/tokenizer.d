module tokenizer;
import std.string;
import std.array;
import std.regex;

class Token {
    static const Token END_STATEMENT = new Token(";");
    static const Token ASSIGNMENT = new Token("=");
    
    static auto IDENTIFIER_REGEX = ctRegex!(`[a-zA-Z][a-zA-Z0-9]*`);

    string identifier;
    string value;
    
    this(string i) {
        this.identifier = i;
        this.value = "";
    }
    
    this(string i, string v){
        this.identifier = capitalize(i);
        this.value = v;
    }
    
    string getIdentifier() {
        return identifier;
    }
    
    string getValue() {
        return value;
    }
    
    const Token dup() {
        return new Token(identifier, value);
    }
    
    override string toString() {
        if(value == "") return identifier;
        else return identifier ~ "[" ~ value ~ "]";
    }
}

Token getToken(string b) {
    auto identifierMatch = matchFirst(b, Token.IDENTIFIER_REGEX);
    if(!identifierMatch.empty) return new Token("identifier", b);
    return new Token("nonop", b);
}

void tokenize(char[] s) {
    Token[] tokens;
    char[] buffer;
    
    foreach(c;s) {
        if(c == ' ' || c == '\n' || c == ';') {
            tokens ~= getToken(buffer.idup);
            if(c == ';') tokens ~= Token.END_STATEMENT.dup();
            //TODO Reset buffer
        }
    }
}