# IMPL > floormake : api/register
# recipes/each
#--------------------
# ../main
#--------------------
# forward iter

data modify storage floormake:_ v.register.this_recipe set from storage floormake:in register.recipes[0]

# (vaguely) check validity:
scoreboard players set *register.is_valid _floormake 1
execute unless data storage floormake:_ v.register.this_recipe.ingredients[0] run scoreboard players set *register.is_valid _floormake 0

# register if valid:
execute if score *register.is_valid _floormake matches 1 run function floormake:_/impl/api/register/recipes/register

data remove storage floormake:in register.recipes[0]
execute if data storage floormake:in register.recipes[0] run function floormake:_/impl/api/register/recipes/each