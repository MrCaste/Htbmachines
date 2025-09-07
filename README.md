# Htbmachines

**Programa de bash para filtrar las máquinas de hackthebox de la pagina web de s4vitar**
###### Comandos

- -h
- -m
- -u
- -i
- -y
- -d
- -s
- -o

#### Usos y ejemplos de los comandos
###### Comando -h
Uso del panel de ayuda e información de los comandos
```
./htbmachines.sh -h
```
<img width="567" height="190" alt="Image" src="https://github.com/user-attachments/assets/0679d6a3-5e6a-4100-bc9e-3d25d1f3b4af" />
###### Comando -m
Muestra la información de una máquina en concreto
```
./htbmachines.sh -m Validation

```
<img width="746" height="193" alt="Image" src="https://github.com/user-attachments/assets/f7e5c25f-03fe-4e88-a21a-9b815342d8c1" />
###### Comando -u
Descarga los archivos necesarios de la pagina web o los actualiza
```
./htbmachines.sh -u
```
<img width="511" height="110" alt="Image" src="https://github.com/user-attachments/assets/c7a80952-adf1-4dcd-8c06-edf213daab2b" />
###### Comando -i
Busca la información de una maquina en base a su IP
```
./htbmachines.sh -i "10.10.10.123"
```
<img width="1859" height="308" alt="Image" src="https://github.com/user-attachments/assets/d911f903-04b9-4b46-af32-3d4fe1936a6b" />
###### Comando -y
Muestra el link a la resolución en youtube de una máquina dada
```
./htbmachines.sh -y Tentacles
```
<img width="965" height="42" alt="Image" src="https://github.com/user-attachments/assets/eddd8e11-9c4c-4336-8b06-869385dccd86" />
###### Comando -d
Busca las máquinas por un nivel de difficultad comprendido entre Fácil, Media o Difícil
```
./htbmachines.sh -d Media
```
<img width="807" height="341" alt="Image" src="https://github.com/user-attachments/assets/699b7f85-ef8a-426a-9a56-7df04a5ff826" />
###### Comando -s
Busca las máquinas en base a una skill dada necesaria para su resolución
```
./htbmachines.sh -s SQLI
```
<img width="744" height="166" alt="Image" src="https://github.com/user-attachments/assets/fa24b14d-0d2e-447f-bfe2-72c6cc691a69" />
###### Comando  -o
Busca las máquinas en base al sistema operativo Windows/Linux
```
./htbmachines.sh -o Windows
```
<img width="784" height="598" alt="Image" src="https://github.com/user-attachments/assets/01f53beb-b51b-4b41-8e35-4aa273988675" />
###### Comando -o -d
También podemos combinar la busqueda por sistema operativo con la de dificultad
```
./htbmachines.sh -o Windows -d Media
```
<img width="826" height="290" alt="Image" src="https://github.com/user-attachments/assets/b63d2a58-cb86-4b4e-b8f3-42897ffac8ce" />

# INSTALACIÓN

```
git clone https://github.com/MrCaste/Htbmachines.git
```
**Esto es todo, gracias por leer y descargar el programa**
