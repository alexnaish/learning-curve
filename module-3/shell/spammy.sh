#!/bin/bash

while sleep 1; 
	do echo $(date);
	if [[ $RANDOM > 26000 ]]; then echo "Error: Test error"; fi;
 done


