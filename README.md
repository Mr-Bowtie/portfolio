# Running Locally
1. make sure `config/master.key` is created and set. secret can be found in Bitwarden vault
2. copy `.env.example` to `.env` and set the values accordingly
3. start docker compose with the one of the bin commands 
  - `start-dev`
  - `start-test`
  - both of these run the server on container startup
4. in a separate process, run `bin/exec bash` to attach a terminal to the running docker container

# Prod Env 
- RAILS_MASTER_KEY
- GMAIL_USERNAME # used for sending mail with google smtp servers
- GMAIL_PASSWORD # this is a unique app password
### for blog admin
- ADMIN_USERNAME 
- ADMIN_PASSWORD

# Deploying
- FLY_API_TOKEN should be set in the github repository settings

