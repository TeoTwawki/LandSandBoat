-----------------------------------
-- ID: 15611
-- Item: sturdy_slacks
-- Item Effect: HP +7, MP +7
-- Duration: 30 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.STURDY_SLACKS) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.STURDY_SLACKS)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.STURDY_SLACKS) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.STURDY_SLACKS)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HP, 7)
    target:addMod(invaderXim.mod.MP, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HP, 7)
    target:delMod(invaderXim.mod.MP, 7)
end

return itemObject
