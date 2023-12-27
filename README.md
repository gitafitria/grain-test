# README

## Friday, Dec 22, 2023 (1 hours)

### TL; TR;

> I read the requirements, asking for clarifications and confirmations, understand the Graphql + Rails, and setting up the projects with Gems and required configuration.

- First thing first, read the requirements and understand the requirements before we code deeper. Clarify the requirements before hand. Here are the confussion I have:

    | No 	| Question 	|
    |---	|---	|
    | 1 	| Menu 	|
    | 1.a 	| Menu consists of one or more Sections using MenuSection. Does it mean if 1 Menu has Classic Pizzas section, this Classic Pizzas section could be used by another Menu? Or is it possible to have duplicate Section label but different identifier 	|
    | 1.b 	| One of the columns is state, what the values will be? Could it be like enum for this menu is available or not? 	|
    | 2 	| Item, one of the columns is type: string, what the values will be? 	|
    | 3 	| Label validation in general, do we need to make it unique? 	|
    | 4 	| For identifier, I believe this should be without white space, probably put - or _ as word separation, is that correct? 	|
    | 5 	| Modifier, one of the columns is price_override, is this column allowed to leave it blank? 	|
    | 6 	| In the Task #3, the next step is to deploy the project, do you have any criteria where should we deploy the project? Heroku probably? Do we need to have user authentication on the project? 	|

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

- Answer from the Friday, Dec 22, 2023 questions (Replied on Dec 22, 2023)

    | No 	| Question 	| Answer 	|
    |---	|---	|---	|
    | 1 	| Menu 	|  	|
    | 1.a 	| Menu consists of one or more Sections using MenuSection. Does it mean if 1 Menu has Classic Pizzas section, this Classic Pizzas section could be used by another Menu? Or is it possible to have duplicate Section label but different identifier 	| Yes it can be reused! It’s also possible to have a duplicate section label with different identifier. 	|
    | 1.b 	| One of the columns is state, what the values will be? Could it be like enum for this menu is available or not? 	| The state would be published or draft 	|
    | 2 	| Item, one of the columns is type: string, what the values will be? 	| Right now it’s a single table inheritance type of either Product or Component 	|
    | 3 	| Label validation in general, do we need to make it unique? 	| Not necessary for labels to be unique 	|
    | 4 	| For identifier, I believe this should be without white space, probably put - or _ as word separation, is that correct? 	| Snake or kebab case are fine and accepted 	|
    | 5 	| Modifier, one of the columns is price_override, is this column allowed to leave it blank? 	| Yes a nil or blank means it will take the modifier items original price 	|
    | 6 	| In the Task #3, the next step is to deploy the project, do you have any criteria where should we deploy the project? Heroku probably? Do we need to have user authentication on the project? 	| No need for authentication, no preference for deployment, can just pick any free one out there! 	|

- Another follow up questions asked:

    | No 	| Question 	|
    |---	|---	|
    | 1 	| Is there any different treatment/flow between Item as a Product and Item as Component? Is this related to the Task #4 which said “The dummy data should include a menu with 2 sections, the first containing Items that are not configurable, and the second containing items that are configurable”? 	|
    | 2 	| In the Modifier, there is default_quantity column, is the default_quantity value a range between selection_required_min and selection_required_max from ModifierGroup? 	|
    | 3 	| In the Menu, what would happen if the end_date value more than current date? Is it allowed to have end_date before current date? 	|
    | 4 	| Some of the tables has display_order column, is it okay to have duplicate order value especially in Section, because Section could be reused for another Menu? Why Section need to have its own display_order? 	|

## Sunday, Dec 24, 2023 (30 minutes)

### TL; TR;

> Got answer from Ernest for the previous questions, read it and let it sink in. Then clarify another confusion.

- Answer from the follow up questions (replied on Dec 24, 2023)

    | No 	| Question 	| Answer 	|
    |---	|---	|---	|
    | 1 	| Is there any different treatment/flow between Item as a Product and Item as Component? Is this related to the Task #4 which said “The dummy data should include a menu with 2 sections, the first containing Items that are not configurable, and the second containing items that are configurable”? 	| For now there’s no real difference between the two except that components can only be linked to products and cannot exist on the menu standalone. 	|
    | 2 	| In the Modifier, there is default_quantity column, is the default_quantity value a range between selection_required_min and selection_required_max from ModifierGroup? 	| Default quantity is the default selected modifier quantity of a modifier group, it’s not dependent on the min and max of the modifier groups. Eg. A modifier group called “Size” can have two modifiers, “Small” and “Large”, in this example small can have a default quantity of 1 so it’s selected by default. 	|
    | 3 	| In the Menu, what would happen if the end_date value more than current date? Is it allowed to have end_date before current date? 	| End date can be any date that is after start date, if end date is before current date, it will not load on the front end and will be considered an old menu. 	|
    | 4 	| Some of the tables has display_order column, is it okay to have duplicate order value especially in Section, because Section could be reused for another Menu? Why Section need to have its own display_order? 	| Display order is to determine which section appears first. So if I have a menu with sections, the menu section table will determine the order of the sections via display_order. 	|

