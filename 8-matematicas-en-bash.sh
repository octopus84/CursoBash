#!/bin/bash

# MATEMÁTICAS PARA TUS SCRIPTS EN BASH
# Por defecto, una variable, en cualquier script en Bash, con independencia
# de su contenido, es tratada como una cadena de texto, y no como un
# número. Esto, como te puedes imaginar, complica esto de las operaciones matemáticas.
# Así, en primera instancia podrías pensar que es mejor utilizar algún otro lenguaje
# de programación para estos menesteres. Sin embargo, no es necesario, con el paso
# de las versiones de Bash, poco a poco, se ha ido mejorando.

# Sin embargo, una observación importante, Bash solo opera con enteros. Para realizar
# operaciones matemáticas en Bash con números reales, necesitas utilizar bc.

# Así básicamente tienes hasta cinco opciones, al menos, para facilitarte el trabajo
# con las operaciones matemáticas. Se trata de declare, expr, let, dobles paréntesis
# y bc tal y como te he adelantado en el párrafo anterior.

# DECLARE
# La primera de las opciones que tienes para realizar operaciones matemáticas es declare.
# Así, con declare defines algunas propiedades de la variable.

# -r define la variable como de solo lectura. Es decir, que tu variable es inmutable, de forma que si intentas cambiar su valor te arrojará un error.
# -i te permite declarar la variable como un entero.
# -a lo utilizarás para declarar arrays.
# -f te permite declarar una función. Además si ejecuta declare -f, así sin argumentos, obtendrás un listado de las funciones declaradas previamente.
# Una observación importante es que al definir una variable con declare estás restringiendo su ámbito a la función donde lo hayas declarado.
# Es decir, básicamente es como si utilizas local.

# Así algunos ejemplos,

declare -ir entero=10
echo "Este es un entero de valor $entero"
entero=10.5

# EXPR
# La segunda de las opciones para realizar operaciones matemáticas en Bash es utilizando expr.
# Se trata de un antigua aplicación de Unix, utilizada cuando Bourne Shell, no soportaba
# operaciones matemáticas. Sin embargo, hoy por hoy no tiene tanto sentido su uso.
# Ten en cuenta que necesitarás espacios entre los operandos y el operador. Así por ejemplo,
# echo $(expr 1+1) te devolverá 1+1, mientras que echo $(expr 1 + 1) te devolverá, como esperas, 2.

# Así algunos ejemplos,

echo
echo $(expr 5 \* 5) #devuelve 25, y si, hay que escapar el signo de multiplicación.
d=1
echo $(expr $d + 1) #devuelve 2.

# LET
# Otra opción para realizar operaciones matemáticas es let. let evalua cada argumento como una
# expresión aritmética. Las operaciones se evaluan como enteros, mientras que una división por
# cero arrojará un error.

# De nuevo, las cosas se ven mas claras con unos ejemplos,

echo
let z=25
echo $z Devuelve 25
let z++
echo $z Devuelve 26
let z=z+10
echo $z. Devuelve 36

# DOBLES PARÉNTESIS
# Como ya viste en un capítulo anterior del tutorial, otra opción para realizar operaciones
# matemáticas, es el uso de los dobles paréntesis. Al fin y al cabo, los dobles paréntesis
# se comportan como let que acabas de ver. Aunque tienen la ventaja de que un doble paréntesis
# puede incluir a otro doble paréntesis. De esta manera, los ejemplos que te he indicado para
# let se pueden hacer exactamente igual para el caso de los dobles paréntesis,

echo
((z = 25))
echo $z
((z++))
echo $z
((z = z + 10))
echo $z

# Pero además, si quieres devolver el resultado de una operación simplemente tienes que preceder
# el doble paréntesis con $, es decir, puedes simplificar los ejemplos anteriores de la
# siguiente manera,

echo
echo $((z = 25))
echo $((++z))
echo $((z = z + 10))

# Esto ta va a permitir, como he adelantado anteriormente, incluir una operación matemática dentro
# de otra. Por ejemplo,

echo
echo $((25 + $((5 + 5))))


# O incluso

echo
echo $((25+ $((diez=5+5)) )); echo $diez


# MATEMÁTICAS EN BASH CON BC
# Como ya te has dado cuenta, todas las operaciones matemáticas realizadas hasta el momento 
# solo implican números enteros. Sin embargo, ¿que sucede cuando quieres realizar operaciones 
# matemáticas con números reales?. En este caso necesitarás recurrir a una herramienta como es bc.

# bc es una herramienta que funciona exactamente como una calculadora matemática. Tu le pasas una 
# serie de operaciones, y esta herramienta se encarga de evaluarla.

# Un par de ejemplos sencillos,

echo
echo '4.1+5.2' | bc
echo '4.1*5.2' | bc


# Si quieres guardar el resultado de la operación en una variable, tienes que modificar los 
# ejemplos anteriores como sigue,

z=$(echo '4.1+5.2' | bc); echo $z
z=$(echo '4.1*5.2' | bc); echo $z


# También es posible definir variables. Sin embargo, estas variables son locales a bc, es decir, 
# luego no las vas a poder utilizar fuera de la expresión que le has pasado a la herramienta bc. 
# Es decir,
echo
echo 'var=10;var++;var' | bc #Te devolverá 11. Sin embargo si ejecutas echo $var no obtendrás 
# valor alguno.
# bc admite operadores incrementales y decrementales, incluidos los precedentes. 
# Me refiero a ++ y --. Así,

echo
echo 'var=10;++var' | bc
echo 'var=10;var++' | bc


# COMPARACIONES
# bc soporta comparaciones, teneiendo en cuenta que en todos los casos 1 es quivalente a True y 0 
# es equivalente a False, como puedes ver en los siguientes ejemplos,

echo
echo '2 > 1' | bc
echo '1 != 2' | bc
echo '2 > 1 && 2 != 1' | bc


# FUNCIONES MATEMÁTICAS
# Igualmente bc soporta algunas funciones matemáticas que te pueden resultar de gran utilidad. 
# Algunas de estas funciones matemáticas son las siguientes,

# s(x) para calcular el seno de un ángulo en radianes
# c(x) para calcular el coseno de un ánguno en radianes
# a(x) te permite calcular el arcotangente
# l(x) para calcular el logaritmo
# e(x) esta función te permite calcular la exponencial de un número
# sqrt(x) para cacular la raíz cuadrada

echo bc sqrt(4)

# Por otro lado tienes un par de funciones que seguro te serán de gran utilidad,

# length(x) te indica el número de dígitos de un valor
# scale(x) si la función anterior te permite saber los dígitos de un valor, con esta función 
# puedes establecer el número de dígitos con los que se devolverán los resultados.


# OTRAS OPCIONES
# Además de lo indicado anteriormente, bc te permite hacer mucho mas. 
# Así por ejemplo, te permite condicionales, bucles, funciones… 
# En fin que de por si, bc ya tiene suficiente entidad como para 
# dedicarle un artículo completo.

# CONCLUSIÓN
# Como has podido leer en este artículo tienes, diferentes opciones para realizar 
# operaciones matemáticas, aunque también dependerá de los operandos. En el caso 
# de que sean números reales, lo cierto es que las opciones se restringen considerablemente.

# A mi en particular, me gusta la solución de doble paréntesis. Desde mi punto de vista, 
# le da coherencia al script. Sin embargo, en este caso con mas razón que en otros, para 
# gustos los colores.