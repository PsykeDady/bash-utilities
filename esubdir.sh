#!/bin/bash

## Questo script restituisce i percorsi delle cartelle che hanno almeno un numero passato di sottodirectory 
function eSubDir (){

	if (( $# == 1 )) && [[ "$1" = "-h" ]]; then 
		echo "Questa funzione restituisce i percorsi delle cartelle che hanno almeno un certo numero di sottodirectory."
		echo "esempio di chiamata: "
		echo "\t$0 <directory> <numero subdir>"
		echo "\n"
		echo "Casi limite:"
		echo "\t- numero subdirectory = 0 :> viene controllata l'esistenta della cartella corrente"
		echo "\t- numero subdirectory < 0 :> viene restituito il numero massimo di ricorsioni CASO NON IMPLEMENTATO"
		echo "__________ __________"
		echo "valori di ritorno:"
		echo "0 : il programma ha stampato l'help, le cartelle trovate o comunque non ha valori di ritorno particolari"
		echo "1 : numero di parametri sbagliati. controlla l'help o il messaggio di errore"
		echo "<numeri positivi> : errore, controlla il messaggio in console"
		echo "<numeri negativi> : se il parametro di ingresso è negativo, l'output negativo indica il numero massimo di sottodirectory incontrate."
		return 0
	fi
	
	if (( $# != 2 )); then
		echo "troppi parametri o troppi pochi, va chiamato con due parametri:"
		echo "\t$0 <directory> <numero subdir>"
		echo "\n"
		echo "Casi limite:"
		echo "\t- numero subdirectory = 0 :> viene controllata l'esistenta della cartella corrente"
		echo "\t- numero subdirectory < 0 :> viene restituito il numero massimo di ricorsioni NON IMPLEMENTATO"

		return 1
	fi

	if (( $2 < 0 )); then
		echo "questo caso non è ancora implementato!"
		return 2
	fi

	local cartella=$1;
	local ricorsioni=$2;

	if (( $ricorsioni == 0 )); then 
		if [ -d $cartella ]; then
			local stato=-1;
			echo $cartella
		else 
			local stato=0;
		fi
		
		return $stato;
	fi
	
	ricorsioni=$((ricorsioni-1));
	
	OIFS=$IFS;
	IFS=$'\n';
	for i in $(ls $cartella); do 
#		echo "analizzando $cartella/$i"
		if [ -d $cartella/$i ]; then 
#			echo "$cartella/$i è una directory"
			eSubDir $cartella/$i $ricorsioni
		fi;
	done;
	IFS=$OIFS
}

function nSubDir (){
	if (( $# == 1 )) && [[ "$1" = "-h" ]]; then 
		echo "Questa funzione restituisce il massimo numero di sottodirectory."
		echo "esempio di chiamata: "
		echo "\t$0 <directory> -1"
		echo "\t\til -1 è opzionale, non va comunque chiamato con altri valori che non sia -1" 
		echo "\n"
		echo "__________ __________"
		echo "valori di ritorno:"
		echo "0 : non vi sono sottodirectory o è stato eseguito l'help"
		echo "1 : numero di parametri sbagliati o valori sbagliati. controlla l'help o il messaggio di errore"
		echo "<numeri positivi> : errore, controlla il messaggio in console"
		echo "<numeri negativi> : indica il numero massimo di sottodirectory incontrate."
		return 0
	fi
	
	if (( $# != 2 )); then
		echo "Questa funzione restituisce il massimo numero di sottodirectory."
		echo "esempio di chiamata: "
		echo "\t$0 <directory> -1"
		echo "\t\til -1 è opzionale, non va comunque chiamato con altri valori che non sia -1 ( per avere un output veritiero)" 
		echo "\n"
		echo "__________ __________"
		echo "valori di ritorno:"
		echo "0 : non vi sono sottodirectory o è stato eseguito l'help"
		echo "1 : numero di parametri sbagliati o valori sbagliati. controlla l'help o il messaggio di errore"
		echo "<numeri positivi> : errore, controlla il messaggio in console"
		echo "<numeri negativi> : indica il numero massimo di sottodirectory incontrate." 

		return 1
	fi 
	
	max=1
	echo "DA FINIRE"
}

