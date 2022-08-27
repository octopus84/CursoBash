#!/bin/bash

# TRABAJAR CON TEXTO EN BASH
# Tarde o temprano vas a trabajar con texto en tu script, esto es algo irremediable. 
# Sin embargo, esto no te debería preocupar lo mas mínimo, porque Bash, tiene las 
# herramientas necesarias para que puedes manipular texto de una forma mas o menos 
# sencilla. Así, en este capítulo del tutorial, encontrarás como trabajar con texto en Bash.

# ¿A que me refiero con trabajar con texto en Bash? Vas a poder manipular texto, 
# realizando todo tipo de operaciones básicas, como convertir a mayúsculas o minúsculas, 
# reemplazar una subcadena dentro de otra o quitar parte de la cadena. En este sentido, 
# te recomiendo que le des un vistazo al artículo manipulando texto en el terminal, en 
# el cual está basado parcialmente este capítulo.

# EXPANSIÓN CONDICIONAL
# ¿Que es esto de la expansión condicional? Se trata de reemplazar el valor de la variable
# con otro valor en función de las circustancias. ¿Que circunstancias?. Básicamente si 
# la variable está definida o no está definida, o si está o no vacía.

# Esto lo puedes ver fácilmente en el siguiente cuadro. Si te fijas, la diferencia entre 
# utilizar : es el comportamiento frente a la variable definida pero vacía.


# caso	                    indefinida	        vacia	        valor
# -------------------------------------------------------------------
# ${variable=defecto}	    defecto		                        valor
# ${variable:=defecto}	    defecto	            defecto	        valor
# ${variable-defecto}	    defecto		                        valor
# ${variable:-defecto}	    defecto	            defecto	        valor
# ${variable+alternativa}	                    alternativa	    alternativa
# ${variable:+alternativa}                                      alternativa
# ${variable?error}	        error		                        valor
# ${variable:?error}        error	            error	        valor

# Si te fijas = y -, aparentemente se comportan igual, pero no es exactamente así. Y es que, 
# con = la variable toma el valor que le pasemos para expandir. Por ejemplo,

variable=''
echo ${variable:+'ejemplo'}
echo $variable


# CONVERTIR A MAYÚSCULAS Y MINÚSCULAS
# Si bien en el artículo sobre manipular texto en el terminal puedes ver con profundidad 
# el tratamiento de mayúsculas y minúsculas, te dejo algunas indicaciones,

# Convertir toda una cadena de texto a minúsculas ${cadena,,}
# En el caso de que solo quieras convertir a minúsculas la primera letra ${cadena,}
# Para el caso de convertir el texto a mayúsculas ${cadena^^}
# Y si lo que quieres es convertir a mayúsculas solo la primera letra ${cadena^}

nombre='octavio'
apellido='GODOY'
echo
echo "Variable convertida toda a minuscula: ${nombre^^}"
echo "Variable convertida toda a minuscula: ${nombre^}"
echo "Variable convertida toda a minuscula: ${apellido,,}"
echo "Variable convertida toda a minuscula: ${apellido,}"


# SUBCADENAS
# Otra de las operaciones básicas que también menciono en ese artículo, es la parte 
# de extraer una cadena de texto. Esto sería algo como,

namefull='Octavio Godoy'
echo
echo "Prueba de subcadenas con la variable namefull: ${namefull:0:7}"
echo "Prueba de subcadenas con la variable namefull: ${namefull:8:10}"
echo "Prueba de subcadenas con la variable namefull: ${namefull:8}"


# Es posible omitir el fin, en cuyo caso se tomaría desde el inicio de la cadena 
# hasta la longitud total de la misma. Y por otro lado, también es posible, ir del 
# final al principio, para lo que tienes que poner los valores en negativo, y entre 
# paréntesis. Por ejemplo,

