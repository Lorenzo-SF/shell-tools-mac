#!/bin/zsh


# =================================================================================================
# ======
# ====== Shell Tools
# ====== V1.0
# ====== 30/10/2024
# ====== Generic tools for make easy for specific scripts
# ======
# ======
# ====== Credits:
# ======    Animations. Original here: https://github.com/Silejonu/bash_loading_animations
# ======    Gradient. Original here: https://github.com/aurora-0025/gradient-terminal
# ======    Themes for boot splash screen: https://github.com/adi1090x/plymouth-themes
# ======
# ======
# =================================================================================================
 
# =================================================================================================
# ====== Variables
# =================================================================================================

trap stop_animation SIGINT

SHELL_TOOLS_VERSION="v1.0"
SYSTEM_PACKAGE_MANAGER=brew
SYSTEM_DISTRO=""
SYSTEM_CODENAME=""
SYSTEM_ARCHITECTURE=""
# =================================================================================================
# ====== Paths

LINK_BASE_PATH=/usr/local/bin

SHELL_TOOLS_BASE_PATH=~/shell-tools
SHELL_TOOLS_CONFIG=$SHELL_TOOLS_BASE_PATH/shell-tools.sh
SHELL_TOOLS_PATH=$SHELL_TOOLS_BASE_PATH/shell-tools.sh
SHELL_TOOLS_LINK_PATH=$LINK_BASE_PATH/shell-tools

ASDF_ROOT_PATH=~/.asdf
ASDF_PATH=$ASDF_ROOT_PATH/asdf.sh

ZSH_PATH_CONFIG=~/.zshrc
OMZ_PATH=~/.oh-my-zsh
OMZ_PLUGINS_PATH=$OMZ_PATH/custom/plugins
OMZ_THEMES_PATH=$OMZ_PATH/themes

# =================================================================================================
# ====== Color scheme

# NO_COLOR='#D4BE98'
# COLOR_PRIMARY='#928374'
# COLOR_SECONDARY='#DB7202'
# COLOR_TERNARY='#2E5386'
# COLOR_QUATERNARY='#D3869B'
# COLOR_SUCCESS='#A9B665'
# COLOR_WARNING='#D8A657'
# COLOR_ERROR='#EA6962'
# COLOR_SAD='#000000'
# COLOR_BACKGROUND='#32302F'

# NO_COLOR="#F8F8F2"
# COLOR_PRIMARY="#E6E6E6"
# COLOR_SECONDARY="#9AEDFE"
# COLOR_TERNARY="#DB7202"
# COLOR_QUATERNARY="#CAA9FA"
# COLOR_SUCCESS="#5AF78E"
# COLOR_WARNING="#F4F99D"
# COLOR_ERROR="#FF6E67"
# COLOR_HAPPY="#FFCDF6"
# COLOR_SAD="#000000"
# COLOR_BACKGROUND="#282A36"


NO_COLOR="#F8F8F2"
COLOR_PRIMARY="#E6E6E6"
COLOR_SECONDARY="#9AEDFE"
COLOR_TERNARY="#DB7202"
COLOR_QUATERNARY="#CAA9FA"
COLOR_SUCCESS="#5AF78E"
COLOR_WARNING="#F4F99D"
COLOR_ERROR="#FF6E67"
COLOR_HAPPY="#FFCDF6"
COLOR_SAD="#000000"
COLOR_BACKGROUND="#282A36"



# =================================================================================================
# ======  Gradient colours

GRADIENT_1='#2B86C5'
GRADIENT_2=''
GRADIENT_3='#784BA0'
GRADIENT_4='#784BA0'
GRADIENT_5='#E66EB2'
GRADIENT_6='#E66EB2'

# ====== Comportamiento de
HIDE_OUTPUT=''
SELECTED_ANIMATION=BRAILLE
SIMPLE_ECHO=""

# =================================================================================================
# ====== Animations

