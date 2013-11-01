class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :govt_id
      t.string :position
      t.datetime :start_date

      t.timestamps
    end
  end
end
