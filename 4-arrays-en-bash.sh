#!/bin/bash

# Y aunque, a lo largo de este capítulo hable de arrays,
# tu lo puedes leer como listas. Mas si cabe, teniendo en
# cuenta que, Bash no soporta los arrays multimimensionales,
# con lo que siempre estoy hablando de listas, vectores o
# arrays de una dimensión. Y aun en el caso de que fueran
# arrays multidimensionales, siempre los podrías tratar
# como listas de listas.

# ARRAYS EN BASH
# DECLARANDO UN ARRAY
# En Bash existen diferentes formas de declarar un array,

# 1.- Asignando valores, por ejemplo: distros[0]='Ubuntu'
# 2.- Utilizando la palabra clave declare, como por ejemplo:
# declare -a distros=('Ubuntu' 'Linux Mint')
# 3.- Directamente con: distros=('Ubuntu' 'Linux Mint')

# Indicarte cada uno de los elementos del array lo he puesto
# entre comillas, porque el segundo, tiene espacios. Lo cierto
# es que podría no haber utilizado comillas en Ubuntu. Es mas,
# también podía haberme ahorrado las comillas en Linux Mint si
# hubiera escapado el espacio, como por ejemplo en,

# distros=(Ubuntu Linux\ Mint)

# Por otro lado, en los ejemplos anteriores solo he puesto texto.
# Sin embargo, lo cierto, es que en Bash, los arrays pueden
# contener diferente tipos de elementos. Es decir, podemos tener
# texto y números como por ejemplo en,
# distros=(Ubuntu 1234 Linux\ Mint)

# ACCEDIENDO AL CONTENIDO DE LOS ARRAYS EN BASH
# Una vez ya tienes declarado tu array, el siguiente paso, es acceder
# a su contenido. Primero de forma individual. Así, vamos a partir
# del array de distribuciones que has declarado anteriormente,

distros=(Ubuntu Linux\ Mint Deepin Manjaro Elementary)

# Para acceder de forma individual a cada una de las distros,
# tienes que utilizar la siguiente sintaxis, ${distros[i]}. Así
# por ejemplo para imprimir la primera de las distros,
# utilizarías echo ${distros[0]}.

echo ${distros[1]}

# Ahora, si lo que haces es echo $distros obtendrás el primer
# elemento del array.
echo
echo $distros

#Instrucción para imprimir todas en una linea
echo
echo ${distros[@]}

# ¿Y si quisieras imprimir una por línea?. Aquí es donde intervienen
# los bucles que viste en el capítulo anterior del tutorial.
# Por ejemplo,
echo
for i in "${distros[@]}"; do
    echo $i
done

# Observa que he puesto el array entrecomillado,
# es decir, "${distros[@]}". Si no lo haces así, imprimirá Linux
# en una línea y Mint en otra línea.

# Pero no solo puedes acceder de uno en uno al contenido de los
# elementos de tu array. También puedes extraer varios de golpe.
# Por ejemplo,
echo
echo ${distros[@]:1:3}

# Esto también lo puedes hacer con el texto. Así, te recomiendo
# que le des un vistazo al artículo sobre manipular texto.
# Donde podrás ver, que la sintaxis utilizada para los arrays,
# es exactamente la misma que para las cadenas de texto. Así,
# en el ejemplo, si ejecutas echo ${distros[0]:2:4} te
# devolverá untu.
echo
echo ${distros[@]/Linux\ Mint/Debian}

