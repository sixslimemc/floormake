#> floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/get_new_count/operation
#--------------------
# ./each_item
#--------------------

$execute store result score *x _floormake run data get storage floormake:_ t.floored.new_count.'$(guuid)'.count
scoreboard players operation *x _floormake -= *floored.subtract_amount _floormake

# DEBUG:
tellraw @a ["NEW COUNT: ", {'score':{'name':'*x', 'objective':'_floormake'}}]

execute if score *x _floormake matches ..-1 run return 0

$execute store result storage floormake:_ t.floored.new_count.'$(guuid)'.count int 1 run scoreboard players get *x _floormake

return 1