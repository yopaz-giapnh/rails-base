# Curapis

[![CircleCI](https://circleci.com/gh/provas/curapis.svg?style=shield&circle-token=8052996d9b550e2bae86efde4222798e38aa963b)](https://circleci.com/gh/provas/curapis)

## Requirements
- docker (~> 17.0)
- docker-compose (~> 1.17)

## Setup
### Install docker
```
$ curl -sSL https://get.docker.com/ | sh
$ doceker version
```

### Install docker-compose
```
$ VERSION_NUM=1.17.1
$ curl -L https://github.com/docker/compose/releases/download/VERSION_NUM/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$ chmod +x /usr/local/bin/docker-compose
$ docker-compose version
```

### Set environmental values
```
$ cp .env.example .env
```

### Run app
```
$ docker-compose run --rm app bin/setup
$ docker-compose up
```

## Development
### Run linter
```
$ docker-compose run app rubocop
```

### Export er diagrams
```
$ docker-compose run app bundle exec erd
```

### Create release pr
```
$ docker-compose run app git-pr-release
```