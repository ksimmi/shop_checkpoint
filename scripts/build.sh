#!/bin/bash

set -e

echo "build started under user $(whoami)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

rbenv install 2.5.1 || true
rbenv local 2.5.1
gem install bundler -v 1.16.1
gem install rake
bundle

export RAILS_ENV=test
rake db:migrate
rake db:reset
rake db:seed
rails s -d
bundle exec cucumber --color