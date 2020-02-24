Instructions for setting up a dev rails container for pokill
============================================================
1. git clone https://github.com/315tky/pokill_dev_container.git
2. cd pokill_dev_container
3. rm pokill/.gitkeep && git clone https://github.com/315tky/pokill.git pokill/
4. cp pokill/env pokill/.env 
5. edit .env providing values as necessary
6. cd pokill && yarn install --check-files #<i> ( is this correct or needs to be done in container build ?)</i>
7. ./docker-build # to build the container
8. ./docker-run  # to run the container

Container should start and rails app will be accessible from http://localhost:3000
( Note: maybe a short delay when first accessing the site due to webpacker compiling )

Develop code and commit to github as per normal from pokill_dev_container/pokill/ 
