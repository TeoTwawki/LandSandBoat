-----------------------------------
-- ID: 4565
-- Item: Sobbing Fungus
-- Food Effect: 3 Mins, All Races
-- Silence
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 4565)
    if not target:hasStatusEffect(invaderXim.effect.SILENCE) then
        target:addStatusEffect(invaderXim.effect.SILENCE, 1, 3, 180)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
