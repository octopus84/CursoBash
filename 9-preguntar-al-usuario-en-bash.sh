#!/bin/bash

# PREGUNTAR AL USUARIO EN BASH
# La solución para preguntar al usuario en Bash es utilizar el comando integrado
# de Bash read. Con read puedes leer desde tu script desde la entrada estándar.
# El uso de este comando es tremendamente sencillo. Con un ejemplo,

echo "Introduce tu nombre"
read nombre
echo "Tu  nombre es : $nombre"

# Hasta que no introduzcas tu nombre (o lo que quieras) el script estará detenido a la
# espera de que introduzcas una nueva línea o retorno de carro. Es posible definir otro
# delimitador que no sea un retorno de carro, pero esto lo podrás ver mas adelante.

# LA PREGUNTA EN EL MISMO READ
# En el apartado anterior, he utilizado un echo para mostrar la pregunta. Sin embargo,
# esto no es necesario, porque read ya tiene previsto una opción para esto, se trata
# de -p <mensaje>. Así por ejemplo,

echo
read -p "Dime tu nombre: " nombre
if [ $nombre != "" ]; then
    echo "Hola $nombre"
else
    echo "Pues si no me quieres decir tu nombre, peor para ti!!!"
fi

# LAS RESPUESTAS DEL USUARIO A UN ARRAY
# ¿Y si le preguntamos por varios parámetros y queremos guardarlos en un array?
# En este caso tienes que utilizar la opción -a. Por ejemplo,
echo
echo Dime tres nombres
read -a nombres
for i in ${nombres[@]}; do
    echo $i
done

# Con esta sencilla operación todo lo que introduzcamos irá al array. En este sentido,
# ten en cuenta que, si no utilizas comillas, simples o dobles, cada elemento separado
# por un espacio es un elemento del array.

# UN TIMEOUT PARA LOS IMPACIENTES
# Otra interesante opción que tienes a tu alcance es la de definir un tiempo máximo para contestar.
# De esta forma, transcurrido el tiempo definido, si el usuario no ha respondido se continua
# con el proceso.

# Esto te puede resultar muy interesante para dar la posibilidad de hacer el script automático,
# o incluso, si así lo consideras para hacer el juego del ahorcado como te he comentado
# anteriormente.

# Para utilizar el timeout, tienes que emplear la opción -t seguido del tiempo. Un ejemplo,
# donde preguntamos el nombre del usuario, y si no responde en menos ded dos segundos, te lo dice,

echo
read -t 2 -p "Dime otra vez tu nombre: " nombre
if [ -z $nombre ]; then
    echo
    echo "No me has dicho tu nombre en menos de dos segundos"
else
    echo
    echo $nombre
fi

# LIMITAR EL NÚMERO DE CARACTERES
# También es interesante poder limitar el número de caracteres que se pueden introducir.
# Sería una solución tipo Twitter. Tu puedes definir el número de caracteres que
# permites introducir. Además tienes dos variantes como puedes leer a continuación,

# -n solo permite un número de caracteres como máximo siempre y cuando no hayas utilizado
# el delimitador, que por defecto, como he comentado anteriormente es el retorno de carro.
# -N en este caso se permite un número de caracteres, pero se ignora el delimitador.
# De esta forma, hasta que no se alcanza el número de caracteres prefijado o se produce
# un timeout, en el caso de que lo hayas utilizado, no se considera la respuesta.
# Por ejemplo,

echo
read -n 7 -p "Fruita de 7 letras: " fruta
if [ "$fruta" == "plátano" ]; then
    echo
    echo Correcto
else
    echo
    echo "Error, la respueta correcta era plátano"
fi

# De esta manera, cuando hayas introducido la séptima letra no hará falta que introduzcas el
# retorno de carro, o el delimitador, en el caso de que lo hayas modificado.

# CAMBIANDO EL DELIMITADOR
# Como he comentado en diferentes apartados a lo largo de este capítulo del tutorial,
# es posible seleccionar otro delimitador que no sea el retorno de carro. De esta manera,
# cuando el usuario de tu script introduzca ese delimitador se leerá la entrada.

# Modificando un poco el ejemplo anterior, y de forma un poco absurda. Lo que conseguiríamos
# es que al introducir la letra o directamente se continuara con el script. El problema,
# es si el usuario de tu script no acierta con ese delimitador…

read -d o -p "Otra fruta de 7 letras: " fruta
if [ "$fruta" == "plátan" ]; then
    echo
    echo Correcto
else
    echo
    echo "Error, la respuesta correcta era plátano."
fi

# Fíjate en el detalle, que al realizar la comparación solo he tenido en cuenta plátan y he
# omitido la o, porque en este caso al hacer de delimitador no forma parte de la respuesta.
# Esto, es un pequeño detalle, pero lo tienes que tener en cuenta.

# Y SE HIZO EL SILENCIO O COMO TRABAJAR CON CONTRASEÑAS
# ¿Como preguntar al usuario por una contraseña? Lo típico es que al escribir la contraseña
# no se muestre ningún carácter, para de esta manera, evitar que miradas indiscretas se queden
# con la misma.

# Para este caso read también tiene prevista una opción que seguro que te va a solucionar este
# problema. Se trata de -s (s de silencio). Simplemente no va a mostrar los caracteres conforme
# los introduzcas.
# Por ejemplo,

echo
read -sp "Introduce la contraseña: " password
echo
echo "La passoword es: "$password


# CONCLUSIÓN
# Como has podido leer, read, te ofrece diferentes opciones para preguntar al usuario 
# por un determinado parámetro, y detener de esta forma el script. Aunque, siempre es 
# posible definir un tiempo máximo, en el que si el usuario no responde tu continuas, 
# pero no creo que esto sea lo mas correcto.