#!/bin/bash -x
echo "Welcome to Flip Coin Simulation"

# DICTIONARY DECLARATION
declare -A Dictionary

# CONSTANTS
COIN_SIDES=HT

# TAKING NUMBER OF FLIPS AND COINS FROM THE USER
read -p "Enter number of flips: " NumberOfFlips

# FUNCTION TO SORT COIN COMBINATIONS
function coinCombinationSort() {
	# FUNCTION FOR COIN FLIPPING
	function NumberOfCoinFlips () {
		for ((coins=1;coins<=$1;coins++))
   	do
      	echo -n "${COIN_SIDES:$((RANDOM%${#COIN_SIDES})):1}"
   	done
   	echo
	}	# END OF NumberOfCoinFlips FUNCTION

	# LOOPING TILL TOTAL NUMBER OF FLIPS AND COINS
	for ((flip=0;flip<$NumberOfFlips;flip++))
	do
		CoinFlips=$(NumberOfCoinFlips $1)	# CALLING FUNCTION
		Dictionary[$CoinFlips]=$((${Dictionary[$CoinFlips]}+1))	# STORING THE FACE VALUE OF COIN IN THE DICTIONARY
	done

	# PRINTING THE COINS COMBINATION PERCENTAGE
	for coinFace in ${!Dictionary[@]}
	do
		echo `expr "scale=2;${Dictionary[$coinFace]}*100/$NumberOfFlips" | bc`"%:$coinFace"
	done | sort -rn
}	# END OF coinCombinationSort FUNCTION

# CALLING FUNCTIONS WITH SINGLET, DOUBLET AND TRIPLET COMBINATIONS TO SHOW THE WINNING COMBINATIONS
SingletSort="$(coinCombinationSort 1)"
DoubletSort="$(coinCombinationSort 2)"
TripletSort="$(coinCombinationSort 3)"
