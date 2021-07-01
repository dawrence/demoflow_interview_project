# Demoflow Interview Project
Thanks for taking the time to work through this project! The goal here is to develop a few small features to demonstrate your experience with Rails and/or React. 

## Goals
Our goal is NOT to have you spend hours upon hours on a project. We will simply use this project as a basis to have deeper discussions about how you think about architecture, resiliency, and maintainability. Ideally, this should take about 2 hours, but please definitely do not spend more than 3-4 hours on it. We'll be happy to talk through what you would have done if you had more time. 
In an effort to keep this work relevant to Demoflow, your challenge is to build a system that can... run demos! 

## Challenge
In today's remote selling environment, buyers are increasingly bored of sitting through a huge "master sales deck". One advantage of Demoflow is that presenters can quickly add or remove content in their presentation based on what their audience wants to see. Your task is to create a basic presentation architecture that can be changed on the fly.

Assumptions: 
 * A `Demo` is an instance of a presentation given to a specific audience. 
 * A presenter `User` has a library of prepared `Decks`. 
 * Each `Deck` is a collection of one or more `Slides`. 
 * `Decks` can be added directly to a `Demo` either before or during a presentation. 
 
 ## Requirements: 
 We are looking for talented frontend, backend, and full-stack engineers. Therefore, you can adapt this challenge to whichever part of the stack you feel most confident on. 

 Whichever part of the stack you choose, the code should support the following workflows: 
  1. A `User` can create a new `Demo`.
  2. A `User` can add one or more `Decks` to a `Demo`. The `Demo` should then have reference to the underlying `Slides`.
  3. When adding a `Deck` to a `Demo`, the user can add it at any point in the presentation, e.g. at the beginning, end, or in-between existing `Slides`.
  4. When viewing a `Demo`, a `User` can navigate forward or backward in the presentation, and the position is saved (on the frontend, that could be in state, and on the backend it could be in the database).
 
 Bonus Points:
  * If I wanted to determine how much time was spent on each slide, how might you do that? 

Other considerations:
 * For frontend candidates, you can use either a mock API or just local variables with the given items. 
 * For backend candidates, you can develop either a REST or GraphQL API that supports the above workflows.
 * If you are a full-stack developer, we'd love to see an actual API wired up if you're up for it!
 
## How do I submit my response?
You can feel free to CLONE this repo, or start a brand new Rails/React project. Either way, please create a public git repository under your own GitHub account and send the link to `jack@demoflow.io`.
 
## Setup
This sample project is a [Ruby on Rails](http://rubyonrails.org/) / [React](https://facebook.github.io/react/) / [Webpack 4](https://webpack.js.org/) boilerplate app.
The frontend assets on this repository are placed on a more accessible directory, at `front/js` and `front/css`, rather than `app/assets/javascripts` and `app/assets/stylesheets`.
If you want to use this app as a framework to start, follow the instructions below. Creating one from scratch to your own personal specifications is fine too!

### Run it locally

```
bundle install
rails db:create
rails db:migrate
rails server

Load up http://localhost:3001
```

### Or, Run it in Docker

Repository contains a basic Dockerfile for running the app in production mode.  
Assets should be compiled first using webpack outside of the container (scroll down for the Webpack commands).

```sh
# build docker image
docker build -t demoflow_interview_project .

# run docker image
docker run -p 3001:3001 -e SECRET_KEY_BASE=abcd demoflow_interview_project
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


