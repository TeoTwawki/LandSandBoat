-----------------------------------
-- ID: 4301
-- Item: Pear au Lait
-- Item Effect: Restores 300 HP over 300 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.REGEN) then
        target:addStatusEffect(invaderXim.effect.REGEN, 3, 3, 300)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
