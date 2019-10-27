![GitHub last commit](https://img.shields.io/github/last-commit/mattycourtney/api-client)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/mattycourtney/api-client)
![GitHub repo size](https://img.shields.io/github/repo-size/mattycourtney/api-client)
![Code Climate maintainability](https://img.shields.io/codeclimate/maintainability/mattycourtney/api-client?label=code%20quality)
![GitHub issues](https://img.shields.io/github/issues-raw/mattycourtney/api-client)
![GitHub](https://img.shields.io/github/license/mattycourtney/api-client)

# vForum 2019 - API Client

This project contains a small ruby script used as a demo at vForum 2019. It POSTs to the RESTful API exposed from the [Sinata Application](https://github.com/mattycourtney/sinatra-app).

## Running with Docker

The app is dockerizied to make deploying and running it easy.

Make sure the [Sinata Application](https://github.com/mattycourtney/sinatra-app) is running first.

    $ docker build -t api-client https://github.com/mattycourtney/api-client.git
    $ docker run --link sinatra-app --name api-client -t api-client

When you've finished with the app, just stop the container.

    $ docker stop api-client
