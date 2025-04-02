-----------------------------------
-- ID: 17826
-- Item: Messhikimaru
-- Enchantment: Arcana Killer
-- Durration: 10 Mins
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.MESSHIKIMARU) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 600, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.MESSHIKIMARU)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ARCANA_KILLER, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ARCANA_KILLER, 20)
end

return itemObject
