#> floormake:_/main/item/floored/trigger
# AS [item]
#--------------------
# _/main/tick
#--------------------
tag @s add _floormake.floored

# get {..lookups}:
function floormake:_/main/item/floored/get_lookups with entity @s Item

# each lookup:
scoreboard players set *floored.recipe_match _floormake 0
execute if data storage floormake:_ t.floored.lookups[0] run function floormake:_/main/item/floored/lookups/each

scoreboard players reset *floored.lookup_match _floormake
scoreboard players reset *floored.lookup_self_index _floormake
scoreboard players reset *floored.ingredient_index _floormake
scoreboard players reset *floored.ingredient_matches _floormake
scoreboard players reset *floored.item_count _floormake
scoreboard players reset *floored.ingredients_length _floormake
scoreboard players reset *floored.eval_index _floormake
scoreboard players reset *floored.eval_success _floormake
data remove storage floormake:_ t.floored