# IMPL > floormake : api/register
# recipes/register
#--------------------
# ./each
#--------------------

# remove existing:
data modify storage floormake:_/in remove_recipe set from storage floormake:_ v.register.this_recipe
function floormake:_/util/remove_recipe/main

# each ingredient:
data modify storage floormake:_ v.register.ingredients set from storage floormake:_ v.register.this_recipe.ingredients
execute store result score *register.ingredient_index _floormake if data storage floormake:_ v.register.ingredients[]
execute if data storage floormake:_ v.register.ingredients[0] run function floormake:_/impl/api/register/recipes/ingredients/each
