# instalar_seismic_unix
Script para la instalacion de Seismic Unix en Ubuntu-24.04

Hacer ejecutable el script: chmod +x instalarSU.sh

Para ejecutar: sudo ./instalarSU

Realizar pruebas de que fue instado correctamente.

Abrir una nueva terminal y pegar el siguiente codigo:

**Generar datos sísmicos sintéticos:**

sushw key=delrt a=100 < /dev/zero | suspike ntr=30 nspk=1 d1=0.004 d2=1 | suaddnoise sn=10 > test_data.su

**Visualizar los datos sísmicos generados:**

suxwigb < test_data.su title="Test Data Display" &

