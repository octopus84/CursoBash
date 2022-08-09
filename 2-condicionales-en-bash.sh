#!/bin/bash

# CONDICIONALES EN BASH
# Si tienes alguna idea de programación seguro que has oído hablar de los condicionales.
# Si no, es posible que conozcas el servicio ifttt. Eso de que si pasa esto entonces haz aquello.
# Pues ese servicio no es mas que una extrapolación de esto de los condicionales. Se trata
# de realizar una u otra acción en función de una pregunta. Si el resultado de la pregunta
# es uno, emprenderás una acción y si el resultado es otro, emprenderás una acción diferente.

# En Bash, esto de los condicionales se materializa con if then else y con case. Pero
# independientemente de uno u otro, en cualquier caso, se parte de resolver una cuestión,
# una prueba, un test, al final una comparación. De esta manera esto es lo primero que
# tienes que abordar en este capítulo, comparaciones en Bash.

# COMPARANDO EN BASH
# Para comparar en Bash se utiliza test o [. Ambos son totalmente equivalentes, y ambos están
# implementados, en el propio Bash. En el caso [, por cuestiones prácticas es obligatorio también
# utilizar su pareja [ o de otra forma te da error. Esta es la razón para que tenga que estar
# separado el corchete de la expresión que viene a continuación, porque es un comando.

# Por otro lado, también puedes utilizar dobles corchetes [[, para realizar tus comparaciones.
# Los dobles corchetes resultan ser una mejora respecto a los simples. Así, las diferencias
# entre uno y otro son las siguientes,

# 1.- No tienes que utilizar las comillas con las variables, los dobles corchetes trabajan
# perfectamente con los espacios. Así [ -f "$file" ] es equivalente a [[ -f $file ]].

# 2.- Con [[ puedes utilizar los operadores || y &&, así como<y>` para las comparaciones de cadena.

# 3.- Puedes utilizar el operador =~ para expresiones regulares, como por ejemplo [[ $respuesta =~ ^s(i)?$ ]]

# 4.- También puedes utilizar comodines como por ejemplo en la expresión [[ abc = a\* ]]

# Es posible que te preguntes por la razón para seguir utilizando [ simple corchete en lugar de doble.
# La cuestión es por compatibilidad. Si utilizas Bash en diferentes equipos es posible que te encuentres
# alguna imcompatibilidad. Así que depende3 de ti y de donde lo vayas a utilizar. A modo de resumen,
# aquí tienes diferentes opciones,

# COMPARANDO CADENAS
# [[	    [
#----------------------------------
# >	        >
# <	        <
# =	        =
# !=        !=

# COMPARANDO ENTEROS
# [[	    [
#----------------------------------
# -gt	    -gt	    mayor
# -lt	    -lt	    menor
# -ge	    -ge	    mayor o igual
# -le	    -le	    menor o igual
# -eq	    -eq	    igual
# -ne	    -ne	    distinto

# Aquí quiero que te des cuenta que [[ 001 = 1 ]] es falso mientras que [[ 001 -eq 1 ]] es cierto.

# OPERADORES BOOLEANOS
# [[        [
#----------------------------------
# &&	    -a
# ||	    -o

# AGRUPACIÓN
# Para agrupar operaciones booleanas puedes utilizar paréntesis con los dobles corchetes,
# mientras que en el caso de los simples corchetes deberás utilizar los paréntesis pero escapados.

# OTROS COMPARADORES INTERESANTES
# -d te permitirá saber si es un directorio y si existe
# -f lo mismo que en el caso anterior pero para archivos
# -r en este caso te permite saber si el archivo tiene permiso de lectura
# -s con esta opción puedes saber si el tamaño del archivo es mayor que cero. Es decir, que no se trata de un archivo vacío
# -w te permitirá identificar si el archivo tienen permisos de escritura
# -x lo mismo que en el caso anterior pero para el caso de permisos de ejecución.

