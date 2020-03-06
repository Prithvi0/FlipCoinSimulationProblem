#!/bin/bash -x
echo "Welcome to Flip Coin Simulation"
# Dictionary declaration
declare -A dictionary

# Taking number of flips
read -p "Enter number of flips: " NumberOfFlips

# Looping till total number of flips
for ((flip=0;flip<$NumberOfFlips;flip++))
do
	RandomCoin=$((RANDOM%2))
	if [ $RandomCoin -eq 0 ]
	then
		face="H"	# Heads
	else
		face="T"	# Tails
	fi
	dictionary[$face]=$((${dictionary[$face]}+1))	# Storing the face value in the dictionary
done
# Printing the singlet combination percentage
for i in ${!dictionary[@]}
do
	PercentCombination=`expr "scale=2;${dictionary[$i]}*100/$NumberOfFlips" | bc`%
done
