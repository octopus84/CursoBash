#!/bin/bash
#Es importante que no haya espacios ni entre la variable y el signo igual, 
#ni entre el signo igual y el valor que quieres asignar a tu variable.

#Mientras que para leer de esa variable antepodrás un $. De esta forma, 
#para nuestra variable anterior, y utilizando el comando echo que ya viste 
#en el capítulo anterior, tendrías lo siguiente,


# ÁMBITO DE LAS VARIABLES
# Las variables en Bash tienen un ámbito global a excepción de que lo definas como local. 
# Esto quiere decir que definas la variable donde la definas, la podrás utilizar en cualquier lugar de tu script. 
# Sin embargo, si la defines dentro de una función como local esta solo tendrá aplicación en la propia función.

# Tampoco te preocupes, mucho sobre este tema, que ya tendrás tiempo de verlo con detalle cuando lleguemos a las funciones.

# VARIABLES ESPECIALES EN BASH
# En Bash, hay algunas variables especiales y que están definidas por defecto, y que se refieren al script, 
# al que ha ejecutado el script, o a la máquina en la que se ha ejecutado el script. Así, algunas de ellas son las siguientes,

echo '$0 Representa el nombre del script: ' $0 
echo 'Argumento N° $1: ' $1
echo 'Argumento N° $9: ' $9
echo 'Argumento N° "${10}": ' "${10}"
echo 'Argumento N° ${12}: ' ${12}
echo
echo '$# El número de argumentos que se pasan a un script: ' $#
echo '$@ Todos los argumentos que se pasan a un script: ' $@
echo '$? La salida del último proceso que se ha ejecutado: ' $?
echo '$$ Es el ID del proceso del script: ' $$
echo 
echo '$HOSTNAME se refiere al hostname de la máquina en la que se está ejecutando el script: ' $HOSTNAME
echo '$SECONDS se refiere al tiempo transcurrido desde que se inició el script, contabilizado en segundos.: ' $SECONDS
echo '$RANDOM devuelve un número aleatorio cada vez que se lee esta variable.: ' $RANDOM
echo '$LINENO indica el número de líneas que tiene nuestro script.: ' $LINENO

# Además de estas variables que vienen definidas por defecto en Bash, y que seguro te serán de gran utilidad, 
# también hay normalmente otras, y que se refieren al entorno en el que trabajas. Para conocer estas variables puedes utilizar el comando env
# Si lo ejecutas puedes encontrar algunas variables tan interesantes como,
echo 
echo '$SHELL que indica el shell que estás ejecutando: '$SHELL
echo '$EDITOR donde está indicado el editor por defecto. En mi caso vim.: '$EDITOR
echo '$HOME la ruta del usuario. En mi caso /home/lorenzo: '$HOME
echo '$USERNAME el nombre del usuario. En mi caso Lorenzo 😄: '$USERNAME
echo '$PATH la ruta por defecto donde encontrar binarios, etc.: '$PATH

# ¿COMO UTILIZAR LOS ARGUMENTOS CON TU SCRIPT?
# Como puedes ver, es posible pasar argumentos a nuestro script, para lo que tenemos que utilizar las variables especiales $1 a $9. 
# Crea el siguiente script con el nombre prueba.sh
# Ahora, solo tienes que ejecutar bash prueba.sh variable1 y obtendras como respuesta variable1. Si lo ejecutas simplemente con bash 
# prueba.sh no te va a devolver nada, y si por lo contrario lo ejecutas con bash prueba.sh variable1 variable2 te devolverá igualmente variable1.

# Esto mismo lo puedes hacer con el resto de variables que se definen por defecto para los scripts. Así, puedes obtener el 
# número de argumentos o incluso todos los argumentos.
# Es probable que te preguntes que pasa cuando tienes 10 argumentos, ¿Como tratar el décimo argumento?¿y los demas?
# Puedes obtener el décimo argumento utilizando echo "${10}", y así sucesivamente.

