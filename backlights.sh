#!/bin/bash
#script non pronto
echo "script non pronto "
exit -1
if (( $#!=1 )); then
  echo "Il programma va chiamato con la seguente sintassi:"
  echo $0 "[numero] dove numero e' compreso tra 1 e 100"
fi
#trovare un modo per verificare che l'input è un numero
if [[ $1 ]] 
max=$(cat  /sys/class/backlight/intel_backlight/max_brightness)
x=$1
let "a=x*max/100"
if(( a>max )); then
  let "a=max";
else
	if (( a<0 )); then
		let "a=0";
	fi
fi
sudo echo $a > /sys/class/backlight/intel_backlight/brightness
