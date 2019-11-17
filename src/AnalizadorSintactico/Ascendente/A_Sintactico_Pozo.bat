SET JAVA_HOME="‪C:\Program Files\Java\jdk-13\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
cd C:\Users\jadel\Desktop\TablaSimbolos\proyecto-compiladores\src\AnalizadorSintactico\Ascendente
java -jar C:\Users\jadel\Desktop\LibreriasCUP\java-cup-11b.jar -parser parser -expect 200 gramatica.cup 
pause