# LAS COMILLAS EN BASH
# En el ejemplo anterior cuando he escrito el valor valor en la variable, lo he hecho directamente,
# variable=valor

# esto es así porque es un valor sencillo. Sin embargo, ¿que ocurrirá si queremos guardar un valor?
# variable=un valor

# Si lo ejecutas en el intérprete de comandos (shell) te devolverá valor: orden no encontrada. Esto es así por que Bash 
# utiliza el espacio para separar elementos. Así cuando quieres hacer asignaciones que contienen espacios, deberás utilizar las comillas. 
# Pero, ¿que comillas utilizar?. Comillas simples o dobles.

# Es importante que tengas en cuenta que en Bash no todas las comillas son iguales. No es lo mismo las simples que las dobles comillas.

# Con las comillas simples se guarda en la variable literalmente lo que hay entre ellas. Con las comillas dobles se interpreta el contenido.

# Fíjate, bien en este par de ejemplos. Primero con comillas simples,
echo
variable1=Juan
variable2='Esta es la casa de $variable1'
variable3="Esta es la casa de $variable1"
echo $variable1
echo $variable2
echo $variable3

# ASIGNACIÓN DE COMANDOS A VARIABLES
# En tus scripts, querrás guardar en una variable el resultado de la ejecución de un comando para poder tratarlo posteriormente. 
# Por ejemplo, si quisieras saber cuantos archivos hay en un directorio, ejecutarías la siguiente instrucción, utilizando el 
# comando find para buscar archivos y el comando wc para contar líneas,

# find . -maxdepth 1 -type f | wc -l

# Así, para tu script, donde quieres mostrar un texto donde se indique el número de archivos de un directorio, lo puedes hacer como,
echo
archivos=$(find . -maxdepth 1 -type f | wc -l)
echo "Hay $archivos archivos"

# Como te decía en el apartado anterior, esto mismo se puede hacer con las comillas inclinadas, 
# tal y como puedes ver a continuación,
echo
archivos2=`find . -maxdepth 1 -type f | wc -l`
echo "Hay $archivos2 archivos"

# Y, para perfeccionar el script anterior, puedes añadir también los directorios. 
# De esta forma te quedará,
echo
archivos=$(find . -maxdepth 1 -type f | wc -l)
directorios=$(find . -maxdepth 1 -type d | wc -l)
echo "Hay $archivos archivos y $directorios directorios"

# Todo lo que está entre $() se ejecuta, y el resultado se asigna a la variable. 
# Ten en cuenta que si el resultado tiene varias líneas, se mostrará como una línea sola. 
# Por ejemplo,

echo
listado=$(ls -la)
echo $listado

# OPERACIONES ARITMÉTICAS
# Por otro lado, además de la asignación del resultado de la ejecución de comandos, 
# también es posible realizar la asignación de operaciones matemáticas. Para ello, en 
# lugar de utilizar una sola pareja de paréntesis, tienes que utilizar dos parejas. 
# Así, por ejemplo, para asignar el resultado de 2*2, tendrás que realizar lo siguiente,

echo
resultado=$((2*2))
echo 'resultado de 2*2:' $resultado
echo 'El resultado de la operación más la misma variable es igual a:' $((2*$resultado))


# OPERACIONES CON TEXTO
# Al igual que es posible realizar operaciones aritméticas en el terminal, de la forma tan 
# sencilla como te he indicado en el apartado anterior, también es posible trabajar con texto.

# Si quieres ver todas las posibilidades que tienes, te recomiendo leas el artículo sobre 
# manipular texto en el terminal. Sin embargo, indicarte algunas operaciones que seguro te 
# serán de utilidad,
cadena="mi cadena"
echo
echo 'Para extraer parte de un texto, es tan sencillo como echo ${cadena:1:2}:' ${cadena:1:4}
echo
echo 'En el caso de que lo que quieras hacer es sustituir texto la operación es echo ${cadena/de/xx}: ' ${cadena/de/xx}
echo
echo 'Eliminar todas las apariciones de un texto dentro de otro echo ${texto//de}: ' ${cadena//de}
echo