-----------------------------------
-- ID: 5985
-- Item: Sprig of Hemlock
-- Food Effect: 5 Min, All Races
-- Paralysis
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.PARALYSIS) then
        target:addStatusEffect(invaderXim.effect.PARALYSIS, 20, 0, 600)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
