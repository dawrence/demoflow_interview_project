# Demoflow Interview Project
Thanks for taking the time to work through this project! The goal here is to develop a few small features to demonstrate your experience with Rails and/or React. Our goal is NOT to have you spend hours upon hours on a project. We will simply use this project as a basis to have deeper discussions about how you think about architecture, resiliency, and maintainability. Ideally, this should take about 2 hours, but please definitely do not spend more than 3-4 hours on it. We'll be happy to talk through what you would have done if you had more time. 

## Challenge
In an effort to keep this work relevant to Demoflow, we want to challenge you with a real task that we're thinking about. 
In our app, `Demos` are built with several `Slides`. Those `Slides` can have different types: `image`, `web`, or `html`. A given `Demo` might have several different slides of each type. For example: 
 * Slide 1: `web`
 * Slide 2: `image`
 * Slide 3: `image`
 * Slide 4: `web`
 * Slide 5: `web`
 * Slide 6: `html`

When a `Demo` is started, that creates a `Presentation` object that encapsulates the given `start_time` and `end_time` of the demo. Therefore, one `Demo` has many `Presentations` - one for each time the Demo is started and stopped.

Your task is to develop the code to create these `Presentation` instances, and **report on how long each slide was active**. 
 
### Frontend Challenge
 * Given a set of 3 `Demos` with a collection of slides similar to the list above, create an index page that lists the `title` of each Demo. Each `Demo` row should have a single button -> "Start".
 * When "Start" is clicked, a presentation component should load. The presentation component should be a basic UI that lists the slides on the left and a main panel on the right, similar to the picture below. 
 * Within the presentation component, when a slide on the left list is clicked, it should show as selected and render the slide content in the main window. For the purposes of this challenge, the "slide content" can just print the type of slide, e.g. "Web", "Image", or "HTML".
 * Finally, add a "Stop" button somewhere on the presentation component. 
 * When the stop button is clicked, the UI should render (either via modal or otherwise) the amount of time that was spent on each slide in total. 

![Sample UI](sample_ui.png)

### Backend Challenge
Create either a REST or GraphQL API that support the following endpoints:
 * List all Demos
 * Start a Demo (i.e. Create a `Presentation`)
 * Update the active `Slide` that's being shown on a demo/presentation
 * Stop a Demo (i.e. Stop the `Presentation`)
 * GET a `Presentation`, where the payload of the `Presentation` object contains information about the total duration of time that was spent on each `Slide`. 

### Other considerations:
 * For frontend candidates, you can use either a mock API or just local variables with the given items. 
 * For backend candidates, you can develop either a REST or GraphQL API that supports the above workflows.
 * If you are a full-stack developer, you can choose to develop either side. Or, for bonus points, actually wire up the API to the client!
 
## How do I submit my response?
You can feel free to CLONE this repo, or start a brand new Rails/React project. Either way, please create a public git repository under your own GitHub account and send the link to `jack@demoflow.io`.
 
# Dev Setup
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


