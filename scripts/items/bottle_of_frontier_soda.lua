-----------------------------------
-- ID: 5944
-- Item: Bottle of Frontier Soda
-- Item Effect: Restores 20 TP over 60 seconds.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.REGAIN) then
        target:addStatusEffect(invaderXim.effect.REGAIN, 1, 3, 60)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
