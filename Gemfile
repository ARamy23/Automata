# frozen_string_literal: true
ruby '3.1.2'

source "https://rubygems.org"

gem "arkana", "2.0.0"
gem "fastlane", "2.225.0"
gem "danger", "9.5.1"
plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
