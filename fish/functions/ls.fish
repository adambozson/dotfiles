# ln ~/.config/fish/functions/ls.fish

function ls --description 'List contents of directory'
    l -a $argv
end