# CONDICIONALES: IF THEN ELSE
# Hemos llegado al punto de que hagas tu primera comparación. Para esto tienes que utilizar
# if then else. Vamos, si esto se cumple haz aquello y si no, pues haz otra cosa. Dicho así
# suena fácil, y realmente lo es. De esta forma. Vamos a establecer una variable a y le vas
# a asignar un nombre. Si este nombre termina en "a" supondremos que es un nombre de mujer, y
# si termina con cualquier otra letra supondremos que es de hombre. Como viste en el capítulo
# anterior del podcast, para utilizar argumentos, son los $1 a $9. De esta manera nuestro
# script tendrá un aspecto como lo que te indico a continuación,
echo
if [[ $1 =~ (.*)a$ || $1 =~ (.*)el$ ]]; then
    echo Sra. $1
else
    echo Sr. $1
fi

# De esta forma aprovecho las características que ofrece los dobles corchetes con las
# expresiones regulares. No es por complicar la cosa. Otro ejemplo, es para saber si
# un número es par o impar. Para ello, puedes hacer un script como el que te muestro
# a continuación,
echo
if [[ $(($2 % 2)) == 0 ]]; then
    echo Par
else
    echo Impar
fi

# ALGUNAS OPCIONES CON IF-THEN-ELSE
# Indicarte que puedes utilizar diferentes opciones, dependiendo del objetivo que persigas.
# Así, puedes hacer, si se cumple algo entonces haz esto
a=3
b=5
c=4
echo
if [[ $a > $b ]]; then
    echo Mayor
else
    echo Menor
fi

echo
if [[ $a > $b ]]; then
    echo Mayor
elif [[ $b > $c ]]; then
    echo Lo que sea
fi

echo
if [[ $a > $b ]]; then
    echo "mayor"
elif [[ $c > $b ]]; then
    echo "lo que sea"
else
    echo "nada de lo anterior"
fi

a=6
b=5
c=4
d=3
e=2
f=1
echo
if [[ $a -gt $b ]]; then
    if [[ $b -gt $c ]]; then
        if [[ $c -gt $d ]]; then
            if [[ $d -gt $e ]]; then
                if [[ $e -gt $f ]]; then
                    echo "$a es muy grande"
                fi
            fi
        fi
    fi
fi

# CONCATENANDO COMPARACIONES
# En ocasiones necesitarás que se cumplan varias condiciones o una combinación de ellas
# para poder tomar una u otra acción. Para conseguir esta concatenación de operaciones,
# tienes que utilizar operadores booleanos,

# y, representado por &&. Esto implica que las dos comparaciones tienen que ser ciertas.
# o, representado por ||. Con que una de las dos comparaciones sea cierta es suficiente.
# Por ejemplo, si quieres comprobar que un fichero es de lectura y escritura,
# tienes que utilizar [[ -r $f ]] && [[ -w $f ]].
# Ahora bien, si te vale con que sea de lectura o escritura, tienes que utilizar el operador ||
# quedando en esta ocasión [[ -r $f ]] || [[ -w $f ]]

# CONDICIONALES: CASE
# Un caso especial es cuando quieres comparar un elemento con diferentes supuestos.
# Podrías hacer if-then concatenados como has visto anteriormente, sin embargo, lo que no me
# puedes negar es que las concatenaciones son difíciles de leer. Al final se convierten el
# algo realmente farragoso, no solo de leer, si no también de trabajar. En algunos casos
# puedes reemplazar estas concatenaciones por otro tipo de comparación como son los Case.
# Lo que sin duda, Case traerá a tu código mucha mas claridad, según el caso, y resultará
# mas cómodo leer el código posteriormente.

# Así la sintasis de los Case es como puedes ver a continuación,

# case <expresión> in
#     <patrón 1>)
#         comandos
#         ;;
#     <patrón 2>)
#         comandos
#         ;;
#     *)
#         comandos
#         ;;
# esac

echo
echo 'Uso del Case'
echo
case $3 in
amarillo)
    echo "optimismo, claridad, calor"
    ;;
naranja)
    echo "amigable, social, seguridad"
    ;;
