class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :govt_id
      t.string :position
      t.datetime :start_date
      t.datetime :end_date
      t.string :position_title
      t.string :organization_name
      t.string :rate_interval_code
      t.integer :minimum
      t.integer :maximum
      t.string :locations
      t.string :url

      t.timestamps
    end
  end
end
