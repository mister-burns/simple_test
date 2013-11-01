class CreateShowLists < ActiveRecord::Migration
  def change
    create_table :show_lists do |t|
      t.string :lable
      t.integer :number_of_episodes
      t.integer :number_of_seasons
      t.datetime :release_date
      t.integer :wiki_page_id
      t.integer :wiki_page_revision_id
      t.string :language
      t.string :country
      t.string :network
      t.string :format

      t.timestamps
    end
  end
end