TERMINAL_ANIMATION_ARROW=(▹▹▹▹▹ ▸▹▹▹▹ ▹▸▹▹▹ ▹▹▸▹▹ ▹▹▹▸▹ ▹▹▹▹▸ ▹▹▹▹▹ ▹▹▹▹▹ ▹▹▹▹▹ ▹▹▹▹▹ ▹▹▹▹▹ ▹▹▹▹▹ ▹▹▹▹▹)
TERMINAL_ANIMATION_BOUNCE=(. · ˙ ·)
TERMINAL_ANIMATION_BOUNCING_BALL=("(●     )" "( ●    )" "(  ●   )" "(   ●  )" "(    ● )" "(     ●)" "(    ● )" "(   ●  )" "(  ●   )" "( ●    )")
TERMINAL_ANIMATION_BOX=(┤ ┴ ├ ┬)
TERMINAL_ANIMATION_BRAILLE=(⣷ ⣯ ⣟ ⡿ ⢿ ⣻ ⣽ ⣾)
TERMINAL_ANIMATION_BREATHE=("  ()  " " (  ) " "(    )" " (  ) ")
TERMINAL_ANIMATION_BUBBLE=(· o O O o ·)
TERMINAL_ANIMATION_OTHER_BUBBLE=("  (·)  " "  (·)  " " ( o ) " " ( o ) " "(  O  )" "(  O  )" " ( o ) " " ( o ) " "  (·)  " "  (·)  ")
TERMINAL_ANIMATION_CLASSIC_UTF8=("—" "\\" "|" "/")
TERMINAL_ANIMATION_CLASSIC=("-" "\\" "|" "/")
TERMINAL_ANIMATION_DOT=(∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙ ●∙∙∙∙∙∙∙∙∙∙∙∙∙∙ ∙●∙∙∙∙∙∙∙∙∙∙∙∙∙ ∙∙●∙∙∙∙∙∙∙∙∙∙∙∙ ∙∙∙●∙∙∙∙∙∙∙∙∙∙∙ ∙∙∙∙●∙∙∙∙∙∙∙∙∙∙ ∙∙∙∙∙●∙∙∙∙∙∙∙∙∙ ∙∙∙∙∙∙●∙∙∙∙∙∙∙∙ ∙∙∙∙∙∙∙●∙∙∙∙∙∙∙ ∙∙∙∙∙∙∙∙●∙∙∙∙∙∙ ∙∙∙∙∙∙∙∙∙●∙∙∙∙∙ ∙∙∙∙∙∙∙∙∙∙●∙∙∙∙ ∙∙∙∙∙∙∙∙∙∙∙●∙∙∙ ∙∙∙∙∙∙∙∙∙∙∙∙●∙∙ ∙∙∙∙∙∙∙∙∙∙∙∙∙●∙ ∙∙∙∙∙∙∙∙∙∙∙∙∙∙● ∙∙∙∙∙∙∙∙∙∙∙∙∙●∙ ∙∙∙∙∙∙∙∙∙∙∙∙●∙∙ ∙∙∙∙∙∙∙∙∙∙∙●∙∙∙ ∙∙∙∙∙∙∙∙∙∙●∙∙∙∙ ∙∙∙∙∙∙∙∙∙●∙∙∙∙∙ ∙∙∙∙∙∙∙∙●∙∙∙∙∙∙ ∙∙∙∙∙∙∙●∙∙∙∙∙∙∙ ∙∙∙∙∙∙●∙∙∙∙∙∙∙∙ ∙∙∙∙∙●∙∙∙∙∙∙∙∙∙ ∙∙∙∙●∙∙∙∙∙∙∙∙∙∙ ∙∙∙●∙∙∙∙∙∙∙∙∙∙∙ ∙∙●∙∙∙∙∙∙∙∙∙∙∙∙ ∙●∙∙∙∙∙∙∙∙∙∙∙∙∙ ●∙∙∙∙∙∙∙∙∙∙∙∙∙∙ ∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙)
TERMINAL_ANIMATION_FILLING_BAR=("█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "███▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "█████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "██████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "███████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "█████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "██████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "███████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "█████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "██████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "███████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "█████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "██████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒" "███████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒" "████████████████████▒▒▒▒▒▒▒▒▒▒▒▒" "█████████████████████▒▒▒▒▒▒▒▒▒▒▒" "██████████████████████▒▒▒▒▒▒▒▒▒▒" "███████████████████████▒▒▒▒▒▒▒▒▒" "████████████████████████▒▒▒▒▒▒▒▒" "█████████████████████████▒▒▒▒▒▒▒" "██████████████████████████▒▒▒▒▒▒" "███████████████████████████▒▒▒▒▒" "████████████████████████████▒▒▒▒" "█████████████████████████████▒▒▒" "██████████████████████████████▒▒" "███████████████████████████████▒" "████████████████████████████████")
TERMINAL_ANIMATION_FIREWORK=("⢀" "⠠" "⠐" "⠈" "*" "*" " ")
TERMINAL_ANIMATION_GROWING_DOTS=(".  " ".. " "..." ".. " ".  " "   ")
TERMINAL_ANIMATION_HORIZONTAL_BLOCK=(▏ ▎ ▍ ▌ ▋ ▊ ▉ ▉ ▉ ▊ ▋ ▌ ▍ ▎ ▏)
TERMINAL_ANIMATION_KITT=(▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱ ▰▱▱▱▱▱▱▱▱▱▱▱▱▱▱ ▰▰▱▱▱▱▱▱▱▱▱▱▱▱▱ ▰▰▰▱▱▱▱▱▱▱▱▱▱▱▱ ▱▰▰▰▱▱▱▱▱▱▱▱▱▱▱ ▱▱▰▰▰▱▱▱▱▱▱▱▱▱▱ ▱▱▱▰▰▰▱▱▱▱▱▱▱▱▱ ▱▱▱▱▰▰▰▱▱▱▱▱▱▱▱ ▱▱▱▱▱▰▰▰▱▱▱▱▱▱▱ ▱▱▱▱▱▱▰▰▰▱▱▱▱▱▱ ▱▱▱▱▱▱▱▰▰▰▱▱▱▱▱ ▱▱▱▱▱▱▱▱▰▰▰▱▱▱▱ ▱▱▱▱▱▱▱▱▱▰▰▰▱▱▱ ▱▱▱▱▱▱▱▱▱▱▰▰▰▱▱ ▱▱▱▱▱▱▱▱▱▱▱▰▰▰▱ ▱▱▱▱▱▱▱▱▱▱▱▱▰▰▰ ▱▱▱▱▱▱▱▱▱▱▱▱▱▰▰ ▱▱▱▱▱▱▱▱▱▱▱▱▱▱▰ ▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱)
TERMINAL_ANIMATION_METRO=("[    ]" "[=   ]" "[==  ]" "[=== ]" "[ ===]" "[  ==]" "[   =]")
TERMINAL_ANIMATION_PASSING_DOTS=(".  " ".. " "..." " .." "  ." "   ")
TERMINAL_ANIMATION_PONG=("▐⠂       ▌" "▐⠈       ▌" "▐ ⠂      ▌" "▐ ⠠      ▌" "▐  ⡀     ▌" "▐  ⠠     ▌" "▐   ⠂    ▌" "▐   ⠈    ▌" "▐    ⠂   ▌" "▐    ⠠   ▌" "▐     ⡀  ▌" "▐     ⠠  ▌" "▐      ⠂ ▌" "▐      ⠈ ▌" "▐       ⠂▌" "▐       ⠠▌" "▐       ⡀▌" "▐      ⠠ ▌" "▐      ⠂ ▌" "▐     ⠈  ▌" "▐     ⠂  ▌" "▐    ⠠   ▌" "▐    ⡀   ▌" "▐   ⠠    ▌" "▐   ⠂    ▌" "▐  ⠈     ▌" "▐  ⠂     ▌" "▐ ⠠      ▌" "▐ ⡀      ▌" "▐⠠       ▌")
TERMINAL_ANIMATION_QUARTER=(▖ ▘ ▝ ▗)
TERMINAL_ANIMATION_ROTATING_EYES=(◡◡ ⊙⊙ ⊙⊙ ◠◠)
TERMINAL_ANIMATION_SEMI_CIRCLE=(◐ ◓ ◑ ◒)
TERMINAL_ANIMATION_SIMPLE_BRAILLE=(⠁ ⠂ ⠄ ⡀ ⢀ ⠠ ⠐ ⠈)
TERMINAL_ANIMATION_SNAKE=("[=     ]" "[~<    ]" "[~~=   ]" "[~~~<  ]" "[ ~~~= ]" "[  ~~~<]" "[   ~~~]" "[    ~~]" "[     ~]" "[      ]")
TERMINAL_ANIMATION_TRIANGLE=(◢ ◣ ◤ ◥)
TERMINAL_ANIMATION_TRIGRAM=(☰ ☱ ☳ ☶ ☴)
TERMINAL_ANIMATION_VERTICAL_BLOCK=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █ █ ▇ ▆ ▅ ▄ ▃ ▂ ▁)

