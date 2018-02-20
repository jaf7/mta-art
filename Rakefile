require_relative 'config/environment.rb'
require "sinatra/activerecord/rake"

namespace :db do

  desc "Migrate the db"
  task :migrate do
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.migrate("db/migrate/")
  end

  desc "drop and recreate the db"
  task :reset => [:drop, :migrate]

  desc "drop the db"
  task :drop do
    connection_details = YAML::load(File.open('config/database.yml'))
    File.delete(connection_details.fetch('database')) if File.exist?(connection_details.fetch('database'))
  end

end

desc('Loads up a console!')
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

# def refresh_db
#
#   mta_art_catalogue_url = "https://data.ny.gov/resource/qius-v36q.json"
#   arts_for_transit = JSON.parse(RestClient.get(mta_art_catalogue_url))
#
#   Artwork.delete_all
#
#     arts_for_transit.each do |entry|
#       artist = Artist.find_or_create_by(
#         :first_name => entry["artist_first_name"],
#         :last_name => entry["artist_last_name"]
#       )
#       binding.pry
#       artist.artworks << Artwork.find_or_create_by_title_and_url(
#         :title => entry["art_title"],
#         :url => entry["art_image_link"]
#       )
#     end
#
#   end
