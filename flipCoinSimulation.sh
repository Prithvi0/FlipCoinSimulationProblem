#!/bin/bash -x
echo "Welcome to Flip Coin Simulation"

# Flip a coin to display Heads or Tails
flip=$((RANDOM%2))
if [ $flip -eq 0 ]
then
	flip=Heads
else
	flip=Tails
fi
