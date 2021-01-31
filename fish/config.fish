if test (arch) = "arm64"
    set -g HOMEBREW_PREFIX /opt/homebrew
else
    set -g HOMEBREW_PREFIX /usr/local
end

eval ($HOMEBREW_PREFIX/bin/brew shellenv)