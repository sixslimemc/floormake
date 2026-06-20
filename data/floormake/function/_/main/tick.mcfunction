#> floormake:_/main/tick
#--------------------
# _/entrypoints/main
#--------------------
schedule function floormake:_/main/tick 1t

execute as @e[type=item, predicate=floormake:_/floored] at @s run function floormake:_/main/item/floored/trigger