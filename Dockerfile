FROM ruby:2.4.0
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
apt-get install nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Install npm modules
RUN npm install -g yarn
COPY package.json /myapp/package.json
COPY yarn.lock /myapp/yarn.lock
RUN yarn

COPY . /myapp

CMD bundle exec puma -C config/puma.rb
