path=('usr/local/bin' '/usr/local/texlive/2019/bin/x86_64-darwin'  $path)
export PATH


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/adam/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/adam/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/adam/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/adam/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

