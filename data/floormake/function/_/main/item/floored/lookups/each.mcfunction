#> floormake:_/main/item/floored/lookups/each
#--------------------
# ../trigger
#--------------------

data modify storage floormake:_ t.floored.this_lookup set from storage floormake:_ t.floored.lookups[-1]

# run condition:
execute store success score *floored.lookup_match _floormake unless data storage floormake:_ t.floored.this_lookup.self_condition
execute if score *floored.lookup_match _floormake matches 0 run data modify storage floormake:_ x.mline.1 set from storage floormake:_ t.floored.this_lookup.self_condition
execute if score *floored.lookup_match _floormake matches 0 store success score *floored.lookup_match _floormake run function floormake:_/util/mline/1 with storage floormake:_ x.mline

# try recipe if condition passes:
scoreboard players set *x _floormake 0
execute if score *floored.lookup_match _floormake matches 1 store result score *x _floormake run function floormake:_/main/item/floored/lookups/try_recipe/do with storage floormake:_ t.floored.this_lookup.recipe

# if recipe successful, end early:
execute if score *x _floormake matches 1 run return 1

data remove storage floormake:_ t.floored.lookups[-1]
execute if data storage floormake:_ t.floored.lookups[0] run function floormake:_/main/item/floored/lookups/each
