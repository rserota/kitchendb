
# db schema

## user
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