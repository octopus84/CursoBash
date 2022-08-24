#!/bin/bash


# DICCIONARIOS EN BASH

# Una característica interesante son los diccionarios en Bash o arrays asociativos. 
# Se trata de un elemento que va definido por pares clave valor. Básicamente es 
# como un array, pero en lugar de que el índice sea numérico es una clave, definida por ti.

# Esto lo puedes entender como dos arrays, un array de claves y un array de valores, 
# donde para el mismo índice tienes una clave y un valor. Así, por ejemplo, en la 
# clave puedes definir el nombre de un archivo y en el valor, definir algunas 
# características de ese archivo. Con esto, ya te puedes hacer una idea fantástica, 
# de las posibilidades de este tipo de estructura.

# Antes que nada una observación importante, y es que este tipo de estructuras están 
# solo disponibles a partir de Bash versión 4.0, con lo que tienes que tener muy en 
# cuenta esto a la hora de implementar tus scripts. Recuerda que para comprobar la 
# versión de Bash que tienes instalada, tienes que ejecutar /bin/bash --version. 
# Esto te podría servir en tu propio script para definir la implementación del 
# mismo en función de una u otra versión.

# DECLARANDO UN DICCIONARIO
# Al contrario de lo que viste en el caso de los arrays, en el caso de los diccionarios, 
# hay que declararlos de forma explícita. Es decir, por ejemplo,

declare -A telefonos

telefonos[Pedro]='+569123456'
telefonos[Juan]='+569123457'
telefonos[Diego]='+569123458'

# También es posible añadir valores en una sola línea. Así por ejemplo, lo puedes 
# hacer conforme ves a continuación, recordando declarar el diccionario previamente,

telefonos=([Pedro]='+569123456' [Juan]='+569123457' [Diego]='+569123458')

echo
echo "El telefono de Juan es : ${telefonos[Juan]}"

echo
echo "Todos los números de telefonos en una sola línea : ${telefonos[*]}"

echo
for i in ${telefonos[*]}; do
    echo "Los números de teléfonos son: "$i
done

# Mientras que si lo que quieres es obtener las claves, en este caso, los 
# propietarios de esos números de teléfono, la instrucción a ejecutar será,

echo
echo "Estos los nombres de los teléfonos en una sola línea ${!telefonos[@]}"

echo
echo "Estos los nombres de los teléfonos en una sola línea ${telefonos[@]}"

# Igual que sucede en el caso de los valores, también puedes hacer lo mismo 
# para el caso de las claves. Es decir, también puedes obtener todas las claves 
# con echo ${!telefonos[@]}.
# Si quiere iterar entre los valores del diccionario tan solo tienes que ejecutar,

echo
for i in ${!telefonos[@]}; do
    echo "Las claves del diccionario son :" $i
done

# Y lo mismo puedes hacer para el caso de las claves, que además puedes combinar 
# como puedes ver en el siguiente ejemplo,

echo
for i in ${!telefonos[@]}; do
    echo "El telefono de $i es ${telefonos[$i]}"
done

# También, como hiciste con los arrays en Bash, es posible extraer varios valores 
# de golpe. Por ejemplo,

echo
echo "Los Primeros 2 telefonos son: ${telefonos[@]:1:2}"


# CUANTOS ELEMENTOS TIENE EL DICCIONARIO
# Este procedimiento es exactamente igual que el que utilizaste con los arrays, 
# simplemente tienes que utilizar '#'. Así, para saber cuantos teléfonos tienes 
# guardados, tan solo tienes que ejecutar,

echo
echo "La cantidad de números es: ${#telefonos[@]}"


# OPERACIONES CON DICCIONARIOS
# Para eliminar un pareja clave valor de tu diccionario, tienes que ejecutar 
# la siguiente instrucción,

echo
unset telefonos[Juan]

echo "Los números de teléfonos que van quedando son ${telefonos[*]}"

echo
for i in ${!telefonos[*]}; do
    echo "Los números de teléfonos que van quedando son de $i : ${telefonos[$i]}"
done


# Por supuesto que puedes añadir nuevos elementos a nuestro diccionario, como has 
# visto al principio de este artículo. Pero no solo esto, si no que además puedes 
# añadir varios en una única línea,


telefonos+=([Ana]=+56900124569 [Irene]=+56900124569)
echo
for i in ${!telefonos[*]}; do
    echo "Un total de ${#telefonos[*]} números telefónicos que son de $i : ${telefonos[$i]}"
done


# Indicarte que si intentas añadir una pareja clave valor, en el que la clave ya existe, lo único 
# que harás será sustituir su valor. En este último caso, si ahora ejecutas telefonos+=[Irene]=777 
# lo que conseguirás será cambiar el teléfono de Irene.

# Para eliminar un diccionario, tienes que utilizar de nuevo unset. Así si quieres borrar la 
# agenda de teléfonos que has estado utilizando de ejemplo en este capítulo del tutorial, 
# tendrás que ejecutar la siguiente instrucción,

echo
unset telefonos
echo "El diccionario 'telefonos' ha sido borrado: ${telefonos[*]}  "


# CUIDADO CON LOS ESPACIOS
# En Bash siempre tienes que tener cuidado con los espacios, pero en el caso de los índices 
# de los diccionarios deberás tener un especial cuidado, para no cometer un fallo.

# Y es que es posible definir telefonos+=([Ana Maria]=456), sin embargo, si intentas ejecutar 
# unset telefonos[Ana Maria], te arrojará un error. Para ser correcto debes poner entre comillas, 
# ya sean simples o dobles.

### Se debe corregir aseveración, ya que no funciona declaración de clave
### de nombre compuesto por espacio incluso si se utiliza comillas simples o dobles.
echo
telefonos+=([Ana Maria]='+5691237777')
echo "Últimos valores probados ${telefonos[@]}"

echo
clave='Juan Andres'
unset telefonos["$clave"]