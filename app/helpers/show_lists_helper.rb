module ShowListsHelper

	def get_data
  	
    query = " 
    PREFIX dbpprop: <http://dbpedia.org/property/>
 
    Select *
    WHERE {
     
    ?subject rdf:type <http://dbpedia.org/ontology/TelevisionShow>.
    ?subject rdfs:label ?label.
    ?subject dbpedia-owl:numberOfEpisodes ?numberOfEpisodes.
    ?subject dbpedia-owl:numberOfSeasons ?numberOfSeasons.
    OPTIONAL { ?subject dbpedia-owl:releaseDate ?releaseDate. }
    ?subject dbpedia-owl:wikiPageID ?wikiPageID.
    ?subject dbpedia-owl:wikiPageRevisionID ?wikiPageRevisionID.
    ?subject dbpprop:language ?language.
    FILTER (lang(?label) = 'en' && lang(?label) = 'en')
    FILTER regex(?language, 'English')
    OPTIONAL { ?subject dbpprop:country ?country. }
    OPTIONAL { ?subject dbpedia-owl:network ?network. }
    #?subject dbpedia-owl:format ?format.
    }
     
    ORDER BY DESC(?releaseDate)
    LIMIT 5000"

    $dbpediaURI = "http://dbpedia.org/sparql?query=#{CGI::escape(query)}&format=json"
    response = Net::HTTP.get_response(URI.parse($dbpediaURI))
    data = response.body
    hash = JSON.parse(data)
    hash2 = hash["results"]["bindings"]

    hash2.each do |h|
		show = ShowList.new
        show.wiki_page_id = h["wikiPageID"]["value"].to_i
        show.lable = h["label"]["value"]
        show.number_of_episodes = h["numberOfEpisodes"]["value"]
        show.number_of_seasons = h["numberOfSeasons"]["value"]
        show.release_date = h["releaseDate"]["value"].to_datetime
        show.wiki_page_revision_id = h["wikiPageRevisionID"]["value"]
        show.language = h["language"]["value"]
        #show.country = h["country"]["value"].class
        #show.network = h["network"]["value"].class
		show.save
     end
  end
end