# =================================================================================================
# ====== Installation
# =================================================================================================

install_shell_tools() {
    clear

    print_header "$COLOR_SECONDARY" "This is just the begining"

    print_semiheader "Shell-tools"
    print_message_with_animation "Instalando..." "$COLOR_TERNARY" "" "center"
    
    sudo mkdir -p "$LINK_BASE_PATH"

    if [[  -e "$SHELL_TOOLS_LINK_PATH" ]]; then
        sudo rm -f $SHELL_TOOLS_LINK_PATH
    fi

    sudo ln -s $SHELL_TOOLS_PATH $SHELL_TOOLS_LINK_PATH

    if !command -v brew &>/dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo >> /Users/virtualpici/.zprofile
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/virtualpici/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"

        
        exec_command "sudo softwareupdate --install-rosetta"
        
        print_separator "" "=" "full" "" "$COLOR_HAPPY"
        print_message "Se ha instalado Hombrew (brew para los amigos) y Rosetta" "$COLOR_HAPPY" "" "centered"
        print_separator "" "=" "full" "" "$COLOR_HAPPY" "after"
    fi

    if [ ! -d "/Applications/iTerm.app" ] && [[ "$(print_question "¿Quieres instalar iTerm2? Los colorinchis de Trus se verán de fábula" "$COLOR_HAPPY")" = "Y" ]]; then
        install_packages "yes" "iterm2"
        print_separator "" "=" "full" "" "$COLOR_HAPPY"
        print_message "Se ha instalado iTerm2" "$COLOR_HAPPY" "" "centered"
        print_message "Se recomienda encarecidamente ver el siguiente video: https://www.youtube.com/watch?v=27Fi2RcdBFQ" "$COLOR_HAPPY" "" "centered"
        print_message "Es para ver iTerm2 mas bonico" "$COLOR_HAPPY" "" "centered"
        print_separator "" "=" "full" "" "$COLOR_HAPPY" "after"
    fi

    set_terminal_config

    print_header "$COLOR_SECONDARY" "¡You have installed Shell-tools!" "¡OUH YEAH!"
}

install_packages() {
    local preupdate=${1:-""}
    shift 1
    local list_packages=("$@")
    
    
    if [ -z "$preupdate" ]; then
        print_semiheader "Updating system"
        exec_command "brew update && brew upgrade"
        print_message "System updated" "$COLOR_SUCCESS" "after"
    fi 

    for package in "${list_packages[@]}"; do
        print_message_with_animation "Installing $package" "$COLOR_SECONDARY"
        exec_command "brew install $package"
        print_message "$package installed" "$COLOR_SUCCESS"
    done
}


# =================================================================================================
# ====== Tools
# =================================================================================================

check_sudo() {
    local message=$1
    if [ "$EUID" -ne 0 ]; then
        print_message "$message" "$COLOR_ERROR" "" "center"
        exit 1
    fi
}

normalize_text() {
    local text="${1:-""}"
    local uplo="${2:-"lower"}"
    
    text=$(echo "$text" | sed 's/^[[:space:]\t]*//;s/[[:space:]\t]*$//')

    if [ "$uplo" == "upper" ]; then
        text=$(echo "$text" | awk '{print toupper($0)}')
    else
        text=$(echo "$text" | awk '{print tolower($0)}')
    fi

    if command -v iconv >/dev/null 2>&1; then
        echo "$text" | iconv -f utf8 -t ascii//TRANSLIT
    else
        echo "$text"
    fi
}


