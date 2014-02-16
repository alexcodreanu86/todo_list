require 'active_record'
require 'yaml'
require 'logger'
require_relative 'config/application'

desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
task "db:migrate" => :environment do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERION"] ? ENV["VERSION"].to_i : nil)  
end

task :environment do
  ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))
end

desc "Create a database"
task "db:create" do
  touch DB_PATH
end

desc "Drop database"
task "db:drop" do
  rm_f DB_PATH
end

desc "populate the test database with sample data"
task "db:seed" do
  require APP_ROOT.join('db', 'seed.rb')
end

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./config/application"
end