#> floormake:_/main/item/floored/lookups/try_recipe/items/on
# AS [item]
#--------------------
# ../do
#--------------------

data modify storage floormake:_ t.floored.item set value {}

# get data:
data modify storage floormake:_ t.floored.item.data set from entity @s Item

# get guuid:
data modify storage six:in guuid.uuid set from storage floormake:_ t.floored.item_data.UUID
function six:uuid/guuid
data modify storage floormake:_ t.floored.item.guuid set from storage six:out guuid.result

# each ingredient:
execute store result score *floored.item_count _floormake run data get storage floormake:_ t.floored.item.data.Item.count
scoreboard players set *floored.ingredient_matches _floormake 0
scoreboard players set *floored.ingredient_index _floormake 0
data modify storage floormake:_ t.floored.ingredients set from storage floormake:_ t.floored.this_lookup.recipe.ingredients
execute if data storage floormake:_ t.floored.ingredients[0] run function floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/each

# make {..item_map} entry if relevant item:
execute if score *floored.ingredient_matches _floormake matches 1.. run function floormake:_/main/item/floored/lookups/try_recipe/items/item_map_entry with storage floormake:_ t.floored.item