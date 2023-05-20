require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/default'

set :rails_env, 'production'
set :port, 22
set :identity_file, '~/.ssh/ec2.pem'
set :deploy_to, '/home/deployer/investment_api'
set :ruby_version, '3.2.1'
set :term_mode, nil
set :repository, 'git@github.com:edivandecastro/investment_api.git'
set :user, 'ubuntu'
set :force_migrate, true
set :domain, 'ec2-34-238-246-44.compute-1.amazonaws.com'
set :branch, 'master'

set :shared_dirs, fetch(:shared_dirs, []).push(
  'log',
  'tmp',
  'public/uploads',
  'pdfs',
)

set :shared_files, fetch(:shared_files, []).push(
  'config/database.yml',
  'config/master.key'
)

task :ruby_version do
  invoke 'rvm:use', "ruby-#{fetch(:ruby_version)}"
end

task :setup do
  command %(  mkdir -p "#{fetch(:deploy_to)}/shared/tmp"  )
  command %(  chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp"  )

  command %(  mkdir -p "#{fetch(:deploy_to)}/shared/log"  )
  command %(  chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/log"  )

  command %(  mkdir -p "#{fetch(:deploy_to)}/shared/tmp"  )
  command %(  chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp"  )

  command %(  mkdir -p "#{fetch(:deploy_to)}/shared/tmp/pids"  )
  command %(  chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp/pids"  )

  command %(  mkdir -p "#{fetch(:deploy_to)}/shared/config"  )
  command %(  chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/config"  )

  command %(  touch "#{fetch(:deploy_to)}/shared/config/database.yml"  )
  command %(  echo "-----> Be sure to edit "shared/config/database.yml"."  )

  command %(  mkdir -p "#{fetch(:deploy_to)}/shared/public/uploads"  )
  command %(  chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/public/uploads"  )
end

desc "Deploys the current version to the server."
task :deploy do

  deploy do
    invoke 'git:clone'
    invoke 'deploy:link_shared_paths'
    invoke 'ruby_version'
    invoke 'bundle:install'
    invoke 'rails:db_migrate'
    invoke 'seed'
    invoke 'deploy:cleanup'

    on :launch do
      invoke 'puma_restart'
      invoke 'restart_nginx'
    end
  end
end

desc "Dump the database to db/dump.yml"
task :dump_database do
  command! "cd #{fetch(:current_path)}/"
  command! "rake db:data:dump RAILS_ENV=#{fetch(:rails_env)}"
end

desc "Seed data to the database"
task :seed do
  command "bundle exec rake db:seed RAILS_ENV=#{fetch(:rails_env)}"
  command %(echo "-----> Rake Seeding Completed."  )
end

desc 'Display the log file content'
task :logs do
  command 'echo "Contents of the log file are as follows:"'
  command "tail -f #{fetch(:deploy_to)}/current/log/production.log"
end

desc 'Start Puma server'
task :puma_start do
  invoke 'ruby_version'
  command "cd #{fetch(:deploy_to)}/current && bundle exec pumactl start -e production -F config/puma.rb"
end

desc 'Stop Puma server'
task :puma_stop do
  invoke 'ruby_version'
  command "cd #{fetch(:deploy_to)}/current && bundle exec pumactl stop -e production -F config/puma.rb"
end

desc 'Restart Puma server'
task :puma_restart do
  invoke 'ruby_version'
  command "cd #{fetch(:deploy_to)}/current && bundle exec pumactl restart -e production -F config/puma.rb"
end

desc 'Restart nginx service'
task :restart_nginx do
  command 'sudo systemctl stop nginx'
  command 'sleep 10'
  command 'sudo systemctl start nginx'
end
