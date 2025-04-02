-----------------------------------
-- ID: 5261
-- Item: Bottle Of Psychoanima
-- Item Effect: Intimidate
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if target:getEcosystem() ~= invaderXim.ecosystem.EMPTY then -- Empty
        result = invaderXim.msg.basic.ITEM_UNABLE_TO_USE
    elseif target:checkDistance(caster) > 10 then
        result = invaderXim.msg.basic.TOO_FAR_AWAY
    end

    return result
end

itemObject.onItemUse = function(target, player)
    target:delStatusEffectSilent(invaderXim.effect.INTIMIDATE)
    target:addStatusEffect(invaderXim.effect.INTIMIDATE, 100, 0, math.random(25, 32))
end

return itemObject
