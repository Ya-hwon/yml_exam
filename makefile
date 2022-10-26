target/Example1.h target/Example1.class: src/assignment_a/Example1.java
	javac -h target -d target src/assignment_a/Example1.java

# !care! the "-I${JAVA_HOME}/include/win32" is (as the name suggests) os dependent, change if needed, im not building os detection into this thing ^^
# on a related note (cited from ${JAVA_HOME}/include/win32/jni_md.h):
# 		// 'long' is always 32 bit on windows so this matches what jdk expects
#		typedef long jint;
# spoiler: long was not 32 bit on my windows machine =) - that was fun
# + this isn't even guaranteed by the standard, it only guarantees a minimum bitwidth, please if you rely on an exact bitwidth use a guaranteed bitwidth type ^^ @whoever_built_this
target/Example1.dll: target/Example1.h src/assignment_a/Example1.cpp
	g++ -c "-I${JAVA_HOME}/include" "-I${JAVA_HOME}/include/win32" src/assignment_a/Example1.cpp -o target/Example1.o
	g++ -shared -o target/Example1.dll target/Example1.o -Wl,--add-stdcall-alias

target/InterfaceImplTest.exe: src/assignment_b/InterfaceImplTest.cpp
	g++ src/assignment_b/InterfaceImplTest.cpp -o target/InterfaceImplTest.exe

target/Interface.class: src/assignment_b/Interface.java
	javac -d target src/assignment_b/Interface.java

run_iitest_cpp: target/InterfaceImplTest.exe
	target/InterfaceImplTest.exe

build: target/Example1.dll target/Example1.class

run: target/Example1.dll target/Example1.class
	cd target && java Example1 && cd ..

clean:
	cd target && rm ./* && cd ..


###############################################################

# sollte der überordner von dem projekt hier sein, für linux sind die beiden identisch
# in meinem Fall:
# YML2_PATH=/cygdrive/d/Data/GHProj
# YML2_PATH_w=D:/Data/GHProj

delete_yml2:
	cd ${YML2_PATH} && rm -rf yml2

clone_yml2:
	cd ${YML2_PATH} && git clone https://gitea.pep.foundation/fdik/yml2.git

interface_gen:
	cd src && ${YML2_PATH_w}/yml2/yml2proc -y javaInterface.ysl2 InterfaceDecl.yml2 -o ../target/GeneratedInterface.java && cd ..
	cd src && ${YML2_PATH_w}/yml2/yml2proc -y cppInterface.ysl2 InterfaceDecl.yml2 -o ../target/GeneratedInterface.h && cd ..
	cd src && ${YML2_PATH_w}/yml2/yml2proc -y javaInterfaceImpl.ysl2 InterfaceDecl.yml2 -o ../target/GeneratedInterfaceImpl.java && cd ..
	cd src && ${YML2_PATH_w}/yml2/yml2proc -y cppInterfaceSkeleton.ysl2 InterfaceDecl.yml2 -o ../target/cppInterfaceSkeleton.cpp && cd ..

target/GeneratedInterfaceImpl.h: interface_gen
	javac -h target -d target target/GeneratedInterface.java  target/GeneratedInterfaceImpl.java

###############################################################

all: build interface_gen target/InterfaceImplTest.exe target/Interface.class target/GeneratedInterfaceImpl.h