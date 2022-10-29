# Vorlesung Compilerbau Prüfungsleistung

Gewählt wurde die **Aufgabe 1: Integration von Java und C++**

## Gruppenmitglieder
Josias Müller <br>
Nicolas Styrnol <br>
Johannes Auberger

## Dependencies
make (auf windows über cygwin)

g++ (auf windows über cygwin)

JDK (recht egal welches, wir haben openjdk 19 verwendet)

yml2 in selben ordner wie yml_exam (erreichbar über `make clone_yml2`)

YML2_PATH muss gesetzt sein (siehe [Setup](#setup))

Da es sehr umständlich ist nativen Code betriebssystem-übergreifend in Java einzubinden, wurde diese Implementierung auf Windows ausgelegt. Um ein anderes Betriebssystem zu unterstützen müsste die Dateiendung der Shared-Library im makefile entsprechend angepasst werden, ebenso das win32 include directory.

## Setup
Im Überordner dieses Repositories muss auch das yml2 Projekt liegen.

Die Umgebungsvariable "YML2_PATH" muss auf diesen Überordner zeigen. Sobald der PATH gesetzt ist kann YML2 mit `clone_yml2` installiert und mit `delete_yml2` wieder gelöscht werden.

Beispiel aus meinem Setup: <br>
YML2_PATH = C:/Dev/git<br>
`C:/Dev/git/yml_exam` - Speicherort dieses Repos<br>
`C:/Dev/git/yml2` - Speicherort für das yml2 Projekt<br>
⚠️ *Achtung, keine Backslashes!* ⚠️

## Aufgaben
In C++ soll ein Objekt implementiert werden. In Java soll ein
Proxy-Objekt implementiert werden, das das C++-Objekt aufruft, wann
immer eine Methode aus dem Java-Objekt aufgerufen wird.

**Die Aufgaben sind im [src/ Ordner](/src) in die Teilaufgaben untergliedert. Die dazugehörigen Build/Generation Results sind in der selben Struktur im [target/ Ordner](/target/)**

### Teilaufgabe a)
Implementiere das in diesem Tutorial gezeigte Beispiel, indem Du das Tutorial vollständig nachvollziehst (https://linuxhint.com/jni-tutorial/) <br>
✅ Erledigt - [siehe src/assignment_a](/src/assignment_a/)

#### Make Befehle
`make buildA`<br>
Generiert mit javac -h und dem Java-Quellcode ein Class-File und ein Headerfile welches dann mit dem C++ Code zu einer DLL kompiliert wird (letztere kann dann z.B. vom Java Programm zur Laufzeit geladen werden).

`make runA`<br>
Führt das gebaute Java-Class-File aus.

### Teilaufgabe b)
b) Abstrahiere ein Interface in Java und C++ für die vier Methoden und implementiere es einmal in Java und einmal in C++. <br>
✅ Erledigt - [siehe src/assignment_b](/src/assignment_b/)<br>

### Hinweise
- Sollte hier nicht nur die Implementierung des abstrakten Interfaces für CPP gemeint sein sondern auch die Implementierung dessen Logik - dann siehe Implementierung in [Teilaufgabe e](#teilaufgabe-e)
- Für das Java Interaface wurde zum abstrakten Interface direkt noch dessen [Logik Implentierung](/src/assignment_b/java/InterfaceImpl.java) sowie ein [dazugehöriger Test](./src/assignment_b/java/InterfaceImplTest.java) zum Testen der Funktionsfähigkeit implementiert. <br>
(Für CPP erfolgt dieser Schritt in [Teilaufgabe e](#teilaufgabe-e))

#### Make Befehle
`make run_iitest_java`<br>
Baut alle nötigen Class-Files die zum Ausführen vom JavaInterfaceImplementation Test benötigt sind und führt diese aus.


### Teilaufgabe c)
Verfasse eine Schnittstellenbeschreibung in YML2 als DSL, die die vier Methoden unabhängig von Java und C++ als Schnittstelle beschreibt. <br>
✅ Erledigt - [siehe src/assignment_c](/src/assignment_c/)<br>

### Teilaufgabe d)
Schreibe einen Generator, der das Java-Interface aus der DSL erzeugt, sowie einen Generator, der ein Java-Objekt erzeugt, was das Interface implementiert. Auf letzteres muss man dann javah anwenden können, um C++-Code zu erzeugen. <br>
✅ Erledigt - [siehe src/assignment_d](/src/assignment_d/)<br>

 #### Hinweise
- Die Pfade für den yml2proc im Makefile sind immer relativ zum [src/](/src/) Ordner
- Bitte beachten das sich der yml2 Ordner ( wie im [Setup](#setup) beschrieben ) am richtigen Ort befindet

#### Make Befehle
`make buildD`<br>
Generiert das Java Interface sowie eine Java Klasse, welches das Interface implementiert. Diese Klassen werden dann mit javac -h zu .class Files und einer Header-Datei (GeneratedInterfaceImpl.h) kompiliert.
### Teilaufgabe e)
Eine C++-Implementierung, die vom abstrakten Interface in C++ ableitet, soll die vier Methoden in einem C++-Objekt implementieren. Verfasse eine solche C++-Implementierung. <br>
✅ Erledigt - [siehe src/assignment_e](/src/assignment_e/)<br>
#### Make Befehle
`make run_iitest_cpp`<br>
Kompiliert die .cpp und die .h Datei zu einer .exe und führt diese zum Testen der Interfaceimplementation aus.

### Teilaufgabe f)
f) Schreibe einen Generator, der das C++-Interface sowie ein Skeleton implementiert, das man als C++-Programmierer nur noch ausfüllen muss. Ist damit e) einfacher zu lösen als vorher? <br>
✅ Erledigt - [siehe src/assignment_f](/src/assignment_f/)<br>
Antwort: Ja, die Implementierung des Interfaces fällt leichter wenn ein Skeleton generiert wird, da nur noch die Logik implementiert werden muss und man sich den manuellen Aufbau der Struktur spart. Ein Weiterer Vorteil besteht darin dass ein generiertes Skeleton garantiert passt (zumindest wenn richtig generiert), insbesondere wenn es aus der "Wahrheit" generiert wird (auf deren Korrektheit sich alle andere Komponenten verlassen). Beim manuellen schreiben können Fehler passieren.
#### Make Befehle
`make buildF`<br>
Generiert das CPP Interface sowie den Skeleton für die CPP Implementierung.
