web: bundle exec rails server -b $PORT
worker: bundle exec sidekiq -q default -q mailers -t 25 -c 1