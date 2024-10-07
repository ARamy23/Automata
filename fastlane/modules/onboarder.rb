fastlane_require 'colored'
fastlane_require 'yaml'
fastlane_require 'json'
fastlane_require 'dotenv'

platform :ios do
  desc "Onboard a new member to the project"
  lane :onboard do
    match(type: "development", readonly: true)
    match(type: "appstore", readonly: true)
    match(type: "development", readonly: true, app_identifier: ENV['DEBUG_BUNDLE_ID'])
  end

  lane :create_service_account_access do
    match(type: "development")
    match(type: "appstore")
  end
end