if status is-interactive
    set fish_greeting

    fish_vi_key_bindings

    starship init fish | source
    direnv hook fish | source

    function lf
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # NOTE: Fish comes with its own shell wrapper for these command
    # alias ls='ls --color=auto'
    # alias grep='grep --color=auto'
    # alias diff='diff --color=auto'
    # alias la="ls -a"

    set -gx PATH ~/.config/tmux/plugins/tmuxifier/bin $PATH
    eval (tmuxifier init - fish)

    alias tree='tree -C'

    alias py='python3'
    alias nv='nvim'
    alias lg='lazygit'
    alias rm='trash-put'
    alias tx='tmuxinator'
    alias gradle8='/opt/gradle/gradle-8.8/bin/gradle'

    set -x TERM 'xterm-256color'
    set -x EDITOR 'nvim'
    set -x VISUAL 'nvim'

    # Load env vars from shared file
    for line in (cat ~/.env | grep -v '^#' | grep -v '^$')
        set key (string split '=' $line)[1]
        set val (string replace -a '\'' '' (string split '=' $line)[2])
        set -x $key $val
    end

    bind -M insert ctrl-f fzf_open
    bind -M normal ctrl-f fzf_open

    bind -M insert ctrl-y 'commandline -f accept-autosuggestion'

    bind -M insert ctrl-backspace backward-kill-word
    bind -M insert ctrl-h backward-kill-word

    bind -M insert ctrl-l 'clear; commandline -f repaint'
    bind -M normal ctrl-l 'clear; commandline -f repaint'
end
