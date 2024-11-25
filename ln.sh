#!/bin/bash

while getopts ":v" opt; do
  case $opt in
    v)
      export VERBOSE=true
      shift
      ;;
  esac
done

__help () {
  cat << EOF
Usage: ./ln.sh [-v] <command> [path_prefix]

  Commands:
    clean  - remove all links
    link   - (re)create links
    list   - show all links
    update - add/remove links from last git commit

  Options:
    -v     - verbose (show creating/removing links)

  Arguments:
    path_prefix - optional path to limit which files to process
                 (default: current directory)

EOF
}

__sudo () {
  [ -w $(dirname $1) ] || echo "sudo"
}
export -f __sudo

__ln () {
  if [[ $(readlink $2) != $1 ]]; then
    [[ $VERBOSE = true ]] && echo "creating $2"
    $(__sudo $2) mkdir -p $(dirname $2)
    $(__sudo $2) ln -sf $1 $2
  fi
}
export -f __ln

__rm () {
  [[ $VERBOSE = true ]] && echo "removing $1"
  $(__sudo $1) rm -f $1
}
export -f __rm

__show () {
  echo "$( \
    [[ $(readlink $2) = $1 ]] \
      && echo "\033[32m✓" \
      || echo "\033[31m✗" \
    ) $2 -> $1 \033[0m \
  " \
  | sed "s|$HOME|~|g"
}
export -f __show

__ls () {
  local search_prefix="${1:-}"
  local script_dir="$(cd "$(dirname "$0")" && pwd)"
  
  if [ -n "$search_prefix" ]; then
    # If prefix doesn't start with /, assume it's relative to script directory
    if [[ "$search_prefix" != /* ]]; then
      search_prefix="$script_dir/$search_prefix"
    fi
  fi
  
  find "$script_dir" \
    -type f ! -path '*.git/*' \
    | xargs -I {} awk 'NR == 1 && $2 == "ln" { print FILENAME " " $3 }' {} \
    | sed "s|^./|$(pwd)/|;s|~|$HOME|" \
    | while read -r src dest; do
        if [ -z "$search_prefix" ] || [[ "$src" == "$search_prefix"* ]]; then
          echo "$src $dest"
        fi
      done
}

clean () {
  __ls "$1" | awk '{system("__rm " $2)}'
}

link () {
  __ls "$1" | awk '{system("__ln " $1 " " $2)}'
}

list () {
  __ls "$1" | awk '{system("__show " $1 " " $2)}' | column -t -s " "
}

update () {
  local path_prefix="${1:-.}"
  
  git diff HEAD~ | grep "^[-+].*ln" | while read line; do
    if [[ $line =~ ^-.*\ ln\ (.*)$ ]]; then
      file_path="${BASH_REMATCH[1]}"
      if [ -z "$path_prefix" ] || [[ "$file_path" == "$path_prefix"* ]]; then
        __rm "$file_path"
      fi
    fi
  done

  link "$path_prefix"
}

# Get the command and remove it from the arguments
cmd=$1
shift

if [[ $(type -t $cmd) == function ]]; then
  $cmd "$@"
else
  __help
  exit 1
fi