require 'net/http'
require 'json'
require 'dotenv/load'

class OntologyLookup
  API_BASE_URL = ENV['ONTOLGY_API_BASE_URL']

  def initialize(ontology_id)
    @ontology_id = ontology_id
  end

  def fetch_ontology_details
    response = fetch_data
    if response.code == '200'
      ontology_data = JSON.parse(response.body)
      display_ontology_details(ontology_data)
    else
      puts "Error: Unable to fetch ontology details. HTTP Status Code: #{response.code}"
    end
  end

  private

  def fetch_data
    uri = URI("#{API_BASE_URL}#{@ontology_id}")
    Net::HTTP.get_response(uri)
  end

  def display_ontology_details(data)
    puts "\n<Ontology Result Data>\n"
    puts "Ontology Title: #{data['config']['title'] || 'N/A'}"
    puts "Ontology Description: #{data['config']['description'] || 'N/A'}"
    puts "Number of Terms: #{data['numberOfTerms'] || 'N/A'}"
    puts "Current Status: #{data['status'] || 'N/A'}"
    puts "\n"
  end
end
