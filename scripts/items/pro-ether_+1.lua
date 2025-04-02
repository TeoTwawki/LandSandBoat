-----------------------------------
-- ID: 4141
-- Item: Pro-Ether +1
-- Item Effect: Restores 280 MP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getMP() == target:getMaxMP() then
        return invaderXim.msg.basic.ITEM_UNABLE_TO_USE
    elseif target:hasStatusEffect(invaderXim.effect.MEDICINE) then
        return invaderXim.msg.basic.ITEM_NO_USE_MEDICATED
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:messageBasic(invaderXim.msg.basic.RECOVERS_MP, 0, target:addMP(280 * invaderXim.settings.main.ITEM_POWER))
    target:addStatusEffect(invaderXim.effect.MEDICINE, 0, 0, 900)
end

return itemObject
