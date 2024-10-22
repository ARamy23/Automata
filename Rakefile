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
task default: [:ensure_files, :install_homebrew, :install_rbenv, :install_ruby]

desc "Ensure .zshenv, .zprofile, and .zshrc exist"
task :ensure_files do
  puts "📝 Ensuring .zshenv, .zprofile, and .zshrc exist..."

  [
    ZSHENV_PATH, 
    ZPROFILE_PATH, 
    ZSHRC_PATH
  ].each do |path|
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

desc "Install ruby version"
task :install_ruby do
  ruby_version = '3.1.2'
  puts "🔧 Installing Ruby #{ruby_version}..."
  system("rbenv install --skip-existing #{ruby_version}")
  puts "✅ Ruby #{ruby_version} installed."
  system("rbenv local 3.1.2")
  puts "✅ Ruby #{ruby_version} set as local version."
end