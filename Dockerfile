FROM ruby:2.6.0
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs postgresql-client
RUN mkdir /picachu
WORKDIR /picachu
COPY Gemfile /picachu/Gemfile
COPY Gemfile.lock /picachu/Gemfile.lock
COPY package.json yarn.lock ./
RUN npm install --global yarn
RUN yarn install --check-files
RUN bundle install --jobs 20 --without development test
COPY . /picachu

ENV RAILS_ENV production
ENV RACK_ENV production

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Precompile assets
#RUN bundle exec rake assets:precompile

# Start the main process.
CMD bundle exec puma -C config/puma.rb
