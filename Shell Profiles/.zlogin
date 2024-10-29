BOLD="\033[1m"
CYAN="\033[36m"
YELLOW="\033[33m"
RESET="\033[0m"

# Display a welcome message
echo """${BOLD}${CYAN}
  _  _     _ _         _____ _                _ 
 | || |___| | |___    |_   _| |_  ___ _ _ ___| |
 | __ / -_| | / _ \_    | | | ' \/ -_| '_/ -_|_|
 |_||_\___|_|_\___( )   |_| |_||_\___|_| \___(_)
                  |/                            
${RESET}"""

# The -e option enables interpretation of backslash escapes for formatting.
echo -e "${BOLD}${CYAN}Welcome, $(whoami)!${RESET}"
echo -e "${YELLOW}Today is $(date +'%A, %B %d, %Y').${RESET}"
echo -e "You're logged in on $(hostname) in directory $(pwd)."
echo -e "Have a productive day!"