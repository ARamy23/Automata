# SHELL PATHs
ZSHENV_PATH=$(HOME)/.zshenv
ZPROFILE_PATH=$(HOME)/.zprofile
ZSHRC_PATH=$(HOME)/.zshrc

all: ensure_shell_profiles_in_place

ensure_shell_profiles_in_place:
	@echo "📝 Ensuring .zshenv, .zprofile, and .zshrc exist..."
	@if [ ! -f $(ZSHENV_PATH) ]; then touch $(ZSHENV_PATH); echo "Created .zshenv"; fi
	@if [ ! -f $(ZPROFILE_PATH) ]; then touch $(ZPROFILE_PATH); echo "Created .zprofile"; fi
	@if [ ! -f $(ZSHRC_PATH) ]; then touch $(ZSHRC_PATH); echo "Created .zshrc"; fi
	@echo "✅ Files checked."

install_homebrew:
	@if ! command -v brew > /dev/null; then \
		echo "🍺 Installing Homebrew..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
		echo "✅ Homebrew installed."; \
	else \
		echo "🍺 Homebrew is already installed, skipping..."; \
	fi

		@echo "🔧 Setting up Homebrew in .zprofile if not already present..."
	@if ! grep -q 'brew shellenv' $(ZPROFILE_PATH); then \
		echo "# Homebrew" >> $(ZPROFILE_PATH); \
		echo "echo '🍺 Homebrew init...'" >> $(ZPROFILE_PATH); \
		echo "eval \"\$$(/opt/homebrew/bin/brew shellenv)\"" >> $(ZPROFILE_PATH); \
		echo "✅ Added Homebrew init to .zprofile."; \
	else \
		echo "🍺 Homebrew init already in .zprofile, skipping..."; \
	fi

install_rbenv:
	@if ! command -v rbenv > /dev/null; then \
		echo "💎 Installing rbenv..."; \
		brew install rbenv; \
		echo "✅ rbenv installed."; \
	else \
		echo "💎 rbenv is already installed, skipping..."; \
	fi

	@if ! grep -q '$(RBENV_PATH)' $(ZSHENV_PATH); then \
		echo "$(RBENV_EXPORT)" >> $(ZSHENV_PATH); \
		echo "✅ Added rbenv path to .zshenv."; \
	else \
		echo "💎 rbenv path already in .zshenv, skipping..."; \
	fi

	@echo "🔧 Setting up rbenv .zprofile if not already present..."
	@if ! grep -q 'rbenv init' $(ZPROFILE_PATH); then \
		echo "eval \"\$$$(rbenv init - zsh)\"" >> $(ZPROFILE_PATH); \
		echo "✅ Added rbenv init to .zprofile."; \
	else \
		echo "💎 rbenv init already in .zprofile, skipping..."; \
	fi

install_ruby:
	rbenv install -s 3.1.2
	rbenv local 3.1.2
