# Vorlesung Compilerbau Prüfungsleistung

Gewählt wurde die **Aufgabe 1: Integration von Java und C++**

## Gruppenmitglieder
Josias Müller <br>
Nicolas Styrnol <br>
Johannes Auberger

## Dependencies
make (auf windows über cygwin)
g++ (auf windows über cygwin)
JDK (recht egal welches, in meinem Fall openjdk 19)
yml2 in selben ordner wie yml_exam (erreichbar über `make clone_yml2`)
YML2_PATH & YML2_PATH_w müssen gesetzt sein (siehe makefile)

Da es sehr umständlich ist nativen Code betriebssystem-übergreifend in Java einzubinden, wurde diese Implementierung auf Windows ausgelegt. Um ein anderes Betriebssystem zu unterstützen müsste zunächst die Dateiendung der Shared-Library in makefile anzupassen ebenso müsste das win32 include directory im makefile angepasst werden.

## Aufgaben

In C++ soll ein Objekt implementiert werden. In Java soll ein
Proxy-Objekt implementiert werden, das das C++-Objekt aufruft, wann
immer eine Methode aus dem Java-Objekt aufgerufen wird.

### Teilaufgabe a)
Implementiere das in diesem Tutorial gezeigte Beispiel, indem Du das Tutorial vollständig nachvollziehst (https://linuxhint.com/jni-tutorial/) <br>
✅ - [siehe ./src/assignment_a](/src/assignment_a/)

