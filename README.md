# Recipe Dump
A factorio mod that dumps the recipes into a delimited file in the script-output directory

# How it works

When you start a new game the mod looks for every recipe (including any recipes in installed mods) and iterates them inorder to output all products and ingredients.

# Output
It writes them into a recipedump.csv file with 3 "parts"
 * 1st Basic recipe data
 * 2nd Products (produced by the recipe) by name, type and amount
   The first product of a recipe is always the recipe item itself unless a recipe produces something entirely different than the name suggests.
 * 3rd Ingredients (needed by the recipe) by name, type and amount

## Format csv (semicolon seperated)
Name;Category;Group;Subgroup;Force;(Base) Craft Time;
Product 1;Product Type 1;Product Amount 1;
Product 2;Product Type 2;Product Amount 2;
Product 3;Product Type 3;Product Amount 3;
Ingredient 1;Ingredient Type 1;Ingredient Amount 1;
Ingredient 2;Ingredient Type 2;Ingredient Amount 2;
Ingredient 3;Ingredient Type 3;Ingredient Amount 3;
Ingredient 4;Ingredient Type 4;Ingredient Amount 4;
Ingredient 5;Ingredient Type 5;Ingredient Amount 5;
Ingredient 6;Ingredient Type 6;Ingredient Amount 6

## Limits
The base game recipes has a max of 3 products and 6 ingredients, so the script is limited to outputting exactly that.
If changes is needed (in newer versions or if using other mods), these limits needs to be changed within logrecipe and logrecipes functions in the control.lua fil.
