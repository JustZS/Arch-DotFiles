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
    # cat ~/.cache/wal/sequences
    export EDITOR=nvim
    abbr --add SP sudo pacman -Syu 
    abbr --add .. cd ..
    abbr --add nvw nvim worksheet.tex
    abbr --add zaw fzathura worksheet.pdf
    abbr --add sudo doas 
    abbr --add dwmwalclr ./Scripts/dwmwalclr.sh
    abbr --add volume pavucontrol
    abbr --add wificonnect nmcli device wifi connect
    abbr --add wifilist nmcli device wifi list
    fish_add_path /home/justzs/.local/share/gem/ruby/3.0.0/bin
    fish_add_path /usr/lib/R/
    set fish_greeting ""
    bash ./Scripts/startx.sh
    set -g fish_color_normal "#06080B"
    end
