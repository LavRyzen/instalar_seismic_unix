# Seismic Unix 44R28 Installation Script

Este script facilita la instalación de Seismic Unix 44R28 en sistemas Ubuntu 24.01 LTS. Automatiza el proceso de descarga, verificación e instalación de las dependencias necesarias, así como la compilación del código fuente.

## Autores

- Juan Gerardo Peña
- LavRyzen

## Fecha

- 22 de mayo de 2024

## Pre-requisitos

Este script está probado para Ubuntu 24.01 LTS y podría no ser compatible con otras versiones o distribuciones de Linux sin modificaciones.

## Instalación

Para utilizar este script, sigue estos pasos:

1. **Descargar el Script**: Clona este repositorio o descarga el script `install_seismic_unix.sh` directamente en tu máquina local.

    ```bash
    git clone https://github.com/LavRyzen/instalar_seismic_unix
    ```

2. **Hacer el Script Ejecutable**: Navega al directorio donde descargaste el script y cambia los permisos para hacerlo ejecutable.

    ```bash
    
    chmod +x instalarSU.sh
    ```

3. **Ejecutar el Script**: Ejecuta el script con privilegios de superusuario para instalar todas las dependencias necesarias y compilar Seismic Unix.

    ```bash
    sudo ./instalarSU.sh
    ```

## Características del Script

- **Actualización de Paquetes**: Actualiza la lista de paquetes disponibles y sus versiones.
- **Instalación de Dependencias**: Instala todas las dependencias necesarias automáticamente.
- **Descarga y Verificación**: Descarga y verifica la integridad de Seismic Unix 44R28.
- **Configuración de Entorno**: Configura las variables de entorno necesarias y las añade al `.bashrc`.
- **Compilación**: Compila Seismic Unix y opcionalmente otros componentes como X-toolkit.


## Agradecimientos

Agradecemos a los desarrolladores y a la comunidad de Seismic Unix por proporcionar las herramientas y la documentación necesaria para la realización de este script.
