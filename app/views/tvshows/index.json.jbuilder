json.array!(@tvshows) do |tvshow|
  json.extract! tvshow, :netflix_rating, :imdb_rating
  json.url tvshow_url(tvshow, format: :json)
end
