# Commands to run in interactive sessions can go here
if status is-interactive
    # No greeting
    set fish_greeting

    # Suppress CachyOS prompt plugin errors
    set -q pure_truncate_prompt_current_directory_keeps; or set -g pure_truncate_prompt_current_directory_keeps 2
    set -q fish_prompt_pwd_dir_length; or set -g fish_prompt_pwd_dir_length 3
    set -q __done_min_cmd_duration; or set -g __done_min_cmd_duration 5000

    # Use starship
    function starship_transient_prompt_func
        starship module character
    end
    if test "$TERM" != "linux"
        starship init fish | source
        enable_transience
    end
    
    # Colors
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Aliases
    # kitty doesn't clear properly so we need to do this weird printing
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    alias pamcan pacman
    alias q 'qs -c ii'
    if test "$TERM" != "linux"
        alias ls 'eza --icons'
    end
    if test "$TERM" = "xterm-kitty"
        alias ssh 'kitten ssh'
    end
end
