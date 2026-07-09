#> floormake:_/main/item/floored/lookups/try_recipe/do
#--------------------
# ../each
#--------------------

data modify storage floormake:_ t.floored.this_recipe set from storage floormake:_ t.floored.this_lookup.recipe
execute store result score *floored.ingredients_length _floormake if data storage floormake:_ t.floored.this_recipe.ingredients[]

# setup:
# {..compositions} : [{list:[{needs:int, items:[{contributing:int, guuid:Guuid}]}]}]
# {..item_map} : <Guuid> -> {count:int}
#   used to keep track of remaining total as recipe evaluates.
#   should be initialized on initial /on call.
data modify storage six:in initialize.value set value {list:[]}
execute store result storage six:in initialize.length int 1 run scoreboard players get *floored.ingredients_length _floormake
function six:list/initialize
data modify storage floormake:_ t.floored.compositions set from storage six:out initialize.result

data modify storage floormake:_ t.floored.item_map set value {}

$execute as @e[type=item, tag=!-, tag=!_, distance=..$(radius)] at @s run function floormake:_/main/item/floored/lookups/try_recipe/items/on

# early stop if trivially no possible combinations exist:
execute store result score *x _floormake if data storage floormake:_ t.floored.compositions[{list:[{needs:0}]}]
execute if score *x _floormake < *floored.ingredients_length _floormake run return 0

execute store result score *x _floormake run function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/do
execute if score *x _floormake matches 0 run return 0

function floormake:_/main/item/floored/lookups/try_recipe/success/do

return 1