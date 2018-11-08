# FalseCoach

## Dev Env

**With Docker-Compose**

Use docker-compose for easy dev env setup.  This will run the DB and server
in separate containers with appropriate versions of everything.

0. `alias dc=docker-compose`
0. `dc build server`
0. `dc run server db:setup`
0. `dc up`

**Directly**

This is a pretty standard rails app so if you've got Postgres going locally already it
sould be pretty easy to get this going.  Use `DB_URL` environment var to specify
connection params to your Postgres DB.
