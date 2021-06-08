#!/bin/bash


out_props="name author description homepage tarball"

main ()
{

if [[ -z $1 ]]; then
  read -p "search terms:" terms
else 
  terms="$1"
fi

for i in $(npm search $terms -json 2</dev/null | jq .[].name | tr -d "\"" ); do
  val=$(npm show $i bin)
  #[ —z $(npm show $i bin)  ] && npm show $i name bin ;
  if [[ -z $val ]]; then
    # echo ""
    echo "[ ⛔ $i ]"
    # echo ""

  else
    echo ""
    # ./print-divider
    echo "[ ✅ $i ]"
    npm show $i ${out_props}
    # ./print-divider
    echo ""
  fi
    # echo -e $val
done


}


main "$@"

