FROM ruby:3.2.2

RUN bundle config --global frozen 1

WORKDIR /app

RUN gem install bundler

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# RUN bundle lock --add-platform ruby
RUN bundle lock --add-platform aarch64-linux
RUN bundle install

COPY . .

# アプリケーションを実行します。適切なコマンドを設定してください。
CMD ["ruby", "app.rb"]