# CUANTOS ELEMENTOS TIENE TU ARRAY
# Para saber cuantos elementos tienen un array en Bash, tienes
# que utilizar "#".
# Así, en el ejemplo que estás utilizando de las distros,
# si quieres conocer cuantas distribuciones
# tienes utiliza `echo ${#distros[@]}.
echo
echo ${#distros[@]}

# Si quieres saber la longitud de uno de los elementos del array,
# entonces deberás referirte a él. Por ejemplo, si ejecutas
# echo ${#distros[0]} te devolverá 6, el número de letras de la
# palabra Ubuntu.
echo
echo ${#distros[1]}

# OPERACIONES CON ARRAYS EN BASH
# Una vez ya sabes como puedes crear tu array en Bash, conoces
# los elementos que tienes, y sabes como puedes ver el contenido,
# ha llegado el momento de modificar el array. Me refiero, a
# añadir y quitar elementos de tu array, y también, por supuesto
# a concatenar arrays.

# Puedes añadir un elemento a tu array, ya sea por delante,
echo
distros=(Arch "${distros[@]}")
for i in "${distros[@]}"; do
    echo $i
done

# como también puedes añadirlo por detrás, como por ejemplo
echo
distros=("${distros[@]}" Arch)
for i in "${distros[@]}"; do
    echo $i
done

# Incluso podrías intercalarlo
echo
distros=("${distros[@]:0:2}" Fedora "${distros[@]:3}")
for i in "${distros[@]}"; do
    echo $i
done

# Ahora, para quitar un elemento del array, tienes que
# utilizar "unset". Por ejemplo, para quitar el segundo elemento,
# ejecutarías unset distros[1]. Aunque esto tiene un ligero
# inconveniente, y es que si ahora haces un echo "${distros[1]}"
# no te devolverá nada.
echo
unset distros[1]
echo "La variable de posiscion 1: ${distros[1]}"

echo
for i in "${distros[@]}"; do
    echo $i
done

# De cualquier forma, puedes quitar el elemento, utilizando

distros=("${distros[@]:0:1} ${distros[@]:2}")
echo
for i in "${distros[@]}"; do
    echo $i
done

# También puedes quitar elementos del array utilizando patrones,
# como por ejemplo,
echo
distros=("${distros[@]/Manjaro/}")
for i in "${distros[@]}"; do
    echo $i
done


# CONCATENANDO, DIVIDIENDO Y BORRANDO ARRAYS EN BASH
# Con lo que has visto hasta el momento, ya controlas perfectamente 
# desde crear un array en Bash, acceder a los elementos del array, 
# y modificar su contenido. Ahora ya solo queda ver como unir dos 
# o mas arrays, dividir un array en varios y por supuesto borrar 
# un array. Aunque realmente no es exactamente así, puesto que si 
# repasas los puntos anteriores, verás que de una u otra forma, ya 
# has realizado previamente todas estas operaciones. Sea como fuera, 
# vamos a repasarlo.
# Primero crea estos dos arrays, como te he indicado anteriormente,

distros1=(Ubuntu Knoppix PureOS)
distros2=(Mandrake Centos Fedora)

distros3=("${distros1[@]} ${distros2[@]}")

# Si lo imprimes, utilizando echo ${distros[@]} verás que el 
# resultado es el que tue esperas.
echo
echo ${distros3[@]}


# Por otro lado, la operación de dividir un array, si que la 
# recordarás porque la has hecho recientemente. Básicamente se 
# trata de extraer los elementos que necesites. Si quiesieras 
# los dos últimos elementos del array distros, tan solo tienes 
# que ejecutar nuevo=(${distros[@]:4). Lo cierto es que esto es 
# poco intuitivo, porque necesitas saber el número total de 
# elementos, y restar los que no queires extraer. La solución un 
# poco aparatosa sería,

echo
nuevo=(${distros3[@]:3})
echo ${nuevo[@]}

echo
nuevo=(${distros3[@]:0:2})
echo ${nuevo[@]}

echo 
nuevo=(${distros3[@]:$((${#distros3[@]}-2))})
echo ${nuevo[@]}

# Desde luego, si quieres los dos primeros, es tan sencillo como,

echo
nuevo=(${distros3[@]::2})
echo ${nuevo[@]}

# Por último, para borrar un array es similar como para borrar un 
# elemento de un array, utilizando unset. Así siguiendo con el 
# ejemplo anterior, para borrar el array nuevo, tienes que ejecutar,

echo
unset nuevo
echo "Último Array borrado: ${nuevo[@]}"