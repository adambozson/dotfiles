function l --description 'List contents of directory'
    set -l opt -G
            isatty stdout
            and set -a opt -F
            command ls $opt $argv
end