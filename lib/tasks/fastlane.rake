desc "Onboard new user onto Fastlane"
task :fastlane_onboard do
  # Check if fastlane/configs/.env.default.auth exists, if not duplicate from .env.fastlane.auth.example
  if File.exists?('fastlane/configs/.env.default.auth')
    puts "✅ fastlane/configs/.env.default.auth already exists"
  else 
    system("cp fastlane/configs/example/.env.default.auth.example fastlane/configs/.env.fastlane.auth")
    puts "✅ fastlane/configs/.env.default.auth created"
    puts "🚀 Please fill in the necessary credentials in fastlane/configs/.env.default.auth"
    exit 1
  end

  # run fastlane onboard
  system("fastlane onboard")
end