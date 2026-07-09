#> floormake:_/main/item/floored/lookups/try_recipe/success/do
# AS [floored item]
#--------------------
# ../do
#--------------------

# for tracking is_consumed:
data modify storage floormake:_ t.floored.eval_ingredients set from storage floormake:_ t.floored.this_recipe.ingredients

# set {..this_result}:
data modify storage floormake:_ t.floored.this_result set from storage floormake:_ t.floored.this_recipe.result
execute unless data storage floormake:_ t.floored.this_result.on_ingredients run data modify storage floormake:_ t.floored.this_result.on_ingredients set value "scoreboard players get *x _floormake"
execute unless data storage floormake:_ t.floored.this_result.on_catalyst run data modify storage floormake:_ t.floored.this_result.on_catalyst set value "scoreboard players get *x _floormake"

# process items and run on_ingredients result:
# - set {api -> on_ingredients.this_recipe}
# - populate {api -> on_catalyst.ingredient_items}
data modify storage floormake:api on_ingredients.this_recipe set from storage floormake:_ t.floored.this_recipe
data modify storage floormake:api on_catalyst.ingredient_items set value []
scoreboard players set *floored.ingredient_index _floormake 0
execute if data storage floormake:_ t.floored.eval_chosen[0] run function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/each
data remove storage floormake:api on_ingredients

# run on_catalyst result:
data modify storage floormake:api on_catalyst.this_recipe set from storage floormake:_ t.floored.this_recipe
function floormake:_/main/item/floored/lookups/try_recipe/success/run_catalyst with storage floormake:_ t.floored.this_result
data remove storage floormake:api on_catalyst

# clean item:
execute as @e[type=item, tag=floormake.ingredient] at @s run function floormake:_/main/item/floored/lookups/try_recipe/success/clean_item