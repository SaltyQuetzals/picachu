FROM ruby:2.6.0
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs postgresql-client
# https://github.com/sass/sassc-ruby/issues/146#issuecomment-542288556
ENV BUNDLE_BUILD__SASSC=--disable-march-tune-native
RUN mkdir /picachu
WORKDIR /picachu
COPY Gemfile /picachu/Gemfile
COPY Gemfile.lock /picachu/Gemfile.lock
COPY package.json yarn.lock ./
RUN npm install --global yarn
RUN yarn install --check-files
RUN bundle install --jobs 20
COPY . /picachu

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
RUN bundle config --local build.sassc --disable-march-tune-native
ENTRYPOINT ["entrypoint.sh"]

# Precompile assets
RUN bundle exec rake assets:precompile

# Start the main process.
CMD bin/rails server -b 0.0.0.0 -p $PORT
