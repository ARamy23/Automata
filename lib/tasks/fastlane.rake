desc "Onboard new user onto Fastlane"
task :fastlane_onboard do
  # Check if fastlane/.env.fastlane.auth exists, if not duplicate from .env.fastlane.auth.example
  if File.exists?('fastlane/.env.fastlane.auth')
    puts "✅ fastlane/.env.fastlane.auth already exists"
  else 
    system("cp fastlane/.env.fastlane.auth.example fastlane/.env.fastlane.auth")
    puts "✅ fastlane/.env.fastlane.auth created"
    puts "🚀 Please fill in the necessary credentials in fastlane/.env.fastlane.auth"
    exit 1
  end

  # run fastlane onboard
  system("fastlane onboard")
end