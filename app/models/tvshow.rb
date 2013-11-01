class Tvshow < ActiveRecord::Base

	def long_title
		"#{netflix_rating} - #{imdb_rating}"
	end

	def average_rating
		"#{((netflix_rating * 2) + imdb_rating)/2}"
	end

end
