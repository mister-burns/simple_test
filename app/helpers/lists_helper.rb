module ListsHelper

  def get_data
  	$usaGovURI = "http://api.usa.gov/jobs/search.json?query=nursing+jobs"
    response = Net::HTTP.get_response(URI.parse($usaGovURI))
    data = response.body
    hash = JSON.parse(data)

    hash.each do |h|
		list = List.new
		list.govt_id = h["id"]
		list.position_title = h["position_title"]
		list.organization_name = h["organization_name"]
		list.rate_interval_code = h["rate_interval_code"]
		list.minimum = h["minimum"].to_i
		list.maximum = h["maximum"].to_i
		list.start_date = h["start_date"]
		list.end_date = h["end_date"]
		list.locations = h["locations"].first
		list.url = h["url"]
		list.save
     end
  end
end
