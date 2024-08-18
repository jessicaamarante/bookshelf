#! /bin/sh

bundle exec rails db:migrate

if [[ $? -ne 0 ]] ; then
  echo -e "\n== Failed to migrate. Running setup first. ==\n"
  bundle exec rails db:reset
fi

exec "$@"