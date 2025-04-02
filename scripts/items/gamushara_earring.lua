-----------------------------------
-- ID: 14788
-- Item: Gamushara Earring
-- Item Effect: Attack +22
-- Duration: 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.GAMUSHARA_EARRING) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.GAMUSHARA_EARRING)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.GAMUSHARA_EARRING) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.GAMUSHARA_EARRING)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ATT, 22)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ATT, 22)
end

return itemObject