get_tabs() {
    local tabs=$(($1 * 4))
    printf "%*s" $tabs
}

generate_separator() {
    local length=$1
    local separator=$2

    printf "%${length}s" | tr ' ' "${separator}"
}

pad_message() {
    local message=$1
    local position=${2:-"center"}
    local separator=${3:-" "}
    local max_size=${4:-"-1"}

    local message_length=${#message}
    if [ $max_size -eq -1 ]; then
        IFS=' ' read -r total_length filled_space <<<"$(message_size "$message")"
    else
        filled_space=$max_size
    fi

    case "$position" in
    "left") echo "$(generate_separator $filled_space "$separator")$message" ;;
    "right") echo "$message$(generate_separator $filled_space "$separator")" ;;
    "center")
        filled_space=$((filled_space / 2))
        echo "$(generate_separator $filled_space "$separator")$message$(generate_separator $filled_space "$separator")"
        ;;
    *) echo "Position not valid. Use 'left', 'right' o 'center'." ;;
    esac
}

message_size() {
    local message=$1

    local total_length=$(tput cols)
    local filled_space=$(((total_length - ${#message})))

    echo "$total_length $filled_space"
}

set_terminal_config() {
    GIT_USER_NAME=$(dscl . -read "/Users/$(whoami)" RealName 2>/dev/null | tail -n 1 | xargs)
    GIT_USER_EMAIL=$(git config --global user.email 2>/dev/null || echo "No configurado")

    if [ -z "$SIMPLE_ECHO" ]; then
        local transformed_bg_color=$(echo "${COLOR_BACKGROUND/#\#/}")
        local transformed_fg_color=$(echo "${NO_COLOR/#\#/}")

        # echo -ne "\e]11;#${transformed_bg_color}\e\\"
        # echo -ne "\e]10;#${transformed_fg_color}\e\\"
        set_active_animation "BRAILLE"
    fi

    if [ -z "$HIDE_OUTPUT" ]; then
        REDIRECT=">/dev/null 2>&1"
    else
        REDIRECT=""
    fi
}

exec_command() {
    local command=$1
    local error_message
    local output_message

    command="$command $REDIRECT"

    if output_message=$(eval "$command"); then
        if [[ -n "$HIDE_MESSAGE" ]]; then
            print_message "Command executed successfuly: $command" "$COLOR_SUCCESS" "before"
            print_message "Command output: $output_message" "$COLOR_INFO"
        fi
    else
        print_message "ERROR executing command: $command" "$COLOR_ERROR" "before"
        print_message "Actual path: $(pwd)" "$COLOR_WARNING"
        print_message "Error details: $output_message" "$COLOR_WARNING" "after"
        exit 1
    fi

}

validate_date() {
    local fecha="$1"
    if [[ "$fecha" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        return 0
    else
        return 1
    fi
}

update_config() {
    local option=$1
    local value=$2
    local config_file=$3

    if [ ! -e "$config_file" ]; then
        touch "$config_file"
    fi

    exec_command "sed -i '' 's/^$option=.*/$option='$value'/' '$config_file'"
}
  
    
create_ssh() {
    local SSH_NAME=$1
                           
    if [ -n $SSH_NAME ] && [[ "$(print_question "SE VA A PROCEDER HACER BACKUP DE LAS CLAVES SSH '$SSH_NAME' ACTUALES, BORRAR LA CLAVE EXISTENTE Y CREAR UNA NUEVA HOMÓNIMA" "$COLOR_WARNING")" = "Y" ]]; then
        cd $SSH_PATH

        if [ -f "$SSH_PUBLIC_FILE" ] || [ -f "$SSH_PRIVATE_FILE" ]; then
            print_message "Haciendo backup de las claves '$SSH_NAME' existentes en ~/.ssh..." "$COLOR_SECONDARY"
            mkdir -p "$SSH_PATH/backup_$(date +%Y%m%d_%H%M%S)"
            print_message "Carpeta creada: $SSH_PATH/backup_$(date +%Y%m%d_%H%M%S)" "$COLOR_SUCCESS"

            if [ -f "$SSH_PUBLIC_FILE" ]; then
                mv "$SSH_PUBLIC_FILE" "$SSH_PATH/backup_$(date +%Y%m%d_%H%M%S)/"
                print_message "Guardado archivo: $SSH_PUBLIC_FILE" "$COLOR_TERNARY"
            fi

            if [ -f "$SSH_PRIVATE_FILE" ]; then
                mv "$SSH_PRIVATE_FILE" "$SSH_PATH/backup_$(date +%Y%m%d_%H%M%S)"
                print_message "Guardado archivo: $SSH_PRIVATE_FILE" "$COLOR_TERNARY"
            fi
        fi

        exec_command "yes | ssh-keygen -t ed25519 -f $SSH_PRIVATE_FILE -q -N \"\""
        print_message "Clave creada correctamente" "$COLOR_SUCCESS" "before"

        #Este eval está porque si se instala el entorno en el WSL de windows, el agente no se mantiene levantado
        #En linux no es necesario pero no molesta
        exec_command 'eval "$(ssh-agent -s)"'
        ssh_add_result=$(ssh-add $SSH_PRIVATE_FILE 2>&1)

        if [[ "$ssh_add_result" == *"Identity added"* ]]; then
            print_message "Clave registrada correctamente" "$COLOR_SUCCESS" "both"
            print_message "Por favor, registra la siguiente clave en gitlab: $(cat $SSH_PUBLIC_FILE)" "$COLOR_PRIMARY" "after"
        else
            print_message "Hubo un problema al registrar la clave: $ssh_add_result" "$COLOR_ERROR" "" "centered"
        fi
    else
        print_message "No se ha realizado ninguna tarea de claves .SSH" "$COLOR_WARNING" "both" "center"
    fi
}

# =================================================================================================
# ====== Colors
# =================================================================================================

get_color() {
    local hex=${1:-$COLOR_PRIMARY}
    hex=${hex/#\#/}  
    local r=$(echo $((16#${hex:0:2})))  
    local g=$(echo $((16#${hex:2:2})))
    local b=$(echo $((16#${hex:4:2})))
    
    echo "${r};${g};${b}"  
}

hex_to_rgb() {
    local hex=$1
    local r g b

    r=$(printf "%d" "0x${hex:0:2}")
    g=$(printf "%d" "0x${hex:2:2}")
    b=$(printf "%d" "0x${hex:4:2}")

    echo "$r $g $b"
}

euclidean_distance() {
    local r1=$((16#${1:0:2}))
    local g1=$((16#${1:2:2}))
    local b1=$((16#${1:4:2}))

    local r2=$((16#${2:0:2}))
    local g2=$((16#${2:2:2}))
    local b2=$((16#${2:4:2}))

    local dr=$((r1 - r2))
    local dg=$((g1 - g2))
    local db=$((b1 - b2))

    echo $((dr * dr + dg * dg + db * db))
}

calculate_closest_color() {
    desired_color=$1

    closest_color=""
    closest_distance=-1

    for color in "${TERMINAL_COLORS[@]}"; do
        distance=$(euclidean_distance "$desired_color" "$color")
        if [[ $closest_distance == -1 || $distance -lt $closest_distance ]]; then
            closest_distance=$distance
            closest_color=$color
        fi
    done

    echo
    echo "Requested colour: #$desired_color"
    echo "Nearest colour: #$closest_color"
    echo
}

get_example_color() {
    local campo_seleccionado=${relacionPropiedadesConfigurables[$1]}

    case $campo_seleccionado in
    "COLOR_PRIMARY") print_message "Color example" "$COLOR_PRIMARY" ;;
    "COLOR_SECONDARY") print_message "Color example" "$COLOR_SECONDARY" ;;
    "COLOR_TERNARY") print_message "Color example" "$COLOR_TERNARY" ;;
    "COLOR_QUATERNARY") print_message "Color example" "$COLOR_QUATERNARY" ;;
    "COLOR_SUCCESS") print_message "Color example" "$COLOR_SUCCESS" ;;
    "COLOR_WARNING") print_message "Color example" "$COLOR_WARNING" ;;
    "COLOR_ERROR") print_message "Color example" "$COLOR_ERROR" ;;
    "COLOR_BACKGROUND") print_message "Color example" "$COLOR_BACKGROUND" ;;
    "GRADIENT_1") print_message "Color example" "$GRADIENT_1" ;;
    "GRADIENT_2") print_message "Color example" "$GRADIENT_2" ;;
    "GRADIENT_3") print_message "Color example" "$GRADIENT_3" ;;
    "GRADIENT_4") print_message "Color example" "$GRADIENT_4" ;;
    "GRADIENT_5") print_message "Color example" "$GRADIENT_5" ;;
    "GRADIENT_6") print_message "Color example" "$GRADIENT_6" ;;
    esac
}

show_color_format() {
    print_message "Color format code admited:"

    printf "%-22s %-22s %-25s %-25s\n" "Hex" "RGB/RGBA" "HSL/HSLA" "HSV/HSVA"
    print_separator "" "=" "quarter"

    printf "%-22s %-22s %-25s %-25s\n" "#000" "rgb (255, 0, 0)" "hsl(0, 100%, 50%)" "hsv(0, 100%, 100%)"
    printf "%-22s %-22s %-25s %-25s\n" "000" "rgb 255 0 0" "hsla(0, 100%, 50%, .5)" "hsva(0, 100%, 100%, .5)"
    printf "%-22s %-22s %-25s %-25s\n" "#369C" "rgba (255, 0, 0, .5)" "hsl(0, 100%, 50%)" "hsv (0 100% 100%)"
    printf "%-22s %-22s %-25s %-25s\n" "369C" "" "hsl 0 1.0 0.5" "hsv 0 1 1"
    printf "%-22s %-22s %-25s %-25s\n" "#f0f0f6" "" "" ""
    printf "%-22s %-22s %-25s %-25s\n" "f0f0f6" "" "" ""
    printf "%-22s %-22s %-25s %-25s\n" "#f0f0f688" "" "" ""
    printf "%-22s %-22s %-25s %-25s\n" "f0f0f688" "" "" ""
}

# =================================================================================================
# ====== AWS PODS
# =================================================================================================

list_contexts() {
    kubectl config get-contexts | while read line; do
        print_message "$line" "$COLOR_SECONDARY"
    done
}

list_pods() {
    kubectl get pods | while read line; do
        print_message "$line" "$COLOR_SECONDARY"
    done
}

go_to_pod() {
    local pod=$1
    local context=${2:-""}

    local command_context=""

    if [ -n $pod ]; then
        command_context="-- context $context"
    fi

    if [ -n $pod ]; then
        kubectl exec "$command_context" -it $pod -- /bin/bash
    else
        print_message "El nombre del pod no puede estar vacío" "$COLOR_ERROR"
    fi
}

conect_to_pod() {
    print_title
    list_contexts
    list_pods
    go_to_pod
}

# =================================================================================================
# ====== Git
# =================================================================================================

clone_if_not_exists() {
    local repo_url="$1"
    local target_dir="$2"
    local params=${3:-""}

    exec_command 'eval "$(ssh-agent -s)"'
    ssh_add_result=$(ssh-add $SSH_PRIVATE_FILE 2>&1)

    if [ ! -d "$target_dir" ]; then
        print_message_with_animation "Clonando el repositorio desde '$repo_url' en '$target_dir'..." "$COLOR_SUCCESS"
        if [ ! -z "$params" ]; then
            exec_command "git clone $repo_url $target_dir $params"
        else
            exec_command "git clone $repo_url $target_dir"
        fi
    else
        print_message "El directorio '$target_dir' ya existe. No se clonará el repositorio." "$COLOR_WARNING"
    fi
}

checkout() {
    local HEADER=${1:-""}

    print_message_with_animation "Apuntando a $HEADER..." "$COLOR_TERNARY"
    exec_command "git checkout $HEADER"
    print_message "Apuntando a $HEADER (HECHO)" "$COLOR_SUCCESS"
}

update_git() {
    local branch=$1

    print_message_with_animation "Actualizando repositorio..." "$COLOR_SECONDARY"

    checkout "$branch"
    exec_command "git fetch"
    exec_command "git pull origin $branch"

    print_message "Actualizando repositorio (HECHO)" "$COLOR_SUCCESS"
}

config_git() {
    print_semiheader "GIT"
    print_message "Se va ha configurar la información de usuario de GIT" "$COLOR_PRIMARY" "before"

    local GIT_TEMP_USER_NAME=$(git config --global user.name)
    local GIT_TEMP_USER_EMAIL=$(git config --global user.email)

    print_message "Por favor, introduce tu nombre " "$COLOR_SECONDARY"
    print_message "Si no escribes nada, se deja el valor actual: $GIT_TEMP_USER_NAME" "$COLOR_TERNARY"
    read -r GIT_USER_NAME

    if [ ! -z "$GIT_USER_NAME" ]; then
        GIT_USER_NAME=$GIT_TEMP_USER_NAME
        exec_command "git config --global user.name '$GIT_USER_NAME'"
    fi

    print_message "Por favor, introduce tu email " "$COLOR_SECONDARY"
    print_message "Si no escribes nada, se deja el valor actual: $GIT_TEMP_USER_EMAIL" "$COLOR_TERNARY"
    read -r GIT_USER_EMAIL

    if [ ! -z "$GIT_USER_EMAIL" ]; then
        GIT_USER_EMAIL=$GIT_TEMP_USER_EMAIL
        exec_command "git config --global user.email '$GIT_USER_EMAIL'"
    fi

    print_message "        Si deseas modificarlo, utiliza los siguientes comandos en la terminal:" "$COLOR_PRIMARY" "before"
    print_message "        - Nombre: git config --global user.name "\<user_name\>"'" "$COLOR_SECONDARY"
    print_message "        - Email: git config --global user.email "\<user_email\>"'" "$COLOR_SECONDARY" "before"
}

# =================================================================================================
# ====== Personalization
# =================================================================================================
 
install_omz() {
    print_semiheader "Instalación de Oh-My-ZSH"

    print_separator "" "=" "full" "" "$COLOR_SAD"
    print_message "OJETE CON ESTO" "$COLOR_ERROR" "" "centered"
    print_message "Se va a (RE)instalar Oh-My-ZSH y plugins, lo cual tambien va a SOBREESCRIBIR el archivo .zshrc" "$COLOR_ERROR" "" "centered"
    print_message "Si tenias configuracion propia, es momento de guardarla" "$COLOR_ERROR" "" "centered"
    print_separator "" "=" "full" "" "$COLOR_SAD" "after"

    if [[ "$(print_question "¿Continuar?" "$COLOR_WARNING")" = "Y" ]]; then
        cd

        if [ -e "$OMZ_PATH" ]; then
            rm -fr $OMZ_PATH
        fi


        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

        clone_if_not_exists https://github.com/zsh-users/zsh-syntax-highlighting.git $OMZ_PLUGINS_PATH/zsh-syntax-highlighting
        clone_if_not_exists https://github.com/zsh-users/zsh-autosuggestions $OMZ_PLUGINS_PATH/zsh-autosuggestions
        clone_if_not_exists https://github.com/zsh-users/zsh-completions $OMZ_PLUGINS_PATH/zsh-completions
        clone_if_not_exists https://github.com/gusaiani/elixir-oh-my-zsh.git $OMZ_PLUGINS_PATH/elixir

        print_header "$COLOR_SECONDARY" "OMZ y todos sus plugins instalados correctamente."
        print_message "Los cambios surgiran efecto cuando cierres todas las terminales (incluida esta) y vuelvas a abrir una" "$COLOR_SUCCESS"
        print_message "Para gestionar los temas de ZSH, lanza 'omz theme' y sigue las instrucciones" "$COLOR_SUCCESS" "after"
    fi
}

# =================================================================================================
# ======  Messages
# =================================================================================================

print_message() {
    local message=${1:-""}
    local color=${2:-"$NO_COLOR"}
    local new_line_before_or_after=${3:-"normal"}
    local center=${4:-""}

    local tabs=0
    stop_animation

    if [ -z "$center" ] || [ ! "$center" = "ignore_color_tabs" ]; then
        case "$color" in
        "$COLOR_PRIMARY") tabs=1 ;;
        "$COLOR_SECONDARY" | "$COLOR_SUCCESS" | "$COLOR_ERROR" | "$COLOR_WARNING") tabs=2 ;;
        "$COLOR_TERNARY") tabs=3 ;;
        "$COLOR_QUATERNARY") tabs=4 ;;
        *) tabs=0 ;;
        esac
    fi

    message="$(get_tabs $tabs)$message"

    if [ "$center" = "center" ]; then
        message="$(pad_message "$message")"
    fi

    if [ -z "$SIMPLE_ECHO" ]; then
        case "$new_line_before_or_after" in
        "after") message="$message\n" ;;
        "before") message="\n$message" ;;
        "both") message="\n$message\n" ;;
        "normal") message="$message" ;;
        esac

        if [ "$color" = "gradient" ]; then
            print_message_with_gradient "$message"
        else        
            local transformed_color=$(get_color "$color")
            local transformed_no_color=$(get_color "$NO_COLOR")
            printf "\e[38;2;${transformed_color}m${message}\e[38;2;${transformed_no_color}m\n"
        fi        
    else
        echo "$message"
    fi
}

print_question() {
    # to use: if print_question "<mensaje>" = 0; then    
    local phrase=${1:-""}
    local color=${2:-"$COLOR_PRIMARY"}
    local afirmative_option=${3:-"y"}
    local negative_option=${4:-"n"}
    local response=""

    afirmative_option=$(echo "$afirmative_option" | tr '[:lower:]' '[:upper:]')


    local question="$phrase ($afirmative_option/$negative_option): "
    print_message "$question" "$color"  >&2
    message="$(printf "\t\t=> ")"
    printf "%s" "$message" >&2
    read user_input

    if [ "$user_input" = "$afirmative_option" ]; then
        response=$afirmative_option
    elif [ "$user_input" = "$negative_option" ]; then
        response=$negative_option
    else
        local error_message=$(print_message "La opción '$user_input' no es una respuesta válida." "$COLOR_ERROR" "both" "center")
        read -n 1 -s -r -p "$error_message"
        exit 1
    fi

    echo "$response"
}

print_menu() {
    
    local HELP_SCRIPT=$1
    shift
    local items=("$@")

    if [ "$HELP_SCRIPT" = "" ]; then
        HELP_SCRIPT="echo 'No hay ayuda disponible'"
    else
        HELP_SCRIPT="bash -c 'trus --help $HELP_SCRIPT {}'"
    fi

    printf '%s\n' "${items[@]}" | fzf \
        --ansi \
        --border=rounded \
        --height="$((${#items[@]} + 16))" \
        --info=hidden \
        --layout=reverse \
        --margin=0,3 \
        --padding=1 \
        --preview-window=right,60%,wrap \
        --preview="$HELP_SCRIPT" \
        --prompt="Búsqueda > "
}

extract_menu_option() {
    local input="$1"
    local first_value=$(echo "$input" | cut -d' ' -f1)
    if [[ "$input" == *" - "* ]]; then
        first_value=$(echo "$input" | cut -d' ' -f1)
    fi

    echo "$first_value"
}

print_ascii_image(){
    local logo=("$@")

    local centered_logo=()
    local max_length=$(printf "%s" "${logo_lines[@]}" | awk '{print length($0)}' | sort -nr | head -n1)

    for line in "${logo[@]}"; do
        centered_logo+=("$(pad_message "$line" "center" " " "$max_length")")
    done

    print_message_with_gradient "$(printf "%s\n" "${centered_logo[@]}")"

    sleep 0.5
}


# =================================================================================================
# ====== Especial messages

print_message_with_gradient() {
    local message=$1

    echo "$message" | gterm $GRADIENT_1 $GRADIENT_2 $GRADIENT_3 $GRADIENT_4 $GRADIENT_5 $GRADIENT_6
}

print_separator() {
    local message=${1:-""}
    local separator=${2:-"-"}
    local size_line=${3:-"half"}
    local message_ubication=${4:-"left"}
    local color=${5:-"$NO_COLOR"}
    local new_lines=${6:-"none"}

    IFS=' ' read -r total_length filled_space <<<"$(message_size "$message")"

    local separator_lenght

    case "$size_line" in
    "full") separator_lenght=$filled_space ;;
    "half") separator_lenght=$((filled_space / 2)) ;;
    "quarter") separator_lenght=$((filled_space / 4)) ;;
    "") separator_lenght=$((filled_space / 8)) ;;
    esac

    print_message "$(pad_message "" "$message_ubication" "=" $separator_lenght)" "$color" "$new_lines" "ignore_color_tabs"
}

print_header() {
    local color=${1:-"$COLOR_QUATERNARY"}
    local message_1=${2:-""}
    local message_2=${3:-""}
    local message_3=${4:-""}
    local message_4=${5:-""}

    print_separator "" "=" "full" "" "$color" "before"

    if [ -n "$message_1" ]; then
        print_message "$message_1" "$color" "" "center"
    fi

    if [ -n "$message_2" ]; then
        print_message "$message_2" "$color" "" "center"
    fi

    if [ -n "$message_3" ]; then
        print_message "$message_3" "$color" "" "center"
    fi

    if [ -n "$message_4" ]; then
        print_message "$message_4" "$color" "" "center"
    fi

    print_separator "" "=" "full" "" "$color" "after"
}

print_semiheader() {
    local message=$1
    local color=${2:-"$COLOR_SECONDARY"}

    if [ -z "$SIMPLE_ECHO" ]; then
        print_separator "" "=" "" "" "$color"
    fi

    print_message "====== $message" "$color"
}

print_test_animations() {
    clear
    print_message_with_animation "This is a example message to show the actual animation configured: $SELECTED_ANIMATION"
    local actual_animation=$SELECTED_ANIMATIONS
    if print_question "Do you want to see all the available animations¿Quieres visualizar todas las animaciones disponibles?" = 0; then
        print_message "Now will show ${#ANIMATIONS[@]} animations, in order one at a time since only one can be active at a time"
        for index in "${!ANIMATIONS[@]}"; do
            animation="${ANIMATIONS[$index]}"
            num_animations=$((index + 1))

            set_active_animation "$animation"
            print_message_with_animation "Example nº ${num_animations}: This is a example message with the animation $animation" "$COLOR_SUCCESS"
            sleep 1.5
        done

        set_active_animation "$actual_animation"
    fi
}

print_test_messages() {
    clear

    print_separator "" "=" "quarter" "" "$COLOR_ERROR"
    print_separator "" "=" "half" "" "$COLOR_ERROR"
    print_separator "" "=" "full" "" "$COLOR_ERROR"
    print_separator "" "=" "" "" "$COLOR_ERROR"

    print_semiheader "This is a test semiheader"
    print_message "This is a example message" "$NO_COLOR"
    print_message "This is a example message with empty line BEFORE" "$NO_COLOR" "before"
    print_message "This is a example message with empty line AFTER" "$NO_COLOR" "after"
    print_message "This is a example message with empty line BEFORE and AFTER" "$NO_COLOR" "both"
    print_message "This is a example message CENTRADO" "$NO_COLOR" "" "center"
    print_message "This is a example message of color NO_COLOR" "$NO_COLOR"
    print_message "This is a example message of color COLOR_PRIMARY" "$COLOR_PRIMARY"
    print_message "This is a example message of color COLOR_SECONDARY" "$COLOR_SECONDARY"
    print_message "This is a example message of color COLOR_TERNARY" "$COLOR_TERNARY"
    print_message "This is a example message of color COLOR_QUATERNARY" "$COLOR_QUATERNARY"
    print_message "This is a example message of color COLOR_SUCCESS" "$COLOR_SUCCESS"
    print_message "This is a example message of color COLOR_WARNING" "$COLOR_WARNING"
    print_message "This is a example message of color COLOR_ERROR" "$COLOR_ERROR"
    print_message_with_gradient "This is a example message with GRADIENT"
}

print_not_available(){
    print_message "Opcin no disponible temporalmente" "$COLOR_WARNING" "both" "center"
}
# =================================================================================================
# ====== Animations

play_animation() {
    local tabs=$2
    local message=$1
    local color=$3
    tput civis
    local transformed_color=$(get_color "$color")
    local transformed_no_color=$(get_color "$NO_COLOR")
    
    message="\e[38;2;${transformed_color}m${message}\e[38;2;${transformed_no_color}m"    
    
    start_time=$(date +%s)

    while true; do
        for frame in "${active_animation[@]}"; do
            for ((i = 1; i <= tabs; i++)); do
                frame="\t"${frame}
            done

            current_time=$(date +%s)
            elapsed_time=$((current_time - start_time))
            formatted_time=$(printf "%02d:%02d" $((elapsed_time / 60)) $((elapsed_time % 60))) # Formato mm:ss

            printf "\r$frame $message ($formatted_time)"
            sleep 0.075
        done
    done
}

stop_animation() {
    if [[ -n "$animation_pid" && $(ps -p "$animation_pid" -o comm=) ]]; then
        disown "$animation_pid" 2>/dev/null
        kill "$animation_pid" > /dev/null 2>&1
        wait "$animation_pid" 2>/dev/null
    fi

    local transformed_no_color=$(get_color "$NO_COLOR")

    echo -ne "\x1B[0K"
    tput cnorm
}

print_message_with_animation() {
    local message=${1:-""}
    local color=${2:-"${COLOR_PRIMARY}"}

    local tabs=0

    case "$color" in
    "$COLOR_PRIMARY") tabs=1 ;;
    "$COLOR_SECONDARY" | "$COLOR_SUCCESS") tabs=2 ;;
    "$COLOR_TERNARY" | "$COLOR_ERROR" | "$COLOR_WARNING") tabs=3 ;;
    "$COLOR_QUATERNARY") tabs=4 ;;
    *) tabs=0 ;;
    esac

    if [ -z "$SIMPLE_ECHO" ]; then
        stop_animation
        unset "active_animation[0]"
        play_animation "$message" "$tabs" "$color" &
        animation_pid="${!}"
        sleep 1 # at least, for see the animation live
    else
        print_message "$message" "$color" "$tabs"
    fi
}

set_active_animation() {
    local selected=${1:-$SELECTED_ANIMATION}

    list_name="TERMINAL_ANIMATION_$selected"
    eval "active_animation=(\"\${$list_name[@]}\")"

    update_config "SELECTED_ANIMATION" "$selected" "$SHELL_TOOLS_CONFIG"
}

# =================================================================================================
# ====== Main

if [ "$1" = "-v" ] || [ "$1" = "--version" ]; then
    # local logo = ("")
        
    # print_ascii_image "${logo[@]}"
    print_message "This is SHELL-TOOLS ($SHELL_TOOLS_VERSION) and you are afortunately" "$COLOR_QUATERNARY" "" "center"
    exit 0
elif [[ $0 == "./shell-tools.sh" ]]; then
    install_shell_tools "$1" "$2"
fi
