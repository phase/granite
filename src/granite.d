module granite;
import tokenizer;
import std.stdio;
import std.file : read;
import core.stdc.stdlib : abort;

string VERSION = "0.0.1"; ///compiler version

int main(char[][] args) {
    if(args.length < 1) {
        writeln("File not specified");
        abort();
    }
    string fileName = args[0].idup;
    char[] fileContents = cast(char[]) read(fileName);
    tokenize(fileContents);
    return 0;
}