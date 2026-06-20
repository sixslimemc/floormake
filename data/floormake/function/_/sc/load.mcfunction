#> floormake:_/sc/load
# @ LOAD

scoreboard objectives add _floormake dummy



# DEBUG
scoreboard players reset *init _floormake

execute unless score *init _floormake matches 1 run function floormake:_/sc/init

function floormake:_/main/wipe_registry