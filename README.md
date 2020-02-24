Instructions for setting up a dev rails container for pokill
============================================================
1. git clone this repo
2. cd to the repo folder
3. rm pokill/.gitkeep && git clone https://github.com/315tky/pokill.git pokill/
4. cd pokill && yarn install --check-files # is this correct or needs to be done in container build ?

5. ./docker-build # to build the container

6. populate the env file, and mv env .env
7. ./docker-run  # to run the container

Container should start and rails app will be accessible from http://localhost:3000
( Note: maybe a short delay when first accessing the site due to webpacker compiling )

Develop code and commit to github as per normal from \<repo folder\>/pokill/ 
