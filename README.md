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
###### Comando -m
Muestra la información de una máquina en concreto
```
./htbmachines.sh -m Validation

```
###### Comando -u
Descarga los archivos necesarios de la pagina web o los actualiza
```
./htbmachines.sh -u
```
###### Comando -i
Busca la información de una maquina en base a su IP
```
./htbmachines.sh -i "10.10.10.123"
```
###### Comando -y
Muestra el link a la resolución en youtube de una máquina dada
```
./htbmachines.sh -y Tentacles
```
###### Comando -d
Busca las máquinas por un nivel de difficultad comprendido entre Fácil, Media o Difícil
```
./htbmachines.sh -d Media
```

###### Comando -s
Busca las máquinas en base a una skill dada necesaria para su resolución
```
./htbmachines.sh -s SQLI
```
###### Comando  -o
Busca las máquinas en base al sistema operativo Windows/Linux
```
./htbmachines.sh -o Windows
```
###### Comando -o -d
También podemos combinar la busqueda por sistema operativo con la de dificultad
```
./htbmachines.sh -o Windows -d Media
```

# INSTALACIÓN

```
git clone https://github.com/MrCaste/Htbmachines.git
```
**Esto es todo, gracias por leer y descargar el programa**
