#!/bin/bash
# TODO improve argument handling
# https://www.geeksforgeeks.org/bash-script-how-to-use-command-line-arguments/

if [[ "$#" -eq 0 ]]; then
    echo "No source or destination argument provided, requires two arguments. source destination"
    exit 1
fi
if [[ -z $2 ]]; then
    echo "No destination argument provided, requires two arguments. source destination"
    exit 1
fi

declare -a variables_generated=$(grep var. $1 | sed 's/^.*var.//g')
echo "#---- $2" > $2
for value in ${variables_generated[@]};
do
    if [[ $3 == 1 ]]
    then
        echo "variable \"$value\"{}" >> $2
    else
        cat >> $2 << EOF
variable "$value"{
    default = 
    description = 
}
EOF
fi
done