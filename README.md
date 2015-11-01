#Granite
The Granite Programming Language & other stuff relating to it.


##Why another language?
Compilers are fun to make.


##Ideas
It will transcompile to C, and compiler will be written in D. 


###Data Types
type|size|range
----|----|-----
byte | 1 byte  | -128 to 127
ubyte | 1 byte | 0 to 255
short | 2 bytes | -32,768 to 32,767
ushort | 2 bytes | 0 to 65,535
int | 4 bytes | -2,147,483,648 to 2,147,483,647
uint | 4 bytes | 0 to 4,294,967,295

###Hello World
```c
//imports take local files over installed headers
    //i.e. search through local files for this, if found
    //use ""; if not found, use <>
import stdio

//return void is implied
main() {
    //optional semicolons
    printf("Hello, World!")
}
```
Gets compiled to
```c
#include <stdio.h>

void main() {
    printf("Hello, World!");
}
```

###Mixins
Mixins allow you to specify new tokens that add in code.

```c
#mixin TOKEN printf("This is in a token")
main() {
    TOKEN
}
```
You can access local and global variables by name, because the compiler just inlines the code.
```c
#mixin W printf("%d",w);

main() {
    W //throws error
    int w = 7;
    W //prints 7
}
```