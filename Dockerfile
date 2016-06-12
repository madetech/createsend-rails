FROM madetech/rails-deps

RUN mkdir -p /app
WORKDIR /app
COPY lib/create_send_rails/version.rb ./lib/create_send_rails/version.rb
COPY Gemfile ./
COPY create_send_rails.gemspec ./
RUN bundle install --jobs 20 --retry 5
CMD ["bundle", "exec", "rake", "-T"]