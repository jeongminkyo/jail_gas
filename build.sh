#!/bin/sh

echo "##########################################"
echo "\n"

if [ -d "./public/assets" ] 
then
    echo "Directory /public/assets exists." 

else
    echo "Directory /public/assets exists." 
    echo "start bundle exec rake asserts:precompile"
	bundle exec rake assets:precompile RAILS_ENV=production
fi

echo "##########################################"
echo "\n"

echo "jailgas rails docker build start"
docker build -f docker/app/Dockerfile . -t redwonder/jailgas-rails

echo "jailgas rails docker push"
docker push redwonder/jailgas-rails

echo "jailgas nginx docker build start"
docker build -f docker/web/Dockerfile . -t redwonder/jailgas-nginx

echo "jailgas nginx docker push"
docker push redwonder/jailgas-nginx
