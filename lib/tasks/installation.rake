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

  puts "👀 Checking if ruby 3.1.2 exists..."

  unless system("rbenv versions | grep 3.1.2 > /dev/null")
    puts "💎 Installing Ruby 3.1.2..."
    system("sudo rbenv install -s 3.1.2")
    puts "✅ Ruby 3.1.2 installed."
  else
    puts "💎 Ruby 3.1.2 already installed, skipping..."
  end

  puts "🔧 Setting local Ruby version to 3.1.2..."
  system("rbenv local 3.1.2")

  puts "🔧 Running bundle install..."
  system("bundle install")
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

  puts "🔧 Running direnv allow..."
  system("direnv allow")
end

desc "Installs mise and sets it up in .zprofile for tuist"
task :install_mise do
  if system("command -v mise > /dev/null")
    puts "💎 mise is already installed, skipping..."
  else
    puts "💎 Installing mise..."
    system("curl https://mise.run | sh")
  end

  puts "🔧 Setting up mise in .zprofile if not already present..."

  zprofile_content = File.exist?(ZPROFILE_PATH) ? File.read(ZPROFILE_PATH) : ''

  unless zprofile_content.include?('mise activate')
    File.open(ZPROFILE_PATH, 'a') do |file|
      file.puts 'eval "$(~/.local/bin/mise activate zsh)"'
    end
    puts "✅ Added mise init to .zprofile."
  else
    puts "💎 mise init already in .zprofile, skipping..."
  end
end

desc "Sets up the project with Tuist"
task :setup_tuist do
  puts "🔧 Installing Tuist..."
  system("mise install tuist@4.27.0")
  puts "✅ Tuist installed."
  system("mise use tuist@4.27.0")
  puts "🔧 Setting up Tuist..."
  system("tuist install")
  puts "⚙️ Caching Tuist dependencies..."
  system("tuist cache")
  puts "🔧 Generating project with Tuist..."
  system("tuist generate")
  puts "✅ Project generated with Tuist."
end

desc "Source Shell Profiles"
task :source_shell_profiles do
  File.open('/tmp/temp_script.sh', 'w') do |file|
    if File.exist?(ZSHENV_PATH)
      file.puts 'source ~/.zshrc'
    end
    
    if File.exist?(ZPROFILE_PATH)
      file.puts 'source ~/.zprofile'
    end 

    if File.exist?(ZSHRC_PATH)
      file.puts 'source ~/.zshenv'
    end
  end

  puts "🔧 Sourcing shell profiles..."
  sh "chmod +x /tmp/temp_script.sh"
  sh "zsh /tmp/temp_script.sh"
  sh "rm /tmp/temp_script.sh"

  puts "✅ Shell profiles sourced."
end