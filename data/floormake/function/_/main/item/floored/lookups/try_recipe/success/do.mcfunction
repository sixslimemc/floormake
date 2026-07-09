#> floormake:_/main/item/floored/lookups/try_recipe/success/do
# AS [floored item]
#--------------------
# ../do
#--------------------

# DEBUG:
say success!

# for tracking is_consumed:
data modify storage floormake:_ t.floored.eval_ingredients set from storage floormake:_ t.floored.this_recipe.ingredients

# set api data:
data modify storage floormake:api this_recipe set from storage floormake:_ t.floored.this_recipe

# set {..this_result}:
data modify storage floormake:_ t.floored.this_result set from storage floormake:_ t.floored.this_recipe.result
execute unless data storage floormake:_ t.floored.this_result.on_ingredients run data modify storage floormake:_ t.floored.this_result.on_ingredients set value "scoreboard players get *x _floormake"
execute unless data storage floormake:_ t.floored.this_result.on_catalyst run data modify storage floormake:_ t.floored.this_result.on_catalyst set value "scoreboard players get *x _floormake"

# process items and run on_ingredients result:
scoreboard players set *floored.ingredient_index _floormake 0
execute if data storage floormake:_ t.floored.eval_chosen[0] run function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/each

# run on_catalyst result:
function floormake:_/main/item/floored/lookups/try_recipe/success/run_catalyst with storage floormake:_ t.floored.this_result

# clean up:
data remove storage floormake:api this_recipe
execute as @e[type=item, tag=floormake.ingredient] at @s run function floormake:_/main/item/floored/lookups/try_recipe/success/clean_item