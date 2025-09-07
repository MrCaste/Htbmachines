#!/bin/bash

# Variables globales
main_url="https://htbmachines.github.io/bundle.js"

#colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c(){
  echo -e "\n\n${redColour}[!] Saliendo...${endColour}\n"
  tput cnorm && exit 1
}

trap ctrl_c INT

function helpPanel(){
  echo -e "\n${yellowColour}[+]${endColour}${grayColour}Uso:${endColour}"
  echo -e "\t${purpleColour}m)${endColour}${grayColour} Buscar por nombre de maquina${endColour}"
  echo -e "\t${purpleColour}u)${endColour}${grayColour} Descargar o actualizar archivos necesarios${endColour}"
  echo -e "\t${purpleColour}i)${endColour}${grayColour} Buscar maquina en base a una ip${endColour}"
  echo -e "\t${purpleColour}h)${endColour}${grayCOlour} Mostrar panel de ayuda${endCOlour}"
  echo -e "\t${purpleColour}y)${endColour}${grayCOlour} Mostrar link de youtube de una maquina dada${endCOlour}"
  echo -e "\t${purpleColour}d)${endColour}${grayCOlour} Buscar por dificultad${endCOlour}"
  echo -e "\t${purpleColour}o)${endColour}${grayCOlour} Buscar por sistema operativo${endCOlour}"
  echo -e "\t${purpleColour}s)${endColour}${grayCOlour} Buscar por skill${endCOlour}"
}

function searchMachine(){
  machineName="$1"
 
  machineNameChecker="$(cat bundle.js | awk "/name: \"$machineName\"/,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//')"

  if [ "$machineNameChecker" ]; then

    echo -e "\n${yellowColour}[+]${endColour}${grayColour} Listando las propiedades de la maquina${endColour}${blueColour} $machineName${endColour}${grayColour}:${endColour}\n"

    cat bundle.js | awk "/name: \"$machineName\"/,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//'
  else
    echo -e "\n${redColour}[!] La maquina no existe${endColour}\n"
  fi
}

function searchIP(){
  ipAdress="$1"

  machineName="$(cat bundle.js | grep "$ipAdress" -B 3 | grep name | tr -d '"' | tr -d ',' | awk 'NF{print $NF}')"

  if [ "$machineName" ]; then
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} La ip${endColour}${turquoiseColour} $ipAdress${endColour}${grayColour} esta asociada a la maquina:${endColour}${blueColour} $machineName${endColour}\n"
  
    searchMachine $machineName
  else
    echo -e "\n${redColour}[!] La IP no existe${endColour}\n"
  fi  
}

function searchYoutubeLink(){
  machineName="$1"

  link="$(cat bundle.js | awk "/name: \"$machineName\"/,/resuelta/" | grep "youtube" | awk 'NF{print $NF}' | tr -d '"' | tr -d ',')"

  if [ "$link" ]; then

    echo -e "\n${yellowColour}[+]${endColour}${grayColour} el link de youtube de la maquina${endColour}${blueColour} $machineName${endColour}${grayColour} es:${endColour}${redColour} $link${endColour}\n"

  else
    echo -e "\n${redColour}[!] La maquina no existe${endColour}\n"
  fi
}

function searchByDificulty(){
  dificulty="$1"

  machineNames="$(cat bundle.js | grep "dificultad: \"$dificulty\"" -B 5 | grep name | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column)"

  if [ "$machineNames" ]; then
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} las maquinas con la dificultad${endColour}${blueColour} $dificulty${endColour}${grayColour} son:${endColour}\n\n${greenColour}$machineNames${endColour}\n"
  else
    echo -e "\n${redColour}[!] La dificultad no existe${endColour}\n"
  fi
}

function searchByOS(){
  os="$1"

  machineNames="$(cat bundle.js | grep "so: \"$os\"" -B 4 | grep "name:" | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column)"

  if [ "$machineNames" ]; then
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} las maquinas con el sistema operativo de${endColour}${blueColour} $os${endColour}${grayColour} son:${endColour}\n\n${greenColour}$machineNames${endColour}\n"
  else
    echo -e "\n${redColour}[!] El sistema operativo no existe${endColour}\n"
  fi
}

