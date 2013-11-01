class AddColumnsToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :position_title, :string
    add_column :jobs, :organization_name, :string
    add_column :jobs, :rate_interval_code, :string
    add_column :jobs, :minimum, :integer
    add_column :jobs, :maximum, :integer
    add_column :jobs, :end_date, :datetime
    add_column :jobs, :locations, :string
    add_column :jobs, :url, :string
  end
end
