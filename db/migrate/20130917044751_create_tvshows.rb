class CreateTvshows < ActiveRecord::Migration
  def change
    create_table :tvshows do |t|
      t.float :netflix_rating
      t.float :imdb_rating

      t.timestamps
    end
  end
end
