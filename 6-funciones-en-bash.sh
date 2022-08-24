#!/bin/bash

# FUNCIONES EN BASH
# Otra de las características interesantes de Bash son las funciones. Una herramienta,
# que sin lugar a dudas te va ahorrar mucho trabajo y esfuerzo, puesto que te va a
# permitir reutilizar tu código, y no tener que repetir una y otra vez, el mismo código.

# Eso de no repetir código, ya sea con las funciones en Bash o en cualquier lenguaje de
# programación, tiene muchas ventajas. Pero no solo tiene ventajas sino que además es una
# práctica recomendada.

# El repetir código te puede conllevar, además de un mayor número de errores, y un mayor
# costo de mantenimiento. Si has repetido el mismo código en varias partes de tu aplicación,
# y tienes que modificarlo, tienes un problema. Con el uso de funciones, este problema se ve
# reducido sensiblemente, puesto que solo tendrás que modificar la función en cuestión.

# Además, puedes reutilizar tus funciones en otros scripts, con lo que el tiempo de
# desarrollo de una aplicación se verá reducido considerablemente.

# FUNCIONES EN BASH
# DECLARACIÓN DE FUNCIONES
# Al igual que viste en el caso de los arrays, en el caso de las funciones en Bash, también
# es posible declararla de varias formas. La primera de las formas es tan sencillo, como indicar
# el nombre de la función seguido paréntesis. Por ejemplo,

mi_primera_funcion() {
    echo Hola Mundo
}

mi_primera_funcion

# También se puede declarar en una línea como por ejemplo,

echo
mi_segunda_funcion() { echo "HOla de nuevo"; }

mi_segunda_funcion

# En el caso de que definas tus funciones en Bash en una sola línea tienes que tener en cuenta
# los espacios después de la primera llave y antes del primer comando, y antes de la
# última llave. Es decir, tienes que dejar espacio entre las llaves y los comandos para
# que no arroje un error. Además entre comandos debes, utilizar ;. Como por ejemplo,

echo
mi_tercera_funcion() {
    echo "Hola mundo"
    echo
    echo "Hola de nuevo"
}

mi_tercera_funcion

# Otra opción para declarar una función es utilizando la palabra clave function.
# De esta manera la declaración de tu función tendría el siguiente aspecto,

echo
function mi_cuarta_funcion() {
    echo Hola Mundo
}

# Mientras que para hacer uso de una función, solo tienes que llamarla por su nombre.
# Si así como suena. Así, para la función que has declarado previamente, la llamarías
# como ves a continuación,

mi_cuarta_funcion

# Una vez ya tienes claro como declarar funciones en Bash, indicarte algunas cosas que
# tienes que tener en cuenta,

# Una cosa es la declaración de tu función, y otra es su ejecución. Que hayas declarado
# y definido una función no indica que se vaya a ejecutar. Para que se ejecute, tienes
# que hacer uso de ella.

# Antes de utilizar una función tienes que haberla declarado. Es exactamente igual que en
# la consola, y lo mismo que para cualquier otra variable. Antes de poder hacer uso de ella,
# tienes que declararla.

# ÁMBITO DE LAS VARIABLES
# ¿Que es esto del ámbito de las variables? El ámbito de una variable indica donde está
# definida una variable. Por regla general una variable tiene ámbito global, a menos que
# la definas expresamente como local. Así, aunque definas una variable dentro de una función,
# esta variable será global. Como digo, la única forma de que la variable solo tenga
# ámbito dentro de la función es que lo indiques expresamente. Así, por ejemplo,

var1='var1-fuera'
var2='var2-fuera'

function funcion_ambito() {
    var1='var1-dentro'
    local var2='var2-dentro'
    var3='var3-dentro'
    local var4='var4-dentro'
    echo $var1 $var2 $var3 $var4
}
echo
echo $var1 $var2
echo
funcion_ambito
echo
echo $var1 $var2 $var3 $var4


# Como ves has modificado el contenido de var1 por tener ámbito global, mientras que var2 
# como las ha declarado global no se ha modificado, y tras ejecutar la función tiene el 
# mismo valor que antes. Por contra, como var4 la definiste local dentro de la función, 
# fuera de ella no tiene valor alguno.

# Esto del ámbito de las variables, tiene su miga, pero es importante que lo tengas muy en 
# cuenta, porque de lo contrario es probable que te de mas de un disgusto.


# PASAR ARGUMENTOS A UNA FUNCIÓN
# ¿Pasar argumentos? Hasta ahora, siempre que has definido una función, dentro de la misma 
# estaba todo lo que necesitabas. Así, cuando has hecho un echo, el valor que utilizabas 
# o lo has definido dentro o era global. Pero y si quisieras, por ejemplo, sumar dos números 
# que no has definido previamente. El comportamiento de las funciones con las variables 
# especiales, es igual que el caso del propio script, que pudiste ver en el capítulos 
# sobre variables en bash. Esto es así con alguna salvedad, porque por ejemplo, 
# $0 se refiere siempre al nombre del script.

