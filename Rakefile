require 'data_mapper'
require 'dm-postgres-adapter'
require './app/app'

namespace :db do

  desc 'Non-destructive upgrade'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto upgrade complete, no data lost!'
  end

  desc 'Destructive upgrade'
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Auto migrate complete, data was lost!'
  end
end
