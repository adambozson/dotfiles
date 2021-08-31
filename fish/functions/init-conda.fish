function init-conda --description "Initialise Conda"
    eval $CONDA_PREFIX/bin/conda "shell.fish" "hook" $argv | source
end