echo 
echo "Ejemplo de subcadenas desde el final al principio: ${namefull:(-10):(-2)}"
echo "Ejemplo de subcadenas desde el final al principio: ${namefull:(-8):(-2)}"v


# De la misma manera que anteriormente, también puedes omitir el fin. En ese caso 
# y para el ejemplo anterior, la solución para ${cadena:(-4)} sería mplo, los últimos 
# cuatro caracteres.

# Esto es así por la expansión condicional que has visto en los primeros apartados. 
# Si quieres evitar utilizar los paréntesis en la expresión puedes separar los dos 
# puntos : y el guión - mediante un espacio, tal y como puedes ver en el siguiente ejemplo,

echo
echo "Extraccion de subcadena omitiendo el final: "${namefull: -4}
echo "Extraccion de subcadena omitiendo el final: "${namefull: -8}


# UTILIZANDO PATRONES
# No solo es posible extraer parte del código en función de su posición, sino que también 
# puedes utilizar patrones para realizar la extracción. Y, esto de los patrones, te puede 
# ser de mucha utilidad. Esto operación se realiza eliminando aquellos caracteres que 
# coincidan con el patrón. Se utilizan dos parejas de operadores.

# La primera pareja de operadores es '#' y '##'. Estos se encargan de eliminar la parte que 
# esté a la izquierda del patrón. En el caso de # se elimina con la coincidencia mínima, 
# mientras que en el caso de ## se busca la coincidencia mas amplia
echo 

otracadena='1|2|3|4|5|6'
echo "Ejemplo elimina primer patron de subcadena: " ${otracadena#*|}
echo "Ejemplo elimina hasta el último patron de subcadena: " ${otracadena##*|}


# En el caso de la segunda pareja de operadores, funciona igual pero por la parte derecha. 
# De esta manera, operando con el mismo ejemplo anterior, tendríamos lo siguiente,
echo
echo "Ejemplo elimina primer patron de subcadena desde el Final: " ${otracadena%|*}
echo "Ejemplo elimina el último patron de subcadena desde el Final: " ${otracadena%%|*}


# Además de admitir el comodín *, también admite ? y también te permite utilizar [] y 
# las negaciones ^. Pero, no solo esto, sino que también admite las clases de carácter, como,

# [[:upper:]] letras en mayúsculas
# [[:lower:]] letras en minúsculas
# [[:alpha:]] mayúsculas y minúsculas
# [[:digit]] dígitos
# [[:xdigit]] hexadecimales
# [[:alnum]] números y letras en mayúsculas y minúsculas
# [[:punct:]] signos de puntuación
# [[:blank:]] espacio y tabuladores
# [[:space:]] espacio tabulador, retorno de carro, etc
# [[:cntrl:]] caracteres de control
# [[:graph:]] todos los caracteres con representación gráfica
# [[:print:]] todos los caracteres con representación gráfica y el espacio
# [[:word:]] caracteres alfanuméricos y el guión bajo.


# REEMPLAZANDO TEXTO
# Otra típica operación que seguro tienes que hacer tarde o temprano es reemplazar 
# texto en una cadena. De esta manera tienes dos opciones. Primero, reemplazar 
# únicamente la primera ocurrencia. Segundo reemplazar todas las ocurrencias que 
# aparezcan en la cadena original. Por ejemplo,
echo

extension='miArchivo.txt'
echo "Ejmplo de reemplazo de caracteres: ${extension/mi/tu}"
echo "Ejmplo de reemplazo de caracteres: ${extension//i/X}"


# Si te fijas, en la primera de las operaciones, solo se reemplaza la primera ocurrencia 
# de e en la cadena de texto. Mientras que en el segundo caso, al utilizar // se 
# reemplazan todas las ocurrencias.

# Siguiendo con el ejemplo anterior, si lo que quieres hacer es, simplemente, eliminar 
# caracteres de una cadena, lo puedes hacer igual, pero sin indicar el reemplazo. 
# Así, por ejemplo,