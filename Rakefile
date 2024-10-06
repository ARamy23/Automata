# Rakefile
require 'rake'
require 'fileutils'

# Import all tasks from lib/tasks directory
Dir.glob('lib/tasks/**/*.rake').each { |r| import r }

# Define any common constants or variables here if needed
ZSHENV_PATH = File.expand_path('~/.zshenv')
ZPROFILE_PATH = File.expand_path('~/.zprofile')
ZSHRC_PATH = File.expand_path('~/.zshrc')

RBENV_PATH_LINE = 'export PATH="$HOME/.rbenv/bin:$PATH"'
HOMEBREW_INIT_LINE = 'brew shellenv'
RBENV_INIT_LINE = 'rbenv init'
DIRENV_INIT_LINE = 'direnv hook'

desc "Install Homebrew and set up in .zprofile"
task :onboard do
  Rake::Task['install_homebrew'].invoke
  Rake::Task['install_rbenv'].invoke
  Rake::Task['install_direnv'].invoke
  Rake::Task['setup_secrets'].invoke
  Rake::Task['verify'].invoke
end