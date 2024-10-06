desc "Verify installation of rbenv, direnv, and Homebrew"
task :verify do 
  Rake::Task['check_files'].invoke
  Rake::Task['check_homebrew'].invoke
  Rake::Task['check_rbenv'].invoke
  Rake::Task['check_direnv'].invoke
  Rake::Task['check_brew_bundle'].invoke
end

desc "Verify if .zshenv, .zprofile, and .zshrc exist"
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

task :check_brew_bundle do
  puts "🔧 Checking Brewfile and installing dependencies..."
  system "brew bundle check"
end
