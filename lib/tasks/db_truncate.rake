namespace :db do
  desc "Truncate all tables (except ar_internal_metadata and schema_migrations) and reset primary key sequences"
  task truncate_all: :environment do
    excluded_tables = ["ar_internal_metadata", "schema_migrations"]

    ActiveRecord::Base.connection.tables.each do |table|
      next if excluded_tables.include?(table) # Skip the excluded tables

      if Rails.env.production?
        puts "Skipping table truncation in production for safety!"
      else
        ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} RESTART IDENTITY CASCADE")
        puts "Truncated table: #{table}"
      end
    end
    puts "All tables truncated (except #{excluded_tables.join(', ')}) and primary keys reset!"
  end
end
