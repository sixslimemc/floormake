#> floormake:_/main/item/floored/lookups/try_recipe/do
#--------------------
# ../each
#--------------------

data modify storage floormake:_ t.floored.this_recipe set from storage floormake:_ t.floored.this_lookup.recipe

# setup:
# {..compositions} : {list:[{needs:int, items:[{contributing:int, guuid:Guuid}]}]}
# {..item_map} : <Guuid> -> {count:int}
#   used to keep track of remaining total as recipe evaluates.
#   should be initialized on initial /on call.
data modify storage six:in initialize.value set value {list:[]}
execute store result storage six:in initialize.length int 1 if data storage floormake:_ t.floored.this_recipe.ingredients[]
function six:list/initialize
data modify storage floormake:_ t.floored.compositions set from storage six:out initialize.result

data modify storage floormake:_ t.floored.item_map set value {}

$execute as @e[type=item, distance=..$(radius), tag=!-, tag=!_] at @s run function floormake:_/main/item/floored/lookups/try_recipe/items/on

# successful craft:
return 1