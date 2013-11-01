class List < ActiveRecord::Base
	validates :govt_id, uniqueness: true
end
