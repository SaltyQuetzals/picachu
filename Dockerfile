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
RUN bundle install --jobs 20
COPY . /picachu

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Start the main process.
CMD rails server -b 0.0.0.0:$PORT
