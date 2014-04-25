#! /bin/bash
#---------------------------------------------------------------------Jose Daniel Salas Villaldea------------------------------------------------------------#
#---------------------------------------------------------------Script para poder manejarse con github-------------------------------------------------------#
#---------------------------------------------------------------------Version 1.5 (BETA)---------------------------------------------------------------------#
#Ultimos añadidos(1.5):Codigo completo modulado, añadido un pequeño menu-------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------------------------------------------------------#
#Futuros añadidos(1.6):Añadir "VER MODIFICACIONES",pulir codigo, etc-----------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------------------------------------------------------#
#Descripción: Pequeño script para poder hacer un poco mas facil la subida de ficheros a github---------------------------------------------------------------#


function enter 
{
    echo "--------------------------------------------------------------------------"
    echo "--------------------------------------------------------------------------"
    echo "--------------------------------------------------------------------------"
    echo "PULSE ENTER"
    read
    clear
}
function CD
{
    clear
    echo "--------------------------------------------------------------------------"
    echo "Empecemos, en primer lugar dirigete a la carpeta donde tienes/quieres-----"
    echo "meter tus archivos.Si quieres subir al github, recomendable hacer una-----"
    echo "carpeta para que,posteriormente ,no tener que ejecutar algunos comandos---"
    echo "--------------------------------------------------------------------------"
    echo "Ejemplo 'Documents/GITHUB/scripts' "
    echo "ESTAS AQUI: ***$PWD***"
    echo "--------------------------------------------------------------------------"
    echo "¿Estas trabajando en la carpeta $PWD? o necesitas moverte.: 0/1 (MOV/QUEDA"
    read opcion
    case $opcion in
    0)
        echo "IMPORTANTE : EMPIEZA DESDE /HOME/$USER/"
        echo "--------------------------------------------------------------------------"
        echo "Introduzca la ruta:"
        read ruta
            cd "/home/$USER/$ruta"
        echo "Ahora estamos aqui!: ***$PWD***"
        ;;
    1)
        echo "Ahora estamos aqui!: ***$PWD***"
        ;;
    esac
}
function meter
{
    echo "--------------------------------------------------------------------------"
    echo "Hora de añadir cosas..."
    echo "--------------------------------------------------------------------------"
    echo "¿Hay algo nuevo?"
    echo "(si hay algo nuevo por ejemplo aparece NEW FILE o archivo modificado...)"
    echo "--------------------------------------------------------------------------"
    git status
    echo "Elija la pcion que quieras: 1 para añadir archivos poco a poco, otra para "
    echo "añadirlo todo a la vez"
    read opcion

    case $opcion in
    0)
     echo "--------------------------------------------------------------------------"
     echo "--------------------------------------------------------------------------"
     echo "Añadamos todo lo que pillemos!!"
        git add *
            echo "CONSEGIDO!!!!"
        ;;
    1)
     echo "--------------------------------------------------------------------------"
     echo "--------------------------------------------------------------------------"
     echo "Añadimos arhivos poquito a poco!!"
        final=1
        while [ $final -eq 1 ];do
            echo "Añade nombre archivo:" 
            read archivo
            git add $archivo
            echo "¿Quieres añadir mas?(Y/N):" 
            read resp

                 if [ $resp = "N" ];
                     then
                        final=0                   
                        echo "CONSEGIDO!!!!"
                     fi
        done
        ;;
    esac

}
function commit
{
echo "--------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------"
echo "¿Ponemos un commit no?. Que quieres poner de comentario"
read comentario
git commit -m "$comentario"
echo "--------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------"
git status
}

function conectar
{
        echo "--------------------------------------------------------------------------"
        echo "Ahora nos vamos a conectar a nuestro repositorio"
        echo "--------------------------------------------------------------------------"
        echo "--------------------------------------------------------------------------"
        echo "Si no tienes un repositorio creado aun , crealo hijo mio :)"
        echo "--------------------------------------------------------------------------"
        echo "¿Has conectado alguna vez con tu repositorio desde esta carpeta?"
                read resp
                if [ $resp = "N" ];
                then
                         echo "Introduce el HTTPS del directorio(Sale abajo a la derecha dentro del repo"
                         echo "Ejemplo: https://github.com/dasavi94/scripts.git "
                         echo "--------------------------------------------------------------------------"
                         read https
                         git remote add origin $https          
                fi

}
function pull1
{
echo "--------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------"
echo "Ahora hacemos un pull..."
git pull origin master
}
function pull2
{

echo "--------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------"
echo "Ahora hacemos un pull..."
conectar
git pull origin master

}
function subirDatos
{

echo "--------------------------------------------------------------------------"
echo "Y sincronizamos los datos :)"
echo "--------------------------------------------------------------------------"
echo "Va a pedirte tu email (o user) y pass del github"
 git push -u origin master
}
function init
{
echo "--------------------------------------------------------------------------"
echo "¿Hiciste alguna vez el git init anteriormente en esta carpeta? Y/N"
echo "Sirve para poner la carpeta sea de github"
read respuesta
if [ $respuesta = "N" ];
then
    git init
    echo "CONSEGIDO!!!!"
fi
}


function COMPLETO
{
clear
echo "--------------------------------------------------------------------------"
echo "Hola $USER"
echo "--------------------------------------------------------------------------"
echo "Este script es para poder conectarse , hacer commits , subir archivos ..."
echo " a git hubb!! todo un logro!"
echo "--------------------------------------------------------------------------"
echo "Hazme caso y no será tan dificil :)"
enter

#************************************LLAMADA A LA FUNCION CD*********************!
CD
#********************************************************************************!

init

enter

#*********************************LLAMADA A LA FUNCION meter*********************!
meter
#********************************************************************************!
#********************************LLAMADA A LA FUNCION commit*********************!
commit 
#********************************************************************************!

enter
#******************************LLAMADA A LA FUNCION conectar*********************!
conectar
#********************************************************************************!
enter
#****************************LLAMADA A LA FUNCION subirDatos*********************!
subirDatos
#********************************************************************************!
echo "--------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------"
echo "LISTO , A DISFRUTAR :O :)"

}
function DESCARGARTODOSARCHIVOS
{
echo "Metete en la carpeta en la que quieres meter tus archivos."
CD
init

pull2
}
#******************************MENU DEL SCRIPT***********************************!

function MENU
{
echo "**************************MENU PARA SCRIPT GITHUB******************************"
echo "0)Proceso completo.************************************************************"
echo "1)Descargar archivos repositorios.*********************************************"
echo "10)Salir.++++++++++************************************************************"
echo "*******************************************************************************"
read opcion
case $opcion in
    0)
        COMPLETO
        
        ;;
    1)
        DESCARGARTODOSARCHIVOS   
        ;;
    10)
            echo "Gracias por utilizar el script!!!"
            kill
        ;;
    esac

}


MENU
