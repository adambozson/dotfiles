# vim: set noet:
#
# Set the default prompt command.

function fish_prompt --description "Write out the prompt"
    set -l color_cwd
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    set -g __fish_git_prompt_showupstream git
    set -g __fish_git_prompt_showstashstate yes
    set -g __fish_git_prompt_showcolorhints yes

    set -g __fish_git_prompt_char_dirtystate 🧹
    set -g __fish_git_prompt_char_invalidstate 💥
    set -g __fish_git_prompt_char_stagedstate 🚀
    set -g __fish_git_prompt_char_stashstate 🚩
    set -g __fish_git_prompt_char_untrackedfiles 👾
    set -g __fish_git_prompt_char_upstream_ahead '⬆️ '
    set -g __fish_git_prompt_char_upstream_behind '⬇️ '
    set -g __fish_git_prompt_char_upstream_diverged '🔀 '
    set -g __fish_git_prompt_char_upstream_equal

    echo -n -s (set_color $color_cwd) (prompt_pwd) (set_color normal) (fish_git_prompt) "$suffix "
end
