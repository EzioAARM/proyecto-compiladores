SET JAVA_HOME="C:\Program Files\Java\jdk1.8.0_111\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
cd D:\U\10mo. ciclo\Compiladores\ProyectoFase4\proyecto-compiladores\src\AnalizadorSintactico\Ascendente
java -jar C:\cup\lib\java-cup-11b.jar -parser parser -expect 100 gramatica.cup 
pause
