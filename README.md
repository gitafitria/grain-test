# README

## Friday, Dec 22, 2023 (1 hours)

### TL; TR;

> I read the requirements, asking for clarifications and confirmations, understand the Graphql + Rails, and setting up the projects with Gems and required configuration.

- First thing first, read the requirements and understand the requirements before we code deeper. Clarify the requirements before hand. Here are the confussion I have:
    - Menu
        - Menu consists of one or more Sections using MenuSection​. Does it mean if 1 Menu has Classic Pizzas section, this Classic Pizzas section could be used by another Menu? Or is it possible to have duplicate Section label but different identifier?
        - One of the columns is state, what the values will be? Could it be like enum for this menu is available or not?
    - Item, one of the columns is type: string, what the values will be?
    - Label validation in general, do we need to make it unique?
    - For identifier, I believe this should be without white space, probably put -​ or _​ as word separation, is that correct?
    - Modifier, one of the columns is price_override, is this column allowed to leave it blank?
    - In the Task #3, the next step is to deploy the project, do you have any criteria where should we deploy the project? Heroku probably? Do we need to have user authentication on the project?

- Understand about Graphql and its integration with Rails by reading this doc https://shakuro.com/blog/building-apis-with-graphql-and-ruby-on-rails and also ChatGPT with this keyword: "graphql with rails integration", ChatGPT will list the steps as well.

- While waiting for the clarifications and confirmations from the confussions above, I started by continuing the Tasks that can be done without blocker.
    - Making sure I install the Ruby, Gem, Rails, and Postgres.
    - Setting up a Ruby on Rails project by using this command:

        ```$ rails new grain-test -d postgresql -c esbuild```
    - Init git config and push it to Github https://github.com/gitafitria/grain-test
    - Add several gems, such as:
        - graphql
        - graphiql-rails
        - dotenv-rails
    - Bundle the gems and install dependencies
    - Configure the env for database.yml
    - Setting up all the dependencies and create and db by using this command

        ```$ bin/setup```
    - Run the project to make sure eveything runs well by running this command `$ rails s`
        ![Graphql page](https://github.com/gitafitria/grain-test/blob/main/public/readme-assets/Screenshot%202023-12-22%20at%2019.23.19.png)



