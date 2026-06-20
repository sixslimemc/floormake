#> floormake : api/register

data remove storage floormake:out register

execute store result score *x _floormake run function floormake:_/impl/api/register/main

data remove storage floormake:_ v.register
data remove storage floormake:in register
scoreboard players reset *register.is_valid _floormake
scoreboard players reset *register.is_dynamic _floormake
scoreboard players reset *register.ingredient_index _floormake

return run scoreboard players get *x _floormake