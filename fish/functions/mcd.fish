# ln ~/.config/fish/functions/mcd.fish

function mcd
    mkdir -p $argv; and cd $argv
end
