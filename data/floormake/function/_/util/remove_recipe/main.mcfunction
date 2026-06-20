#> floormake :_/util/ remove_recipe
#--------------------
# -> pack_id: slimecore:PackId
# -> id: RecipeId
#--------------------
# .
#--------------------
# TODO: description
#--------------------
# 1.
#--------------------

data modify storage floormake:_/out remove_recipe set value {}

# check exists:
execute store success score *remove_recipe.exists _floormake run function floormake:_/util/remove_recipe/check_exists with storage floormake:_/in remove_recipe

# remove base:
execute if score *remove_recipe.exists _floormake matches 1 run function floormake:_/util/remove_recipe/remove_base with storage floormake:_/in remove_recipe

# each ingredient:
data modify storage floormake:_ u.remove_recipe.ingredients set from storage floormake:_ u.remove_recipe.existing_recipe.ingredients
execute if score *remove_recipe.exists _floormake matches 1 if data storage floormake:_ u.remove_recipe.ingredients[0] run function floormake:_/util/remove_recipe/ingredients/each

data remove storage floormake:_ u.remove_recipe
data remove storage floormake:_/in remove_recipe
scoreboard players reset *remove_recipe.exists _floormake

return 1