-----------------------------------
-- ID: 4541
-- Item: Goblin Drink
-- Item Effect: Restores 1 MP while healing / 3 tick 180 mins.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.FOOD) then
        target:addStatusEffect(invaderXim.effect.FOOD, 1, 3, 10800, 4541)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

itemObject.onEffectGain = function(target, effect)
end

itemObject.onEffectTick = function(target, effect)
    if target:hasStatusEffect(invaderXim.effect.HEALING) then
        target:addMP(effect:getPower())
    end
end

itemObject.onEffectLose = function(target, effect)
end

return itemObject
