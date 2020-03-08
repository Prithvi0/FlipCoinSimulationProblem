#!/bin/bash -x
echo "Welcome to Flip Coin Simulation"

# DICTIONARY DECLARATION
declare -A Dictionary

# CONSTANTS
COIN_SIDES=HT
NUMBER_OF_COINS=2	# DOUBLET COMBINATION

# TAKING NUMBER OF FLIPS
read -p "Enter number of flips: " NumberOfFlips

# FUNCTION FOR COIN FLIPPING
function NumberOfCoinFlips () {
for ((coins=1;coins<=$NUMBER_OF_COINS;coins++))
   do
      echo -n "${COIN_SIDES:$((RANDOM%${#COIN_SIDES})):1}"
   done
   echo
}

# LOOPING TILL TOTAL NUMBER OF FLIPS AND COINS
for ((flip=0;flip<$NumberOfFlips;flip++))
do
	CoinFlips=$(NumberOfCoinFlips)
	Dictionary[$CoinFlips]=$((${Dictionary[$CoinFlips]}+1))	# STORING THE FACE VALUE OF COIN IN THE DICTIONARY
done

# PRINTING THE DOUBLET COMBINATION PERCENTAGE
for coinFace in ${!Dictionary[@]}
do
	PercentCombination="$coinFace:"`expr "scale=2;${Dictionary[$coinFace]}*100/$NumberOfFlips" | bc`%
done
