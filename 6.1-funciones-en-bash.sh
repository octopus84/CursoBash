#!/bin/bash

#funcion para prueba de reutilización
function suma(){
    local resultado=$(($1+$2))
    echo $resultado
}