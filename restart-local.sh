#!/bin/bash
docker-compose down
if [ -d "./web/ruslan-app/dist" ]
then 
    echo "Building the Angular 7 app..."
    cd ./web/ruslan-app 
    ng build --prod
    cd ..
    cd ..
fi

docker-compose -f docker-compose-local.yml build
docker-compose -f docker-compose-local.yml up 