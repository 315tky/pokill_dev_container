Instructions for setting up a dev rails container for pokill
============================================================
1. git clone https://github.com/315tky/pokill_dev_container.git
2. cd pokill_dev_container
3. rm pokill/.gitkeep && git clone https://github.com/315tky/pokill.git pokill/
4. cp pokill/env .env 
5. edit .env providing values as necessary
6. cd pokill && yarn install --check-files 
7. docker-compose up # The first time this runs it will build the pokill-dev app container,
   and pull down pg and mysql images from docker hub, and initialize those databases.
8. docker exec -it \<pokill container name\> /bin/bash
9. bin/rake db:migrate # from inside pokill_dev container
10. Check localhost:3000 in local browser to check if rails app site working ok. 

11. Upon first install/deploy, need to run the "bin/rake eve_import:\*" tasks to populate,
    both pg and mysql databases. However, need to import the eve mysql SDE from fuzzworks site,
    first. See the fuzzworks script and mysql container oneliner note in the eve_mysql_data_import directory 

( Note: maybe a short delay when first accessing the site due to webpacker compiling )

Develop code and commit to github as per normal from pokill_dev_container/pokill/ pushing to :
https://github.com/315tky/pokill.git
