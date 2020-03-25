![Test Rails Application](https://github.com/SaltyQuetzals/picachu/workflows/Test%20Rails%20Application/badge.svg)
![Lint Rails Code](https://github.com/SaltyQuetzals/picachu/workflows/Lint%20Rails%20Code/badge.svg)
# Picachu

## Development
Developing for Picachu is a cinch!

### Environment Setup
Prerequisites:
- [Docker](https://docs.docker.com/install/)
    - [For Windows](https://docs.docker.com/docker-for-windows/install/)
    - [For Mac](https://docs.docker.com/docker-for-mac/install/)
    - [For Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [Docker Compose](https://docs.docker.com/compose/install/#install-compose)

To set up your environment, run the following commands:
```shell script
docker-compose up -d
docker-compose exec web rake db:setup
```

To start the server, all you need is one command:
```shell script
docker-compose up -d
```

This will create a PostgreSQL database and package the Rails server code into a container called `web`, accessible at `http://localhost:3000`.

When you're done running the server, just do

```shell script
docker-compose down
```

### Testing

To run tests, simply run

```shell script
docker-compose exec web rake rspec cucumber
```

This will run RSpec tests and Cucumber tests.
 
#### Seeing Code Coverage

##### Locally
After running `docker-compose exec web rake rspec cucumber`, you can find the code coverage on your local machine for RSpec at `coverage/rspec/index.html`, and code coverage for Cucumber at `coverage/cucumber/index.html`.
Open either of these files in your browser and you will see code coverage.

##### On GitHub

You can also find code coverage for `master` in our continuous integration pipeline.
To do so, simply do the following:

1. [View the test runs of the `master` branch on GitHub Actions](https://github.com/SaltyQuetzals/picachu/actions?query=branch%3Amaster+workflow%3A%22Test+Rails+Application%22)
2. Select the latest one (the first result).
3. From the left, choose which test suite you'd like to view (`rspec-tests` or `cucumber-tests`)
4. Expand the `Test` step (in the black box), and look for the coverage table.

### Deployment

All pushes to the `master` branch are automatically deployed to Heroku.
No need for manual deployment steps that might fail at the deadline!
For more details, you can look at [this GitHub Action file](https://github.com/SaltyQuetzals/picachu/blob/master/.github/workflows/deploy.yml) that performs the automated deployment using Docker containers.
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
Code will not be reviewed until it passes all checks.
Once code passes all checks, other developers will review your code and leave feedback on the changes you've made.
They can also ask questions for clarification on how a certain piece of code works.
When a reviewer believes your code can be merged into the `master` branch, they can approve your Pull Request and you can merge it in.
