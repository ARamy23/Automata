desc "Onboard User for Distribution using Fastlane"
task :onboard_fastlane do
  puts "🚀 Onboarding User for Distribution using Fastlane..."
  system("fastlane onboard")
end