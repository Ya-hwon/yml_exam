default:
    just --list
test:
    echo test
java_compile:
    javac -h target -d target src/Example1.java
library_gen:
    g++ -c "-I${JAVA_HOME}/include" "-I${JAVA_HOME}/include/win32" src/Example1.cpp -o target/Example1.o
    g++ -shared -o target/Example1.dll target/Example1.o -Wl,--add-stdcall-alias
java_run:
    cd target && java Example1 && cd ..