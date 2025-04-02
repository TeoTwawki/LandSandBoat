-----------------------------------
-- ID: 11403
-- Item: Talaria
-- Enchantment: Increases movement speed.
-- Durration: 60 Mins
-- Base speed 10% or +5
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.ENCHANTMENT) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 3600, 11403)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MOVE_SPEED_QUICKENING, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MOVE_SPEED_QUICKENING, 5)
end

return itemObject
