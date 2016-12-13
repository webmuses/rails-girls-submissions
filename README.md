# RailsGirls

 RailsGirls application is designed to receive and rate submissions for RailsGirls workshops.

## Local setup

     git clone git@github.com:webmuses/rails-girls-submissions.git
     cd rails-girls-submissions
     gem install bundler
     bundle
     cp config/secrets.yml.example config/secrets.yml
     cp config/allowed_users.yml.example config/allowed_users.yml
     bundle exec rake db:setup
     rails s

## Servers and deployment

 * CI: https://circleci.com/gh/LunarLogic/rails-girls-submissions

#### Public Demo

 * git branch: `master`
 * site url: https://railsgirls.lunarlogic.io/admin

 __Deployment happens automatically after each successful CI build.__

## Testing

 RSpec: ```bundle exec rspec spec```
