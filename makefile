target\Example1.h target\Example1.class: src\Example1.java
	javac -h target -d target src/Example1.java

# !care! the "-I${JAVA_HOME}/include/win32" is (as the name suggests) os dependent, change if needed, im not building os detection into this thing ^^
# on a related note (cited from ${JAVA_HOME}/include/win32/jni_md.h):
# 		// 'long' is always 32 bit on windows so this matches what jdk expects
#		typedef long jint;
# spoiler: long was not 32 bit on my windows machine =) - that was fun
# + this isn't even guaranteed by the standard, it only guarantees a minimum bitwidth, please if you rely on an exact bitwidth use a guaranteed bitwidth type ^^ @whoever_built_this
target\Example1.dll: target\Example1.h src\Example1.cpp
	g++ -c "-I${JAVA_HOME}/include" "-I${JAVA_HOME}/include/win32" src/Example1.cpp -o target/Example1.o
	g++ -shared -o target/Example1.dll target/Example1.o -Wl,--add-stdcall-alias

target/InterfaceImplTest.exe: src/InterfaceImplTest.cpp
	g++ src/InterfaceImplTest.cpp -o target/InterfaceImplTest.exe
target\Interface.class: src/Interface.java
	javac -d target src/Interface.java
target\InterfaceImpl.class: src/InterfaceImpl.java target\Interface.class
	javac -cp target -d target src/InterfaceImpl.java
target\InterfaceImplTest.class: src/InterfaceImplTest.java target\InterfaceImpl.class
	javac -cp target -d target src/InterfaceImplTest.java


run_iitest_cpp: target/InterfaceImplTest.exe
	target/InterfaceImplTest.exe
run_iitest_java: target\InterfaceImplTest.class
	cd target && java InterfaceImplTest && cd ..

run: target\Example1.dll target\Example1.class
	cd target && java Example1 && cd ..

clean:
	cd target && rm ./* && cd ..