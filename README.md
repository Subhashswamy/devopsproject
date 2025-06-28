# docker-testapp

run the all three docker in the same network or create compose file and create together

use mongo image and mongo-express image

create a common network if not using compose file 
docker network create (networkname)

mongo : docker run -d -p 27017:27017 --name mongo --network mongo-network -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=qwerty mongo

mongo : docker run -d -p 8081:8081 --name mongo-express --network mongo-network -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=qwerty -e ME_CONFIG_MONGODB_URL="mongodb://admin:qwerty@mongo:27017/" mongo-express

in the above url mongo is the image name used in code so using as mongo:27017 if want to use another name change it in code as well (if want to run in local change the mongo to localhost)

to run the app 

docker build -t testapp .
docker run -d -p 5050:5050 --name testapp --network mongo-network testapp 

well done now verify the data in the specific port post the data and try to retrive it via mongo express
