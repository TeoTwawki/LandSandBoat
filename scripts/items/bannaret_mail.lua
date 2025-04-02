-----------------------------------
-- ID: 14531
-- Item: bannaret_mail
-- Item Effect: HP +15, Enmity +2
-- Duration: 30 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.BANNARET_MAIL) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.BANNARET_MAIL)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.BANNARET_MAIL) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.BANNARET_MAIL)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HP, 15)
    target:addMod(invaderXim.mod.ENMITY, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HP, 15)
    target:delMod(invaderXim.mod.ENMITY, 2)
end

return itemObject
