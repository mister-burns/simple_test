json.array!(@show_lists) do |show_list|
  json.extract! show_list, :lable, :number_of_episodes, :number_of_seasons, :release_date, :wiki_page_id, :wiki_page_revision_id, :language, :country, :network, :format
  json.url show_list_url(show_list, format: :json)
end
