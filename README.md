# Dependencies
make (auf windows über cygwin)
g++ (auf windows über cygwin)
JDK (recht egal welches, in meinem Fall openjdk 19)
yml2 in selben ordner wie yml_exam (erreichbar über `make clone_yml2`)
YML2_PATH & YML2_PATH_w müssen gesetzt sein (siehe makefile)

Da nativen code in Java einzubinden Betriebssystemsübergreifend recht nervig ist ist das hier nur auf Windows ausgelegt, als Anfang um das umzustellen wäre die dateiendung der Shared library in makefile anzupassen ebenso müsste das win32 include directory im makefile angepasst werden.