- Another questions asked:

    | No 	| Question 	|
    |---	|---	|
    | 1 	| <b>“Item as components can only be linked to products”</b><br>So I need to have “product” as reference in the Item table to specify which Item components is linked to which item product, is that correct? 	|
    | 2 	| <b>“The dummy data should include a menu with 2 sections, the first containing Items that are not configurable, and the second containing items that are configurable (any number of modifier groups and modifiers)”</b><br>In this context, configurable item here is item that user can interact with the interactive modifier for example size (small, medium, big) or toppings (bacon, cheese) meanwhile not configurable is item that does not have any modifier for example like Small French fries per se, is that correct? 	|

## Monday, Dec 25, 2023 (1 hour)

### TL; TR;
> Got answer from Ernest for the previous questions, read it and let it sink in. Tried to understand all the context and verified it with ChatGPT. Creating summary of it.

- Answer from the previous questions (Dec 25, 2023)

    | No 	| Question 	| Answer 	|
    |---	|---	|---	|
    | 1 	| <b>“Item as components can only be linked to products”</b><br>So I need to have “product” as reference in the Item table to specify which Item components is linked to which item product, is that correct? 	| Hmm, nope, what I meant is that the Items table is a Single Table Inheritance with 2 types, Product and Component. Products can have modifier groups, which will have modifiers which can point to either another Product or a Component. 	|
    | 2 	| <b>“The dummy data should include a menu with 2 sections, the first containing Items that are not configurable, and the second containing items that are configurable (any number of modifier groups and modifiers)”</b><br>In this context, configurable item here is item that user can interact with the interactive modifier for example size (small, medium, big) or toppings (bacon, cheese) meanwhile not configurable is item that does not have any modifier for example like Small French fries per se, is that correct? 	| Yes correct, for the purpose of this exercise a non-configurable item should not have any modifier groups. 	|

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

### TL; TR;
> Create migration scripts for all tables, make sure create the migration from the base table to tables with references, so the migrate will success.

- Create tables using these migration scripts:
    ```
        $ rails g migration CreateMenus identifier:string label:string state:string start_date:date end_date:date
    ```
    ```
        $ rails g migration CreateSections identifier:string label:string description:string display_order:integer
    ```
    ```
        $ rails g migration CreateItems type:string identifier:string label:string description:string price:float
    ```
    ```
        $ rails g migration CreateModifierGroups identifier:string label:string selection_required_min:integer selection_required_max:integer
    ```
    ```
        $ rails g migration CreateMenuSections menu:references section:references display_order:integer
    ```
    ```
        $ rails g migration CreateSectionItems section:references item:references display_order:integer
    ```
    ```
        $ rails g migration CreateModifiers item:references modifier_group:references display_order:integer default_quantity:integer price_override:float
    ```
    ```
        $ rails g migration CreateItemModifierGroups item:references modifier_group:references
    ```

    Then, run the migration by using this script in terminal `rails db:migrate`

## Wednesday, Dec 26, 2023 (3 hours)

### TL; TR;
> Checking the migration results, generate the models and define the associations for each models, bug fix how to create tables as similar as the ERD.

- Checking the migration results, it turned out the generated tables are using `id` as primary key, in this case I need to find a way to use `identifier` as primary key of the tables.
    - found the solution using GPT, but failed to migrate the tables with references, with error related to `unique constraint in Menu tables`, then adding index as the unique constraint in all migration files
    - found another issue with error related to `foreign key not match 'bigInt' and 'varchar'`, then I realize the issue is because I did't state the reference as type of string
- Adding associations to table while checking it with dummy data.
    - failed to create Item as Component with error `'product_id' is not found`, then found the solution in GPT by adding attribute `product_id` and foreign_key to `product_id` thus Component will not check `product_id` column in Item table.
        - <b>?</b> Now success creating the Item as Component, but confuse how to fetch product in the future since the value does not store in the DB
    - failed to create Modifier, because the record with specific item_id and modifier_group_id already exists, to differentiate the Modifier I decided to add new column called `label`, not only to differentiate each modifier option, but also to make descriptive options. After adding `label` column, I updated the index by adding `label` as index.
    - <b>All dummy data has been successfully stored to DB, but still need to add validation for each models.</b>