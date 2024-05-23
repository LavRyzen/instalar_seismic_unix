#!/bin/bash

# Seismic Unix 44R28 Installation Script for Ubuntu 24.01 LTS
# Author: Juan Gerardo Peña & LavRyzen
# Date: 22/mayo/2024

# Actualizamos la lista de paquetes disponibles y sus versiones
echo "Actualizando la lista de paquetes..."
sudo apt-get update

# Instalamos las dependencias necesarias
echo "Instalando dependencias necesarias..."
sudo apt-get install -y build-essential libx11-dev libxt-dev libxaw7-dev libxtst-dev libpng-dev libxext-dev libmotif-dev libtirpc-dev libnsl-dev wget

# Nombre del archivo a descargar
FILE="cwp_su_all_44R28.tgz"

# Verificamos si el archivo ya está presente en la carpeta de ejecución
if [ -f "$FILE" ]; then
    echo "El archivo $FILE ya existe en la carpeta de ejecución. Omitiendo descarga..."
else
    # Descargamos la versión 44R28 de Seismic Unix desde el enlace proporcionado
    echo "Descargando Seismic Unix 44R28..."
    wget "https://nextcloud.seismic-unix.org/s/LZpzc8jMzbWG9BZ/download?path=%2F&files=cwp_su_all_44R28.tgz" -O $FILE
    if [ $? -ne 0 ]; then
        echo "Error: No se pudo descargar Seismic Unix 44R28."
        exit 1
    fi

    # Verificamos la integridad del archivo descargado
    echo "Verificando integridad del archivo descargado..."
    gzip -t $FILE
    if [ $? -ne 0 ]; then
        echo "Error: El archivo descargado está corrupto."
        exit 1
    fi
fi

# Creamos un directorio para Seismic Unix y descomprimimos el paquete descargado
echo "Descomprimiendo el paquete de Seismic Unix..."
mkdir -p ~/seismic_unix
tar -xvzf $FILE -C ~/seismic_unix --strip-components=1

# Nos movemos al directorio de Seismic Unix
cd ~/seismic_unix

# Configuramos las variables de entorno necesarias para la compilación
echo "Configurando variables de entorno..."
export CWPROOT=$HOME/seismic_unix
export PATH=$PATH:$CWPROOT/bin

# Añadimos las variables de entorno al archivo .bashrc
echo "Añadiendo variables de entorno al archivo .bashrc..."
echo "export CWPROOT=$HOME/seismic_unix" >> ~/.bashrc
echo "export PATH=\$PATH:\$CWPROOT/bin" >> ~/.bashrc
source ~/.bashrc

# Editamos el archivo Makefile.config para ajustar la configuración a nuestro sistema
#echo "Editando archivo Makefile.config..."
cd $CWPROOT/src/configs
cp Makefile.config_Linux_Ubuntu_22.04 ../Makefile.config
cd ~/seismic_unix/src

# Compilamos Seismic Unix
echo "Compilando Seismic Unix..."
make install

# Compilamos X-toolkit
echo "Compilado X-Toolkit"
make xtinstall

# Compilamos los códigos opcionales (descomentar)
#echo "Compilando códigos adicionales..."
#make finstall  # Fortran codes
#make mglinstall  # OpenGL codes
#make sfinstall  # SFIO for segdread

# Verificamos si la instalación fue exitosa
echo "Verificando instalación..."
if [ -f $CWPROOT/bin/suxwigb ]; then
    echo "Seismic Unix 44R28 se ha instalado correctamente."
else
    echo "Hubo un problema durante la instalación de Seismic Unix 44R28."
fi

echo "Instalación completa."

# Fin del script


