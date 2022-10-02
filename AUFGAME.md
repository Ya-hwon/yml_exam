Eine der folgenden Aufgaben ist zu lösen. Es sind Gruppen bis zu drei
Personen erwünscht, man kann es auch alleine lösen. Mehrere Gruppen
können dieselbe Aufgabe bearbeiten. Es gibt unterschiedliche Lösungen,
die man dann vergleichen kann.

Aufgabe 1: Integration von Java und C++
---------------------------------------

In C++ soll ein Objekt implementiert werden. In Java soll ein
Proxy-Objekt implementiert werden, das das C++-Objekt aufruft, wann
immer eine Methode aus dem Java-Objekt aufgerufen wird.

a) Implementiere das in diesem Tutorial gezeigte Beispiel, indem Du das
   Tutorial vollständig nachvollziehst
   (https://linuxhint.com/jni-tutorial/)

b) Abstrahiere ein Interface in Java und C++ für die vier Methoden und
   implementiere es einmal in Java und einmal in C++.

c) Verfasse eine Schnittstellenbeschreibung in YML2 als DSL, die die
   vier Methoden unabhängig von Java und C++ als Schnittstelle beschreibt.

d) Schreibe einen Generator, der das Java-Interface aus der DSL
   erzeugt, sowie einen Generator, der ein Java-Objekt erzeugt,
   was das Interface implementiert. Auf letzteres muss man dann javah
   anwenden können, um C++-Code zu erzeugen.

Bis hierher ist die Aufgabe mindestens zu lösen. Für Interessierte:

e) Eine C++-Implementierung, die vom abstrakten Interface in C++
   ableitet, soll die vier Methoden in einem C++-Objekt implementieren.
   Verfasse eine solche C++-Implementierung.

f) Schreibe einen Generator, der das C++-Interface sowie ein Skeleton
   implementiert, das man als C++-Programmierer nur noch ausfüllen muss.
   Ist damit e) einfacher zu lösen als vorher?

g) Schreibe einen Generator, der die Schnittstelle, die javah erzeugt,
   mit der C++-Schnittstelle verbindet
