function fzf_open
    set file (fd . --type f $argv | fzf --layout=reverse --preview="bat --plain --color=always {}")

    if test -z "$file"
        return 1
    end

    set file (realpath -q "$file")
    set dir (dirname "$file")

    cd $dir

    set TYPES_REGEX '^text/|^application/javascript|^application/json|^application/x-python-code|^application/x-sh'

    if file -b --mime-type "$file" | grep -Eq "$TYPES_REGEX"
        $EDITOR "$file"
    else
        nohup xdg-open "$file" >/dev/null 2>&1 &
    end
end
