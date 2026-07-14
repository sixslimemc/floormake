#> floormake : api/unregister

data remove storage floormake:out unregister

execute store result score *x _floormake run function floormake:_/impl/api/unregister/main

data remove storage floormake:_ v.unregister
data remove storage floormake:in unregister

return run scoreboard players get *x _floormake