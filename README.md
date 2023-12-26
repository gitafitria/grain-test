# README

## Friday, Dec 22, 2023 (1 hours)

### TL; TR;

> I read the requirements, asking for clarifications and confirmations, understand the Graphql + Rails, and setting up the projects with Gems and required configuration.

- First thing first, read the requirements and understand the requirements before we code deeper. Clarify the requirements before hand. Here are the confussion I have:
    1. Menu

        a. Menu consists of one or more Sections using MenuSection​. Does it mean if 1 Menu has Classic Pizzas section, this Classic Pizzas section could be used by another Menu? Or is it possible to have duplicate Section label but different identifier?

        b. One of the columns is state, what the values will be? Could it be like enum for this menu is available or not?
    2. Item, one of the columns is type: string, what the values will be?
    3. Label validation in general, do we need to make it unique?
    4. For identifier, I believe this should be without white space, probably put -​ or _​ as word separation, is that correct?
    5. Modifier, one of the columns is price_override, is this column allowed to leave it blank?
    6. In the Task #3, the next step is to deploy the project, do you have any criteria where should we deploy the project? Heroku probably? Do we need to have user authentication on the project?

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

## Saturday, Dec 23, 2023 (30 minutes)

### TL; TR;

> Got answer from Ernest for the previous questions, read it and let it sink in. Then clarify another confusion.

- Answer from the previous questions (Dec 22, 2023)

    1. Menu

        a. Yes it can be reused! It’s also possible to have a duplicate section label with different identifier.

        b. The state would be published or draft

    2. Right now it’s a single table inheritance type of either Product or Component
    3. Not necessary for labels to be unique
    4. Snake or kebab case are fine and accepted
    5. Yes a nil or blank means it will take the modifier items original price
    6. No need for authentication, no preference for deployment, can just pick any free one out there!

- Another questions asked:

    1. Is there any different treatment/flow between Item as a Product and Item as Component? Is this related to the Task #4 which said “The dummy data should include a menu with 2 sections, the first containing Items that are not configurable, and the second containing items that are configurable”?
    2. In the Modifier, there is default_quantity column, is the default_quantity value a range between selection_required_min and selection_required_max from ModifierGroup?
    3. In the Menu, what would happen if the end_date value more than current date? Is it allowed to have end_date before current date?
    4. Some of the tables has display_order column, is it okay to have duplicate order value especially in Section, because Section could be reused for another Menu? Why Section need to have its own display_order?

## Sunday, Dec 24, 2023 (30 minutes)

### TL; TR;

> Got answer from Ernest for the previous questions, read it and let it sink in. Then clarify another confusion.

- Answer from the previous questions (Dec 24, 2023)

    1. For now there’s no real difference between the two except that components can only be linked to products and cannot exist on the menu standalone.
    2. Default quantity is the default selected modifier quantity of a modifier group, it’s not dependent on the min and max of the modifier groups. Eg. A modifier group called “Size” can have two modifiers, “Small” and “Large”, in this example small can have a default quantity of 1 so it’s selected by default.
    3. End date can be any date that is after start date, if end date is before current date, it will not load on the front end and will be considered an old menu.
    4. Display order is to determine which section appears first. So if I have a menu with sections, the menu section table will determine the order of the sections via display_order.

- Another questions asked:

    1. “Item as components can only be linked to products”

        a. So I need to have “product” as reference in the Item table to specify which Item components is linked to which item product, is that correct?

    2. “The dummy data should include a menu with 2 sections, the first containing Items that are not configurable, and the second containing items that are configurable (any number of modifier groups and modifiers)”

        a. In this context, configurable item here is item that user can interact with the interactive modifier for example size (small, medium, big) or toppings (bacon, cheese) meanwhile not configurable is item that does not have any modifier for example like Small French fries per se, is that correct?

## Monday, Dec 25, 2023 (1 hour)

> Got answer from Ernest for the previous questions, read it and let it sink in. Tried to understand all the context and verified it with ChatGPT. Creating summary of it.

- Answer from the previous questions (Dec 25, 2023)

    1. Hmm, nope, what I meant is that the Items table is a Single Table Inheritance with 2 types, Product and Component. Products can have modifier groups, which will have modifiers which can point to either another Product or a Component.
    2. Yes correct, for the purpose of this exercise a non-configurable item should not have any modifier groups.

- In this moment <b>I realized that I didn't fully understand the STI</b>, so I tried to chit chat with GPT instead. Here's the conversation went with GPT: https://chat.openai.com/share/4ec5f31a-8357-49fa-9c5e-1d50be1d303a

- <b>Summary:</b>

    - Menu table
        - Value of `state` column would be <b>published</b> or <b>draft</b>
        - End date can be any date that is after start date, if end date is before current date, it will not load on the front end and will be considered an old menu.

    - Item table
        - it’s a single table inheritance type of either <b>Product</b> or <b>Component</b>
        - For now there’s no real difference between the two except that components can only be linked to products and cannot exist on the menu standalone.
        - Products can have modifier groups, which will have modifiers which can point to either another Product or a Component.

    - Section table
        - It can be reused. It’s also possible to have a duplicate section label with different identifier
        - Display order is to determine which section appears first. So if I have a menu with sections, the menu section table will determine the order of the sections via display_order.
            - <b>?</b> Question that leave hanging:

                    In MenuSection table also have a display_order column, let's say we have 2 record in Section table

                        - identifer sectionABC & display_order 1.
                        - identifer sectionDEF & display_order 1.

                    Then we use those 2 sections in the same menu, how the order would be? do we overwrite the display_order in the MenuSection manually?

    - Modifier table
        - price_override columns could have value a nil or blank means it will take the modifier items original price
        - Default quantity is the default selected modifier quantity of a modifier group, it’s not dependent on the min and max of the modifier groups.
            - Eg. A modifier group called “Size” can have two modifiers, “Small” and “Large”, in this example small can have a default quantity of 1 so it’s selected by default.
                - <b>?</b> Question that leave hanging:

                        Modifier table don't have any column that can state the option label, for example "Small" or "Large". How can user understand what option that they select if no descriptive option label?

    - Validation
        - Identifier column
            - it would have value with Snake or kebab case
            - always unique even the label could be duplicate

        - Label column
            - Not necessary to be unique

    - Dummy data
        - “The dummy data should include a menu with 2 sections, the first containing Items that are not configurable, and the second containing items that are configurable (any number of modifier groups and modifiers)”

            In this context, configurable item here is item that user can interact with the interactive modifier for example size (small, medium, big) or toppings (bacon, cheese) meanwhile not configurable is item that does not have any modifier for example like Small French fries per se.

            > For the purpose of this exercise a non-configurable item should not have any modifier groups.

    - Deployment
        - No need for authentication, no preference for deployment, can just pick any free one out there!

## Tuesday, Dec 26, 2023 (15 minutes)

- Create migration scripts for all tables, make sure create the migration from the base table to tables with references, so the migrate will success.