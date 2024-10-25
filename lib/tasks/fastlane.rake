desc "Set up fastlane onboard"
task :onboard_fastlane do
    puts "Setting fastlabe onboard"
    system("fastlane onboard")
end
