#!/bin/bash

for i in $(npm search $1 -json | jq .[].name | tr -d "\"" ); do
  val=$(npm show $i bin)
  #[ —z $(npm show $i bin)  ] && npm show $i name bin ;
  if [[ -z $val ]]; then echo "⛔ $i" ; else echo ✅ $(npm show $i name ) ; fi
    # echo -e $val
done
