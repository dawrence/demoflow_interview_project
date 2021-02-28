# Demoflow Interview Project
Thanks for taking the time to work through this project! The goal here is to develop a few small features to demonstrate your experience with Rails and/or React. 
This sample project is a [Ruby on Rails](http://rubyonrails.org/) / [React](https://facebook.github.io/react/) / [Webpack 4](https://webpack.js.org/) boilerplate app.

The frontend assets on this repository are placed on a more accessible directory, at `front/js` and `front/css`, rather than `app/assets/javascripts` and `app/assets/stylesheets`.  

## Install

### Docker (recommended for quick setup)

Repository contains a basic Dockerfile for running the app in production mode.  
Assets should be compiled first using webpack outside of the container.

```sh
# build docker image
docker build -t demoflow_interview_project .

# run docker image
docker run -p 3000:3000 -e SECRET_KEY_BASE=abcd demoflow_interview_project
```

### Install Directly
It's recommended to use Ruby 2.7.1 and NodeJS 12.x.

```sh
# install bundler if not available
gem install bundler

# install gem dependencies
bundle install

# install npm dependencies
npm install

# create the postgres databases
# update config/database.yml details if needed
rake db:create

# generate assets for development
npm run webpack

# start server
rails s
```

## Webpack scripts

`npm run webpack`  
Builds the assets for development mode.

`npm run webpack:watch`  
Builds the assets for development mode, and rebuilds on every detected change.

`npm run webpack:production`  
Builds the assets for production mode, output files are hashed.

# Rails project

