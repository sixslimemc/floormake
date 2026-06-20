# IMPL > floormake : api/register
# recipes/register
#--------------------
# ./each
#--------------------

# remove existing:
function floormake:_/impl/api/register/recipes/remove_existing with storage floormake:_ v.register.this_recipe

# each ingredient:
data modify storage floormake:_ v.register.ingredients set from storage floormake:_ v.register.this_recipe.ingredients
execute store result score *register.ingredient_index _floormake if data storage floormake:_ v.register.ingredients[]
execute if data storage floormake:_ v.register.ingredients[0] run function floormake:_/impl/api/register/recipes/ingredients/each