echo
function funcion_suma_var(){
    ans=$(($1+$2))
    echo "Resultado de la suma de varialbe especiales: $ans"
}

funcion_suma_var 2 2

# Si ejecutas funcion1 2 2 verás que imprime un 4 como es de esperar.
# Tal y como te comentaba antes de este ejemplo, puedes hacer uso de las variables especiales 
# para trabajar con tu función. Así, estas variables, son,

# $0 representa el nombre del script
# $1 – $9 los primeros nueve argumentos que se pasan a un script en Bash
# $# el número de argumentos que se pasan a un script
# $@ todos los argumentos que se han pasado al script
# $? la salida del último proceso que se ha ejecutado
# $$ el ID del proceso del script
# En este sentido, como ves, excepto el primero y el último, que hacen referencia al 
# propio script, el resto los puedes utilizar perfectamente en tus funciones. 
# Ahora modifica ligeramente la función, añadiendo esas variables especiales, 
# como puedes ver a continuación,

echo
function funcion_var_especiales(){
    echo "Variable nombre del archivo "'$0'": $0"
    echo "Variable número de parametros "'$#'": $#"  
    echo "Todos los argumentos que se pasan a un archivo "'$@'": $@"
    echo "El Id del proceso del script "'$$'": $$"
    ans=$(($1*$2))
    echo "La Esta es la salida del último proceso ejecutado: $?"
    echo "Esta es la salida de 'ans': $ans"
    echo "La Esta es la salida del último proceso ejecutado: $?"
}
funcion_var_especiales 2 2 3
echo "El ID del último proceso: $?"


# DEVOLVER VALORES
# ¿A que me refiero con esto de devolver valores? Se trata de devolver el resultado 
# de la función. Por ejemplo, en la función que has definido anteriormente para sumar 
# dos valores, lo que hiciste fue imprimir el resultado 4. Pero, ¿como podías haber 
# reutilizado ese resultado fuera de la propia función?.

# Las funciones en Bash permiten permiten devolver un resultado, pero este resultado es 
# un entero entre 0 y 255, que como te imaginas representa el estado de la función. Con 
# lo que deberías utilizar este return precisamente para eso, para devolver el estado de 
# la función, de forma que un 0 representa que la función ha terminado con éxito, mientras 
# que cualquier otro valor, debería representar el código del error.
# Así,

echo
function funcion_retorno(){
    return 5
}
funcion_retorno
echo "Último valor devuelto: $?"


# Si, return se utiliza para saber como ha terminado la función, ¿como puedes obtener 
# el resultado de las operaciones que has hecho con la función? Existen diferentes 
# aproximaciones para hacer esto. La primera sería utilizar variables globales, 
# como por ejemplo,

echo
function funcion_resultado(){
    resultado='mi resultado'
}
funcion_resultado
echo "La variable de mi resultado: "$resultado


# El problema de esta aproximación es precisamente el uso de variables globales, 
# que puede llevar, sobre todo en scripts considerables de tamaño, a incrementar 
# la complejidad en exceso. Lo cierto, es que tal y como te he comentado anteriormente 
# lo suyo es que dentro de las funciones utilices, en la medida de lo posible variables locales.

# La segunda de las opciones, y que casa perfectamente con lo que te he comentado anteriormente, 
# es el uso de variables locales. Esto te va a permitir tener todo lo que se realiza dentro 
# de la función en un ambiente controlado.

# Fíjate bien, como resulta una función implementada con variables locales, y como obtener 
# el resultado de la función. ¿No te encaja mucho mas?

echo
function funcion_var_local(){
    local resultado='Mi resultado'
    echo $resultado
}
resultado=$(funcion_var_local)
echo "El resultado de una variable local dentro de una function: $resultado"


# REUTILIZAR FUNCIONES
# Como te he comentado en la introducción, una de las grandes ventajas de las funciones 
# es la posibilidad de reaprovechar tu código. Como te decía, no tienes que repetir y 
# repetir tu código. Simplemente tienes que llamar de nuevo a tu función, cada vez 
# que la necesitas.

# En este sentido, ¿como pueeds utilizar una función que tienes implementada en un 
# script en otro script?. Para esto tienes que utilizar el comando source. El comando 
# source ejecuta el script al que haces referencia en el proceso actual, pudiendo de 
# esta forma, reutilizar de forma sencilla las funciones.

# Como ejemplo, si tienes un script llamado script1, definido como sigue,

echo
source ./6.1-funciones-en-bash.sh
echo "El resultado de la funcion suma reutilizada: $(suma 2 2)" 


# COMBINANDO CONCEPTOS
# Ahora ya has dado un buen repaso a como se hacen las cosas en Bash. Ha llegado el 
# momento de reunir, lo que has visto hasta el momento en los diferentes capítulos 
# de este tutorial. Así, por ejemplo, si quieres controlar si a una función se la 
# han pasado parámetros, tendrías que hacer una comprobación del estilo de lo que 
# ves a continuación,

echo
function funcion_prueba(){
    if [ $# -gt 0 ]; then
        echo "Con Argumentos"
    else
        echo "Sin Argumentos"
    fi
}

funcion_prueba 2 3 3