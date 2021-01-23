function init-conda --description "Initialise Conda"
    eval ~/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
