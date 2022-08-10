#!/bin/bash

# BUCLES EN BASH: WHILE
# La primera de las estructuras que te permite realizar bucles 
# es While. Siguiendo con el ejemplo de Bart, esto se pondría 
# de la siguiente forma,

# i=1
while [[ $i -le 10 ]]
do
    echo 'Mi primer Bucle ne Bash es Lindio' $i
    ((i++)) 
done


# Por otro lado, si quisieras repetir de forma ininterrumpida un bucle, 
# lo puedes hacer utilizando una estructura como,
# while true
# do
#     echo "$i.- Vive derisa, muere joven y deja un cadáver obeso"
#     ((i++))
# done

# BUCLES EN BASH: UNTIL
# El siguiente tipo de bucle, es muy parecido al anterior. La diferencia 
# entre ambos, estriba, en que con while el bucle continuará mientras se 
# cumpla la condición. Sin embargo, en el caso de until el bucle continuarás 
# hasta que se cumpla la condción.

# Así para realizar una cuenta regresiva, para el lanzamiento de un 
# transbordador interestelar, puedes utilizar el siguiente script,

echo
i=10
until [ $i -lt 0 ]
do
    echo 'La variable en cuenta regresiva ' $i
    ((i--))
done


# Este mismo ejemplo implementado utilizando while quedaría como puedes ver a continuación,

echo
i=10
while [ $i -ge 0 ]; do
    echo 'El mismo ejemplo que Until pero con While' $i
    ((i--))
done

# BUCLES EN BASH: FOR
# El funcionamiento del bucle for difiere sensiblemente de los que has visto hasta el momento. 
# Aunque también puedes simular los anteriores bucles, como has visto con until y while.
# Así, para repetir el ejemplo de Bart Simpson, lo podrías hacer como sigue a continuación,

echo 
for i in {1..10}
do
    echo "$i.- Este el un bucle en For "
done

# Otra opción para realizar el mismo bucle es utilizando una sintaxis similar a la que 
# se utiliza en c. Así,

echo
for ((i=1;i<=10;i++))
do
    echo "Este es un For echo con sintaxis de C" $i
done

# También puedes iterar sobre cualquier otro tipo de rango. Por ejemplo, si quieres iterar 
# sobre los archivos del directorio,

echo
count=0
for i in *
do
    ((count++))
    echo "EL archivo número $count es $i" 
done

# Otro interesante ejemplo,

echo
for color in rojo amarillo verde
do
    echo "Este es el color $color"
done

# Si quisieras imprimir los números impares hasta el número que le pases como primer argumento,

echo
for ((i=1;i<$1;i++))
do  
    if ((i%2))
    then
        echo "El número impar es $i"
    fi
done

# Por supuesto que no solo lo puedes utilizar con números y rangos, también lo puedes utilizar 
# con el resultado de una ejecución de un comando. Por ejemplo,

echo
for i in $(ls)
do
    echo "Bucle en rangos $i"
done

# También, puedes expresar todo el bucle Bash en una única línea, 
# utilizando para ello el punto y coma, ";" como separador. Por ejemplo,

echo 
for i in $(ls);do echo "Bash en una línea "$i; done


# RANGOS
# Algo interesante que habrás podido observar en las estructuras for son los rangos. Un rango, 
# lo puedes expresar con un número de inicio y un número de fin. Sin embargo, Bash, es lo 
# suficientemente inteligente, como para interpretar que si el número de inicio, es mayor que 
# el número de fin, lo que tiene que hacer es una cuenta regresiva. Así,

# {1..1000} contará de 1 a 1000
# {1000..1} contará de 1000 a 1
# Pero, no solo puedes decir que cuente de uno en uno, también le puedes definir paso. Así

# {1..1000..2} contará de 1 a 1000, pero, de dos en dos.
# {1000..1..-2}, lo mismo que en el caso anterior, pero de forma regresiva.
# Por supuesto que además de ponerlo en un bucle for, también lo puedes utilizar directamente 
# en un echo, por ejemplo, echo {1..100..5}


# CONTROLANDO EL FLUJO CON BREAK Y CONTINUE
# Dos opciones realmente muy interesantes que tienes para controlar el flujo del programa son 
# break y continue. Como has podido intuir, el primero te permite interrumpir el flujo y el 
# segundo continuarlo.

# Esto te puede ser de gran utilidad por ejemplo para controlar el flujo en el caso de hacer 
# un bucle while infinito.
# En el siguiente ejemplo, cuando encuentre el primer valor superior a 5 saldrá del bucle

echo 
i=0
while :
do
    echo "Estructura de While con Break $i"
    ((i++))
    if [ $i -gt 5 ];  then
        break
    fi
done
echo "Finaliza con $i"


# Sin embargo, en este ejemplo lo que sucederá cuando lo ejecutes, es que cuando encuentre 
# el valor 2 simplemente saltará a la siguiente iteración.

echo
i=0
while :
do
    ((i++))
    if ((i<3)); then
        echo "El continue del while $i"
        continue
    fi

    if ((i>5)); then
        echo "El break del while $i"
        break
    fi
done
echo "Finaliza el while con $i"
