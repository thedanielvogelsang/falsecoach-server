# FalseCoach

False Coach is a fictional tool that provides client workout management to a
single gym/trainer and their clients.

The UI (nonexistent in reality) UI provides Trainers the ability to add clients
and create workouts for those clients.  Clients can then update the results
of the workouts they've been assigned via their own application for the
trainer's review.

This repo provides the API layer which powers the application.

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
