-----------------------------------
-- ID: 15462
-- Item: Talisman Obi
-- Effect: 3Min, MP+12 Enmity-2
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TALISMAN_OBI) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TALISMAN_OBI)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.TALISMAN_OBI) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TALISMAN_OBI)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MP, 12)
    target:addMod(invaderXim.mod.ENMITY, -2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MP, 12)
    target:delMod(invaderXim.mod.ENMITY, -2)
end

return itemObject
