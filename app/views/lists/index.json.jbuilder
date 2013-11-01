json.array!(@lists) do |list|
  json.extract! list, :govt_id, :position, :start_date, :end_date, :position_title, :organization_name, :rate_interval_code, :minimum, :maximum, :locations, :url
  json.url list_url(list, format: :json)
end
