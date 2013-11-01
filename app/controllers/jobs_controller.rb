class JobsController < ApplicationController

require 'rubygems'
require 'json'
require 'net/http'
require 'HTTParty'

  respond_to :json
  # Seems like you need to have the $ sign in front of variable for JSON variable. Not sure why.
  $usaGovURI = "http://api.usa.gov/jobs/search.json?query=nursing+jobs"
  $dog = "http://api.usa.gov/jobs/search.json?query=programming+jobs"
 
  def getJobs
    response = Net::HTTP.get_response(URI.parse($usaGovURI))
    data = response.body
    JSON.parse(data)
 
    render :text => JSON.parse(data)
  end

  def getJobs2
    response = Net::HTTP.get_response(URI.parse($dog))
    data = response.body
    @scooter = response
    @hello = response.body
    @data = JSON.parse(data)
 
    #render :text => JSON.parse(data)
 
  end

  def index
  	response = Net::HTTP.get_response(URI.parse($usaGovURI))
    data = response.body
    @hash = JSON.parse(data)
    @hash2 = @hash.dup #This code creates a duplicate of the has for testing.

    @dog = 34

  end

  def modeltest
    response = Net::HTTP.get_response(URI.parse($usaGovURI))
    data = response.body
    @hash = JSON.parse(data)

  end

  def modeltable
    @jobs = Job.all
  end

  def sopranos

  	query2 = " 
		PREFIX dbo: <http://dbpedia.org/ontology/> 
		PREFIX prop: <http://dbpedia.org/property/> 
		PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
		PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

		SELECT *
		WHERE {
      ?e <http://dbpedia.org/ontology/series> <http://dbpedia.org/resource/The_Sopranos>.
      ?e <http://dbpedia.org/ontology/releaseDate> ?date.
      ?e <http://dbpedia.org/ontology/episodeNumber> ?number.
      ?e <http://dbpedia.org/ontology/seasonNumber> ?season
    	}
	ORDER BY DESC(?date)"

	@dbpediaURI = "http://dbpedia.org/sparql?query=#{CGI::escape(query2)}&format=json"
	@chicken = query2
	@pasta = "http://dbpedia.org/sparql?query=#{(query2)}&format=json"
	$dbpediaURI = "http://dbpedia.org/sparql?query=#{CGI::escape(query2)}&format=json"

	  response = Net::HTTP.get_response(URI.parse($dbpediaURI))
    data = response.body
    data2 = JSON.parse(data)
    @results = data2
    

  end

  def showlist

    query2 = " 
    PREFIX dbpprop: <http://dbpedia.org/property/>
 
    Select *
    WHERE {
     
    ?subject rdf:type <http://dbpedia.org/ontology/TelevisionShow>.
    ?subject rdfs:label ?label.
    ?subject dbpedia-owl:numberOfEpisodes  ?numberOfEpisodes.
    ?subject dbpedia-owl:numberOfSeasons  ?numberOfSeasons.
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
    LIMIT 1000"

    @dbpediaURI = "http://dbpedia.org/sparql?query=#{CGI::escape(query2)}&format=json"
    @chicken = query2
    @pasta = "http://dbpedia.org/sparql?query=#{(query2)}&format=json"
    $dbpediaURI = "http://dbpedia.org/sparql?query=#{CGI::escape(query2)}&format=json"

    response = Net::HTTP.get_response(URI.parse($dbpediaURI))
    data = response.body
    @results = JSON.parse(data)
 
    #render :text => JSON.parse(data)

  end

def showlist2

    query2 = " 
    PREFIX dbpprop: <http://dbpedia.org/property/>
 
    Select *
    WHERE {
     
    ?subject rdf:type <http://dbpedia.org/ontology/TelevisionShow>.
    ?subject rdfs:label ?label.
    ?subject dbpedia-owl:numberOfEpisodes  ?numberOfEpisodes.
    ?subject dbpedia-owl:numberOfSeasons  ?numberOfSeasons.
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
    LIMIT 1000"

    $dbpediaURI = "http://dbpedia.org/sparql?query=#{CGI::escape(query2)}&format=json"

    response = Net::HTTP.get_response(URI.parse($dbpediaURI))
    data = response.body
    @results = JSON.parse(data)
 

  end

def showlist3

    query = " 
    PREFIX dbpprop: <http://dbpedia.org/property/>
 
    Select *
    WHERE {
     
    ?subject rdf:type <http://dbpedia.org/ontology/TelevisionShow>.
    ?subject rdfs:label ?label.
    ?subject dbpedia-owl:numberOfEpisodes  ?numberOfEpisodes.
    ?subject dbpedia-owl:numberOfSeasons  ?numberOfSeasons.
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
    LIMIT 1000"

    $dbpediaURI = "http://dbpedia.org/sparql?query=#{CGI::escape(query)}&format=json"

    response = Net::HTTP.get_response(URI.parse($dbpediaURI))
    data = response.body
    hash = JSON.parse(data)
    @hash2 = hash["results"]["bindings"]

  end

end
