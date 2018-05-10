
# db schema

## kdb_user
- id serial primary key
- username varchar(99)
- email varchar(99)
- password varchar(999)

## ingredient
- id serial primary key 
- name varchar(99) not null unique
- description varchar(999) not null unique

## dish
- id serial primary key 
- user_id integer references kdb_user(id)
- name varchar(99) not null unique
- image_url varchar(99)
- description string not null unique

## ingredient_dish
- id serial primary key 
- ingredient_id integer references ingredient(id)
- dish_id integer references dish(id)

## menu
- id serial primary key 
- user_id integer references kdb_user(id)
- name varchar(99) not null unique
- description varchar(999) not null unique

 ## menu_dish
 - id serial primary key 
 - menu_id integer references menu(id)
 - dish_id integer references dish(id)

## favorite_dish
- id serial primary key
- dish_id integer references dish(id)
- user_id integer references kdb_user(id)

# search functionality

## dishes by name
- name
- photo
- description snippet
- links to oneDish.component

## oneDish
- name
- photo
- description
- list of ingredients (link to oneIngredient.component)
- appears in these menus (link to oneMenu.component)

## dishes by ingredient
- name
- photo
- description snippet
- links to oneDish.component

## menus by name
- name 
- description







