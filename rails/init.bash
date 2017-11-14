cd /myapp
bundle exec ./init/delayed_job start # deloayed jobを起動するスクリプト
bundle exec puma -C ./init/puma.rb # pumaを起動するスクリプト
