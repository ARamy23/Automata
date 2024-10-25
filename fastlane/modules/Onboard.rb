require 'colored'
require 'yaml'
require 'json'
require 'dotenv'

platform :ios do
  desc "Onboard a new member to the project"
  lane :onboard do
    match(type: "development", readonly: true)
    match(type: "appstore", readonly: true)
  end

  desc "Creates Service Account Access for demo purposes"
  lane :create_service_account_access do
    match(type: "development")
    match(type: "appstore")
  end
end