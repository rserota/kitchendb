
# db schema

## ingredient
- id integer primary key serial
- name string not null unique
- description string not null unique

## dish
- id integer primary key serial
- name string not null unique
- description string not null unique

## ingredient_dish
- id integer primary key serial
- ingredient_id references ingredient(id)
- dish_id references dish(id)

## menu
- id integer primary key serial
- name string not null unique
- description string not null unique

 ## menu_dish
 - id integer primary key serial
 - menu_id references menu(id)
 - dish_id references dish(id)