rojo)
    echo "atrevido, excitación, joven"
    ;;
violeta)
    echo "creatividad, imaginativo, sabio"
    ;;
azul)
    echo "útil, fuerza, fiel"
    ;;
verde)
    echo "paz, salud, crecimiento"
    ;;
blanco)
    echo "equilibrio, tranquilidad, neutro"
    ;;
*)
    echo "Lo siento, no conozco ese color"
    ;;
esac

# No solo lo puedes utilizar en este caso, también puedes complicarlo, añadiendo rangos, un ejemplo,
echo
case $4 in
[0-9])
    echo "Unidades"
    ;;
1[0-9] | 2[0-9] | 3[0-9] | 4[0-9] | 5[0-9] | 6[0-9] | 7[0-9] | 8[0-9] | 9[0-9])
    echo "Decenas"
    ;;
1[0-9][0-9] | 2[0-9][0-9] | 3[0-9][0-9] | 4[0-9][0-9] | 5[0-9][0-9] | 6[0-9][0-9] | 7[0-9][0-9] | 8[0-9][0-9] | 9[0-9][0-9])
    echo "Centenas"
    ;;
1[0-9][0-9][0-9] | 2[0-9][0-9][0-9] | 3[0-9][0-9][0-9] | 4[0-9][0-9][0-9] | 5[0-9][0-9][0-9] | 6[0-9][0-9][0-9] | 7[0-9][0-9][0-9] | 8[0-9][0-9][0-9] | 9[0-9][0-9][0-9])
    echo "Millares"
    ;;
*)
    echo "Ese es un número muy grande 444"
    ;;
esac

# Probablemente te preguntarás que forma mas extraña de poner rangos. La cuestión es que no estamos
# poniendo rangos numéricos, sino que son rango de caracteres, es decir, caracteres que van del 0 al 9.
# En este caso, probablemente sea mejor utilizar if-then,
echo
if [[ $5 -lt 10 ]]; then
    echo "Unidades"
elif [[ $5 -lt 100 ]]; then
    echo "Decenas"
elif [[ $5 -lt 1000 ]]; then
    echo "Centenas"
elif [[ $5 -lt 10000 ]]; then
    echo "Millares"
else
    echo "Un número muy grande 555"
fi

# Pero puedes pervertir el uso de Case como tu quieras. Así puedes simplificar el ejemplo anterior,
# utilizando otra opción con Case,
echo
echo 'Para revisión'
case $6 in
$(($6 <= 10)))
    echo "Unidades"
    ;;
$(($6 <= 100)))
    echo "Decenas"
    ;;
$(($6 <= 1000)))
    echo "Centenas"
    ;;
$(($6 <= 10000)))
    echo "Millares"
    ;;
*)
    echo "Un número muy grande: " $6
    ;;
esac

# Como puedes ver, así que resulta mucho mas sencillo de leer.
# Para terminar, otro ejemplo, donde puedes establecer la periodificación de la historia de
# forma relativamente sencilla utilizando un Case,
echo
echo 'Para revisión'
case $7 in
$(($7 <= -125000))*)
    periodo="Paleolítico inferior"
    ;;
$((-125000 < $7 && $7 <= -35000))*)
    periodo="Paleolítico medio"
    ;;
$((-35000 < $7 && $7 <= -10000))*)
    periodo="Paleolítico superior"
    ;;
$((-10000 < $7 && $7 <= -5500))*)
    periodo="Mesolítico"
    ;;
$((-5500 < $7 && $7 <= -4000))*)
    periodo="Neolítico"
    ;;
$((-4000 < $7 && $7 <= -3000))*)
    periodo="Edad del Cobre"
    ;;
$((-3000 < $7 && $7 <= -2000))*)
    periodo="Edad del Bronce"
    ;;
$((-2000 < $7 && $7 <= -1000))*)
    periodo="Edad del Hierro"
    ;;
*)
    periodo="Historia"
    ;;
esac
echo "Te encuentras en el $periodo"
