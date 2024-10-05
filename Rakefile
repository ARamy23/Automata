# Rakefile for installing Homebrew, rbenv, direnv, setting up paths, and more

require 'rake'
require 'fileutils'

ZSHENV_PATH = File.expand_path('~/.zshenv')
ZPROFILE_PATH = File.expand_path('~/.zprofile')
ZSHRC_PATH = File.expand_path('~/.zshrc')

RBENV_PATH_LINE = 'export PATH="$HOME/.rbenv/bin:$PATH"'
HOMEBREW_INIT_LINE = 'brew shellenv'
RBENV_INIT_LINE = 'rbenv init'
DIRENV_INIT_LINE = 'direnv hook'

desc "Onboards user by running the following tasks: ensure_files, install_homebrew, install_rbenv, install_direnv, source_files"
task default: [:ensure_files, :install_homebrew, :install_rbenv, :install_direnv, :source_files]

desc "Verify if environment setup is correct"
task verify: [:check_files, :check_homebrew, :check_rbenv, :check_direnv]

desc "Ensure .zshenv, .zprofile, and .zshrc exist"
task :ensure_files do
  puts "📝 Ensuring .zshenv, .zprofile, and .zshrc exist..."

  [ZSHENV_PATH, ZPROFILE_PATH, ZSHRC_PATH].each do |path|
    unless File.exist?(path)
      FileUtils.touch(path)
      puts "Created #{File.basename(path)}"
    end
  end

  puts "✅ Files checked."
end

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

  rbenv_path_line = 'export PATH="$HOME/.rbenv/bin:$PATH"'

  unless zshenv_content.include?(rbenv_path_line)
    File.open(ZSHENV_PATH, 'a') do |file|
      file.puts rbenv_path_line
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

desc "Source .zshenv, .zprofile, and .zshrc files"
task :source_files do
  puts "⚠️  Warning: We are about to source .zshenv, .zprofile, and .zshrc with sudo."
  print "Do you want to continue? (y/n): "
  answer = STDIN.gets.chomp
  if answer.downcase == 'y'
    puts "🔄 Sourcing files with sudo..."
    system("sudo zsh -c 'source #{ZSHENV_PATH}; source #{ZPROFILE_PATH}; source #{ZSHRC_PATH}'")
    puts "✅ Files sourced."
  else
    puts "❌ Operation cancelled."
  end
end

desc "Check if .zshenv, .zprofile, and .zshrc exist"
task :check_files do
  puts "📝 Checking .zshenv, .zprofile, and .zshrc files..."

  [ZSHENV_PATH, ZPROFILE_PATH, ZSHRC_PATH].each do |path|
    if File.exist?(path)
      puts "✅ #{File.basename(path)} exists."
    else
      puts "❌ #{File.basename(path)} is missing."
    end
  end
end

desc "Verify Homebrew installation and setup"
task :check_homebrew do
  if system("command -v brew > /dev/null")
    puts "🍺 Homebrew is installed."
    
    zprofile_content = File.exist?(ZPROFILE_PATH) ? File.read(ZPROFILE_PATH) : ''
    
    if zprofile_content.include?(HOMEBREW_INIT_LINE)
      puts "✅ Homebrew init is present in .zprofile."
    else
      puts "❌ Homebrew init is missing in .zprofile."
    end
  else
    puts "❌ Homebrew is not installed."
  end
end

desc "Verify rbenv installation and setup"
task :check_rbenv do
  if system("command -v rbenv > /dev/null")
    puts "💎 rbenv is installed."
    
    zshenv_content = File.exist?(ZSHENV_PATH) ? File.read(ZSHENV_PATH) : ''
    zprofile_content = File.exist?(ZPROFILE_PATH) ? File.read(ZPROFILE_PATH) : ''

    if zshenv_content.include?(RBENV_PATH_LINE)
      puts "✅ rbenv path is present in .zshenv."
    else
      puts "❌ rbenv path is missing in .zshenv."
    end

    if zprofile_content.include?(RBENV_INIT_LINE)
      puts "✅ rbenv init is present in .zprofile."
    else
      puts "❌ rbenv init is missing in .zprofile."
    end
  else
    puts "❌ rbenv is not installed."
  end
end

desc "Verify direnv installation and setup"
task :check_direnv do
  if system("command -v direnv > /dev/null")
    puts "💎 direnv is installed."
    
    zprofile_content = File.exist?(ZPROFILE_PATH) ? File.read(ZPROFILE_PATH) : ''

    if zprofile_content.include?(DIRENV_INIT_LINE)
      puts "✅ direnv init is present in .zprofile."
    else
      puts "❌ direnv init is missing in .zprofile."
    end
  else
    puts "❌ direnv is not installed."
  end
end
