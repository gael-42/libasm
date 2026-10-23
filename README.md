*This is a 42 school project*
# Description
Libasm is a small library of libc functions rewritten in 64-bit assembly.  
It includes:
- read()
- write()
- strlen()
- strcpy()
- strdup()
- strcmp()
# Instructions
To create the .a library file :
- Clone the repository  
- Run the `make` command  

To run the tests :
- Clone the repository
- Run the `make main` command
- execute the unit_tests file `./unit_tests`  

Other commands:
- `make clean` : delete object files
- `make fclean` : delete library and test executable
- `make re` : delete and re-compile object files and executable

# Resources
["A friendly introduction to assembly for high-level programmers"](https://shikaan.github.io/assembly/x86/guide/2024/09/08/x86-64-introduction-hello.html), Manuel Spagnolo  

[x86-64 Registers and Instructions](https://math.hws.edu/eck/cs220/f22/registers.html), Hobart and William Smith Colleges Department of Mathematics and Computer Science  

[x86 and amd64 instruction reference](https://www.felixcloutier.com/x86/), Félix Cloutier  

[Assembly Language: Function Calls](https://www.cs.princeton.edu/courses/archive/spr18/cos217/lectures/15_AssemblyFunctions.pdf), Princeton University CS217 Introduction to Programming Systems
