class ShowList < ActiveRecord::Base
	validates :wiki_page_id, uniqueness: true
end
