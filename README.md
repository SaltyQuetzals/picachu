# README

## Development
Developing for Picachu is a cinch!

### Environment Setup
Prerequisites:
- [Docker](https://docs.docker.com/install/)
    - [For Windows](https://docs.docker.com/docker-for-windows/install/)
    - [For Mac](https://docs.docker.com/docker-for-mac/install/)
    - [For Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [Docker Compose](https://docs.docker.com/compose/install/#install-compose)

To get your environment set up, all you need is one command:
```shell script
docker-compose up
```

This will create a PostgreSQL database and package the Rails server code into a container called `web`, accessible at `http://localhost:3000`.

When you're done running the server, just do

```shell script
docker-compose down
```

#### Rails Commands
All of the commands that you run with Rails ordinarily are runnable with Docker Compose too!

```shell script
# To prepare the database for interaction
docker-compose run web rake db:prepare

# To migrate the database
docker-compose run web rake db:migrate

# To run tests
docker-compose run web rake test
```

### Branching
The master branch is protected, meaning that pushing directly to it is not possible.
New changes should be made on a personal, story-driven branch.
To receive the benefits of PivotalTracker's GitHub integration, you should name your branches according to the following naming scheme:

```
<PIVOTALTRACKER_STORY_ID>-<DESCRIPTIVE_NAME>
```

### Pull Requests
When you feel like your code is ready for review, go ahead and create a [Pull Request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests).
Pull requests help other developers see the changes you've made on your own branch, and allow them to review your code, in order to understand it.
When you create a pull request, automatic checks are performed upon your branch to evaluate different things like:
- Ensuring that the Ruby best-practices are being followed
- Ensuring that all the current tests pass.
Code will not be reviewed until it passes both checks.
Once code passes both checks, other developers will review your code and leave feedback on the changes you've made.
They can also ask questions for clarification on how a certain piece of code works.
When a reviewer believes your code can be merged into the master branch, they can approve your Pull Request and you can merge it in.
