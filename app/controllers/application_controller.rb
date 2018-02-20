class ApplicationController < Sinatra::Base

  configure do
  	set :views, "app/views"
  	set :public_dir, "public"
  end

  get "/" do
  	erb :index
  end

  get "/artworks" do
    refresh_db
    erb :artworks
  end

  def refresh_db
    mta_art_catalogue_url = "https://data.ny.gov/resource/qius-v36q.json"
    arts_for_transit = JSON.parse(RestClient.get(mta_art_catalogue_url))

    Artwork.delete_all

    arts_for_transit.each do |entry|
      artist = Artist.find_or_create_by(
        :first_name => entry["artist_first_name"],
        :last_name => entry["artist_last_name"]
      )
      artist.artworks << Artwork.find_or_create_by(
        :title => entry["art_title"],
        :url => entry["art_image_link"]
      )
    end
  end

end
