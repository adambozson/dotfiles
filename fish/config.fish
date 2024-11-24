# ln ~/.config/fish/config.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # disable default fish welcome messasge
    set -g fish_greeting
    
    if test (arch) = "arm64"
        set -g HOMEBREW_PREFIX /opt/homebrew
        set -g CONDA_PREFIX $HOMEBREW_PREFIX/anaconda3
    else
        set -g HOMEBREW_PREFIX /usr/local
        set -g CONDA_PREFIX ~/anaconda3
    end

    eval ($HOMEBREW_PREFIX/bin/brew shellenv)

    # If google-cloud-sdk is installed, run its include script
    set -l gc_dir $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk
    if test -e $gc_dir
        source "$gc_dir/latest/google-cloud-sdk/path.fish.inc"
    end
end