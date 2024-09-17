# Homebrew
echo "Setting up Homebrew..."
eval "$(/opt/homebrew/bin/brew shellenv)"

# RBENV
echo "Setting up rbenv..."
eval "$(rbenv init -)"

# direnv hook
echo "Setting up direnv..."
eval "$(direnv hook zsh)"

# Mise
echo "Setting up Mise..."

eval "$(~/.local/bin/mise activate zsh)"



# NVM (Node Version Manager)
echo "Setting up NVM..."

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pnpm
echo "Setting up pnpm..."
export PNPM_HOME="/Users/ahmed/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by Toolbox App
export PATH="$PATH:/usr/local/bin"

# Added by Toolbox App
export PATH="$PATH:/Users/ahmedramy/Library/Application Support/JetBrains/Toolbox/scripts"

