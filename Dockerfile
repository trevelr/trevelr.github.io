FROM ruby:3.2

# Install Jekyll and other dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs && \
    gem install bundler jekyll

# Set working directory
WORKDIR /site

# Install dependencies when container starts
COPY . /site
RUN bundle install

# Default Jekyll port is 4000
EXPOSE 4000
EXPOSE 35729

# Start the Jekyll server
CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0", "--livereload"]
