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

echo ${telefonos[Juan]}

echo
echo ${telefonos[*]}

echo
for i in ${telefonos[*]}; do
    echo $i
done

# Mientras que si lo que quieres es obtener las claves, en este caso, los 
# propietarios de esos números de teléfono, la instrucción a ejecutar será,

echo
echo ${!telefonos[@]}

