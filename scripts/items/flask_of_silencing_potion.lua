-----------------------------------
-- ID: 4162
-- Item: Silencing Potion
-- Item Effect: This potion induces silence.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.SILENCE) then
        target:addStatusEffect(invaderXim.effect.SILENCE, 1, 3, 180)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
