# Recipe Dump
A factorio mod that dumps the recipes into a delimited file in the script-output directory

# How it works

When you start a new game

The mod looks for every recipe (including any recipes in installed mods). It writes them into a recipedump.txt file
with the following format:

Name|Category|Group|Subgroup|Force|(Base) Craft Time|Product 1 Type|Product 1|Product 1 Amount|Product 2 Type|Product 2|Product 2 Amount|Product 3 Type|Product 3|Product 3 Amount|Product 4 Type|Product 4|Product 4 Amount|Product 5 Type|Product 5|Product 5 Amount|Product 6 Type|Product 6|Product 6 Amount|Ingredient 1 Type|Ingredient 1|Ingredient 1 Amount|Ingredient 2 Type|Ingredient 2|Ingredient 2 Amount|Ingredient 3 Type|Ingredient 3|Ingredient 3 Amount|Ingredient 4 Type|Ingredient 4|Ingredient 4 Amount|Ingredient 5 Type|Ingredient 5|Ingredient 5 Amount|Ingredient 6 Type|Ingredient 6|Ingredient 6 Amount|
