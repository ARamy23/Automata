namespace :homebrew do
  task :install do
    if system("command -v brew > /dev/null")
      puts "✅ Homebrew is already installed, skipping..."
    else
      puts "🔧 Installing Homebrew..."
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
end
