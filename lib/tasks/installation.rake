desc "Install Homebrew and set up in .zprofile"
task :install_homebrew do
  if system("command -v brew > /dev/null")
    puts "🍺 Homebrew is already installed, skipping..."
  else
    puts "🍺 Installing Homebrew..."
    system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
    puts "✅ Homebrew installed."
  end

  puts "🔧 Setting up Homebrew in .zprofile if not already present..."

  zprofile_content = File.exist?(ZPROFILE_PATH) ? File.read(ZPROFILE_PATH) : ''

  unless zprofile_content.include?('brew shellenv')
    File.open(ZPROFILE_PATH, 'a') do |file|
      file.puts "# Homebrew"
      file.puts "echo '🍺 Homebrew init...'"
      file.puts 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    end
    puts "✅ Added Homebrew init to .zprofile."
  else
    puts "🍺 Homebrew init already in .zprofile, skipping..."
  end

  puts "🔧 Running installing brew dependencies..."
  system "brew bundle install"
  puts "✅ Brew dependencies installed."
end

desc "Install rbenv and set up in .zshenv and .zprofile"
task :install_rbenv do
  if system("command -v rbenv > /dev/null")
    puts "💎 rbenv is already installed, skipping..."
  else
    puts "💎 Installing rbenv..."
    system('brew install rbenv')
    puts "✅ rbenv installed."
  end

  zshenv_content = File.exist?(ZSHENV_PATH) ? File.read(ZSHENV_PATH) : ''

  unless zshenv_content.include?(RBENV_PATH_LINE)
    File.open(ZSHENV_PATH, 'a') do |file|
      file.puts RBENV_PATH_LINE
    end
    puts "✅ Added rbenv path to .zshenv."
  else
    puts "💎 rbenv path already in .zshenv, skipping..."
  end

  puts "🔧 Setting up rbenv in .zprofile if not already present..."

  zprofile_content = File.exist?(ZPROFILE_PATH) ? File.read(ZPROFILE_PATH) : ''

  unless zprofile_content.include?('rbenv init')
    File.open(ZPROFILE_PATH, 'a') do |file|
      file.puts 'eval "$(rbenv init - zsh)"'
    end
    puts "✅ Added rbenv init to .zprofile."
  else
    puts "💎 rbenv init already in .zprofile, skipping..."
  end
end

desc "Install direnv and set up in .zprofile"
task :install_direnv do
  if system("command -v direnv > /dev/null")
    puts "💎 direnv is already installed, skipping..."
  else
    puts "💎 Installing direnv..."
    system('brew install direnv')
    puts "✅ direnv installed."
  end

  puts "🔧 Setting up direnv in .zprofile if not already present..."

  zprofile_content = File.exist?(ZPROFILE_PATH) ? File.read(ZPROFILE_PATH) : ''

  unless zprofile_content.include?('direnv hook')
    File.open(ZPROFILE_PATH, 'a') do |file|
      file.puts 'eval "$(direnv hook zsh)"'
    end
    puts "✅ Added direnv init to .zprofile."
  else
    puts "💎 direnv init already in .zprofile, skipping..."
  end
end
