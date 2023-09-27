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
    puts "\n<Data: #{data}>\n\n"

    puts "\n<Ontology Result Data>\n"
    puts "Ontology Title: #{data['config']['title']}"
    puts "Ontology Description: #{data['config']['description']}"
    puts "Number of Terms: #{data['numberOfTerms']}"
    puts "Current Status: #{data['status']}"
    puts "\n"
  end
end

if ARGV.empty?
  puts 'Usage: ruby ontology_lookup.rb <ontology_id>'
  exit 1
end

# puts ARGV
# puts ENV['ONTOLGY_API_BASE_URL']

ontology_id = ARGV[0]
ontology_lookup = OntologyLookup.new(ontology_id)
ontology_lookup.fetch_ontology_details
