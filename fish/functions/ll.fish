# ln ~/.config/fish/functions/ll.fish

function ll --description 'List contents of directory using long format'
    l -lh $argv
end