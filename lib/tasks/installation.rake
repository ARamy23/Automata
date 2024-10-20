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

  Rake::Task['source_shell_profiles'].invoke

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

  system("rbenv install 3.1.2")
  system("rbenv global 3.1.2")
  system("gem install bundler")
  system("rbenv rehash")
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
  puts "🔧 Generating project with Tuist..."
  system("tuist install")
  system("tuist generate")
  puts "✅ Project generated with Tuist."
end

desc "Source Shell Profiles"
task :source_shell_profiles do
  File.open('/tmp/temp_script.sh', 'w') do |file|
    file.puts 'source ~/.zshrc'
    file.puts 'source ~/.zprofile'
    file.puts 'source ~/.zshenv'
  end

  puts "🔧 Sourcing shell profiles..."
  sh "chmod +x /tmp/temp_script.sh"
  sh "zsh /tmp/temp_script.sh"
  sh "rm /tmp/temp_script.sh"

  puts "✅ Shell profiles sourced."
end