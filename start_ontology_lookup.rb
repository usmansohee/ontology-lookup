require_relative './ontology_services/ontology_lookup'

if ARGV.empty?
  puts 'Usage: docker run -it ontology-lookup <ontology_id>'
  exit 1
end

ontology_id = ARGV[0]
ontology_lookup = OntologyLookup.new(ontology_id)
ontology_lookup.fetch_ontology_details
