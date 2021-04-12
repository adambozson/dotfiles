if test (arch) = "arm64"
    set -g HOMEBREW_PREFIX /opt/homebrew
else
    set -g HOMEBREW_PREFIX /usr/local
end

eval ($HOMEBREW_PREFIX/bin/brew shellenv)

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

