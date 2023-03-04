if status is-interactive
    # Commands to run in interactive sessions can go here
    # fish_logo brwhite white white 
    # pokemon-colorscripts -r --no-title
    # cowsay -f bob3 "$(date)"
    date
    pwd
    echo
    fish_add_path /home/justzs/.local/bin
    fish_add_path /home/justzs/.cargo/bin
    source ~/.bash_aliases
    cat ~/.cache/wal/sequences
    export EDITOR=nvim
    abbr --add SP sudo pacman -Syu 
    abbr --add .. cd ..
    abbr --add nvw nvim worksheet.tex
    abbr --add zaw fzathura worksheet.pdf
    abbr --add wifilist nmcli device wifi list
    abbr --add sudo doas
    abbr --add wificonnect nmcli device wifi connect THEWIFINETWORK password THEWIFIPASSWORD
    fish_add_path /home/justzs/.local/share/gem/ruby/3.0.0/bin
    set fish_greeting ""
    end
