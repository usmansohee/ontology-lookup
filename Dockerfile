# Same version as DataHub
FROM ruby:3.1.4

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install Bundler to manage gems (optional)
RUN gem install bundler

# Install the gems
RUN bundle install

# Copy all code into the container
COPY . .

# Entrypoints to run ruby script
ENTRYPOINT ["ruby", "start_ontology_lookup.rb"]
