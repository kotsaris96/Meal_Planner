# lib/tasks/db_reset.rake
namespace :db do
  desc "Drops the database and recreates it"
  task reset: %w[db:drop db:create db:migrate] do
    # Optionally, you can add other tasks here like `db:seed` if you want to reseed after reset.
    puts "Database has been reset!"
  end
end
