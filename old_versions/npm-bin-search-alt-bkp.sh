#!/bin/bash

# source rainbow.sh

# replace="/home/runner/npm-bin-search/replace"

main ()
{

if [[ -z $1 ]]; then
  read -p "search terms:" terms
else 
  terms="$1"
fi

# NBS_CFG_DIR="$HOME/.config/npm-bin-search"
# mkdir -p "$NBS_CFG_DIR"
# 
# if [[ ! -f "$NBS_CFG_DIR/out_props.conf" ]]; then
  # # echo false
  # echo -e "name\nhomepage\n" > "$NBS_CFG_DIR/out_props.conf"
# fi

out_props="name author description homepage tarball"
# out_props=$(cat "$NBS_CFG_DIR/out_props.conf" | ./replace "name" "" | tr '\n' ' ')

#
# debug
# echo "$out_props"
#

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

show_help()
{
  # ./print-divider
  echo "[npm-bin-search]"
  echo  "Made with love by HLTDev (hltdev8642@gmail.com)"
  echo
  echo "Searches npm registry for input query arg (\$1)"
  echo "and returns global/binary-containing modules in"
  echo "an organized (sorted) table of results"
  echo
  echo "Usage:"
  echo " \`npm-binary-search [query]\`"
  echo
  echo "Config file is generated at:"
  echo " \`\$HOME/.config/npm-bin-search/out_props.config\`"
  echo
  echo "To modify resulting table info (columns) simply"
  echo "just modify this file with the desired props to"
  echo "pull from the registry. (1 property per line)"
  echo
  echo "Example conf:"
  echo "\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`"
  echo "repository_url"
  echo "description"
  echo "..."
  echo "\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`"
  # ./print-divider
}



case $1 in
  --help|-h|help|h)
    show_help
  ;;
  *)
    main $@
  ;;
esac
