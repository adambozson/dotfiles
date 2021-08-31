if test (arch) = "arm64"
    set -g HOMEBREW_PREFIX /opt/homebrew
    set -g CONDA_PREFIX $HOMEBREW_PREFIX/anaconda3
else
    set -g HOMEBREW_PREFIX /usr/local
    set -g CONDA_PREFIX ~/anaconda3
end

eval ($HOMEBREW_PREFIX/bin/brew shellenv)

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

