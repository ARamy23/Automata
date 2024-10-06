desc "Set up secrets from .env and .arkana.yml"
task :setup_secrets do
  puts "Setting up your secrets."
  envFilePath = File.expand_path('.env')
  arkanaFilePath = File.expand_path('.arkana.yml')

  if !File.exist?(envFilePath)
    puts "❌ .env file is missing..."
    puts "🔧 Copying .env.example to .env..."
    system("cp .env.example .env")
  end

  unless File.exist?(envFilePath) && File.exist?(arkanaFilePath)
    puts "❌ .env or .arkana.yml file is missing."
    return -1
  end

  puts "🔧 Generating secrets from .arkana.yml & .env..."
  system("bundle exec arkana")
  puts "✅ Secrets installed successfully"
end