function searchByOsDificulty(){
  os="$1"
  dificulty="$2"

  machineNames="$(cat bundle.js | grep "so: \"$os\"" -C 4 | grep "dificultad: \"$dificulty\"" -B 5 | grep "name:" | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column)"

  if [ "$machineNames" ]; then
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} las maquinas con el sistema operativo de${endColour}${blueColour} $os${endColour}${grayColour} y con la dificultad${endColour}${purpleColour} $dificulty${endColour}${grayColour} son:${endColour}\n\n${greenColour}$machineNames${endColour}\n"
  else
    echo -e "\n${redColour}[!] El sistema operativo o dificultad no existe${endColour}\n"
  fi
}

function searchBySkill(){
  skill="$1"

  machineNames="$(cat bundle.js | grep "$skill" -B 6 -i | grep name: | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column)"

  if [ "$machineNames" ]; then
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} las maquinas con las${endColour}${blueColour} skills${endColour}${grayColour} requeridas son:\n\n${endColour}${greenColour}$machineNames${endColour}\n"
  else
    echo -e "\n${redColour}[!] La skill no existe${endColour}\n"
  fi
}

function updateFiles(){

  if [ ! -f bundle.js ]; then
    tput civis
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} Descargando archivos necesarios...${endColour}\n"
    curl -s $main_url > bundle.js
    js-beautify bundle.js | sponge bundle.js
    echo -e "\n${yellowCOlour}[+]${endColour}${grayColour} Todos los archivos descargados correctamente${endCOlour}\n"
    tput cnorm
  else
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} Comprobando si hay actualizaciones pendientes...${endColour}"
    tput civis
    curl -s $main_url > bundle_temp.js
    js-beautify bundle_temp.js | sponge bundle_temp.js
    md5_temp_value=$(md5sum bundle_temp.js | awk '{print $1}')
    md5_original_value=$(md5sum bundle.js | awk '{print $1}')

    if [ "$md5_temp_value" == "$md5_original_value" ]; then
      echo -e "\n${yellowColour}[+]${endCOlour}${grayColour} No hay actualizaciones disponibles...${endColour}\n"
      rm bundle_temp.js
    else
      echo -e "\n${yellowColour}[+]${endCOlour}${grayColour} Hay actualizaciones disponibles...${endColour}\n"
      rm bundle.js && mv bundle_temp.js bundle.js
      echo -e "\n${yellowColour}[+]${endCOlour}${grayColour} Los archivos han sido actualizados...${endColour}\n"
    fi
    tput cnorm
  fi
}

# Indicadores
declare -i counter=0

# Chivatos
declare -i chivatoOS=0
declare -i chivatoDificulty=0

while getopts "m:ui:hy:d:o:s:" arg; do
  
  case $arg in
    m) machineName=$OPTARG; let counter+=1;;
    u) let counter+=2;;
    h) ;;
    i) ipAdress=$OPTARG; let counter+=3;;
    y) machineName=$OPTARG; let counter+=4;;
    d) dificulty=$OPTARG; chivatoDificulty=1; let counter+=5;;
    o) os=$OPTARG; chivatoOS=1; let counter+=6;;
    s) skill=$OPTARG; let counter+=7;;
  esac
done

if [ $counter -eq 1 ]; then
  searchMachine $machineName
elif [ $counter -eq 2 ]; then
  updateFiles
elif [ $counter -eq 3 ]; then
  searchIP $ipAdress
elif [ $counter -eq 4 ]; then
  searchYoutubeLink $machineName
elif [ $counter -eq 5 ]; then
  searchByDificulty $dificulty
elif [ $counter -eq 6 ]; then
  searchByOS $os
elif [ $counter -eq 7 ]; then
  searchBySkill "$skill"
elif [ $chivatoOS -eq 1 ] && [ $chivatoDificulty -eq 1 ]; then
  searchByOsDificulty $os $dificulty
else
  helpPanel
fi

