require 'dotenv'

Dotenv.load('fastlane/configs/.env.auth.default')
Dotenv.load('fastlane/configs/.env.project.default')

module OnboarderModule
  def self.onboarder
    desc "Onboard the project"
    lane :onboard do
      match(type: "development", readonly: true)
      match(type: "appstore", readonly: true)
      match(type: "development", readonly: true, app_identifier: ENV['DEBUG_BUNDLE_ID'])
    end
  end
end