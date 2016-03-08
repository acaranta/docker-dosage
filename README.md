Docker Dosage
=============
Builds a Docker Dosage from https://github.com/webcomics/dosage

You can use dosage as a Docker container.
* create on your host the storage directory ie :
```
mkdir -p /srv/dosage
```
* build your container :
```
docker build -t dosagedocker .
```
* then configure your dosage :
```
# List available comics :
docker run --rm -ti dosagedocker dosage -l

# add your comics
docker run --rm -ti -v /srv/dosage:/app/dosage dosagedocker dosage YourComic #add -a to download all of the comic pages
docker run --rm -ti -v /srv/dosage:/app/dosage dosagedocker dosage AnotherComic
```
* Once the initial setup is done simply run :
```
docker run -v /srv/dosage:/app/dosage dosagedocker
# This will tell dosage to get latest pages from all the comics you configured
# it will also do that endlessly (unless you destroy the container) every 7200seconds (2 hours)
# To change this 1 hour interval to 2 hours (aka 7200 seconds) :
docker run -v /srv/dosage:/app/dosage -e RUNEVERY=7200 dosagedocker
# If you want to add more options to the automated run :
docker run -e OPTIONS="--adult -v" -v /srv/dosage:/app/dosage dosagedocker
```
* Remeber you can still get help :
```
docker run --rm -ti dosagedocker dosage -h
```
