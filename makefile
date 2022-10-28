#assignment_a
target/assignment_a/Example1.h target/assignment_a/Example1.class: src/assignment_a/Example1.java
	javac -h target/assignment_a/ -d target/assignment_a/ src/assignment_a/Example1.java

# !care! the "-I${JAVA_HOME}/include/win32" is (as the name suggests) os dependent, change if needed, im not building os detection into this thing ^^
# on a related note (cited from ${JAVA_HOME}/include/win32/jni_md.h):
# 		// 'long' is always 32 bit on windows so this matches what jdk expects
#		typedef long jint;
# spoiler: long was not 32 bit on my windows machine =) - that was fun
# + this isn't even guaranteed by the standard, it only guarantees a minimum bitwidth, please if you rely on an exact bitwidth use a guaranteed bitwidth type ^^ @whoever_built_this
target/assignment_a/Example1.dll: target/assignment_a/Example1.h src/assignment_a/Example1.cpp
	g++ -c "-I${JAVA_HOME}/include" "-I${JAVA_HOME}/include/win32" src/assignment_a/Example1.cpp -o target/assignment_a/Example1.o
	g++ -shared -o target/assignment_a/Example1.dll target/assignment_a/Example1.o -Wl,--add-stdcall-alias

runA: target/assignment_a/Example1.h target/assignment_a/Example1.class target/assignment_a/Example1.dll
	cd target/assignment_a/ && java Example1 && cd ../..

buildA: target/assignment_a/Example1.dll target/assignment_a/Example1.class

#assignment_b
target/assignment_b/java/Interface.class: src/assignment_b/java/Interface.java
	javac -d target/assignment_b/java/ src/assignment_b/java/Interface.java

target/assignment_b/java/InterfaceImpl.class: src/assignment_b/java/InterfaceImpl.java target/assignment_b/java/Interface.class
	javac -cp target/assignment_b/java/ -d target/assignment_b/java/ src/assignment_b/java/InterfaceImpl.java

target/assignment_b/java/InterfaceImplTest.class: src/assignment_b/java/InterfaceImplTest.java target/assignment_b/java/InterfaceImpl.class
	javac -cp target/assignment_b/java/ -d target/assignment_b/java/ src/assignment_b/java/InterfaceImplTest.java

run_iitest_java: target/assignment_b/java/InterfaceImplTest.class
	cd target/assignment_b/java/ && java InterfaceImplTest && cd ../../../

#assignment_d
target/assignment_d:
	mkdir -p target/assignment_d/

target/assignment_d/GeneratedInterface.java: src/assignment_c/InterfaceDecl.yml2 src/assignment_d/javaInterface.ysl2 target/assignment_d
	cd src && ${YML2_PATH}/yml2/yml2proc -y assignment_d/javaInterface.ysl2 assignment_c/InterfaceDecl.yml2 -o ../target/assignment_d/GeneratedInterface.java && cd ../.. 

target/assignment_d/GeneratedInterfaceImpl.java: src/assignment_c/InterfaceDecl.yml2 src/assignment_c/InterfaceDecl.yml2 target/assignment_d
	cd src && ${YML2_PATH}/yml2/yml2proc -y assignment_d/javaInterfaceImpl.ysl2 assignment_c/InterfaceDecl.yml2 -o ../target/assignment_d/GeneratedInterfaceImpl.java && cd ../..

buildD: target/assignment_d/GeneratedInterface.java target/assignment_d/GeneratedInterfaceImpl.java
	javac -h target/assignment_d/ target/assignment_d/GeneratedInterface.java  target/assignment_d/GeneratedInterfaceImpl.java

#assignment_e
target/assignment_e/InterfaceImplTest.exe: src/assignment_e/InterfaceImplTest.cpp
	mkdir -p target/assignment_e
	g++ src/assignment_e/InterfaceImplTest.cpp -o target/assignment_e/InterfaceImplTest.exe 

run_iitest_cpp: target/assignment_e/InterfaceImplTest.exe
	target/assignment_e/InterfaceImplTest.exe

#assignment_f
target/assignment_f:
	mkdir -p target/assignment_f/

target/assignment_f/GeneratedInterface.h: src/assignment_c/InterfaceDecl.yml2 src/assignment_f/cppInterface.ysl2 target/assignment_f
	cd src && ${YML2_PATH}/yml2/yml2proc -y assignment_f/cppInterface.ysl2 assignment_c/InterfaceDecl.yml2 -o ../target/assignment_f/GeneratedInterface.h && cd ../..

target/assignment_f/cppInterfaceSkeleton.cpp: src/assignment_c/InterfaceDecl.yml2 src/assignment_f/cppInterfaceSkeleton.ysl2 target/assignment_f
	cd src && ${YML2_PATH}/yml2/yml2proc -y assignment_f/cppInterfaceSkeleton.ysl2 assignment_c/InterfaceDecl.yml2 -o ../target/assignment_f/cppInterfaceSkeleton.cpp && cd ../..

buildF: target/assignment_f/GeneratedInterface.h target/assignment_f/cppInterfaceSkeleton.cpp target/assignment_f


#utils
clean:
	cd target && rm -r ./* && cd ..

delete_yml2:
	cd ${YML2_PATH} && rm -rf yml2

clone_yml2:
	cd ${YML2_PATH} && git clone https://gitea.pep.foundation/fdik/yml2.git