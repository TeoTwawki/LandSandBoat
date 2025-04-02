-----------------------------------
-- ID: 4545
-- Item: Bunch of Gysahl Greens
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility +3
-- Vitality -5
-- Additional Effect with Chocobo Shirt
-- Agility +10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    local chocoboShirt = target:getMod(invaderXim.mod.APPRECIATE_GYSAHL_GREENS)
    target:addStatusEffect(invaderXim.effect.FOOD, chocoboShirt, 0, 300, 4545)
end

itemObject.onEffectGain = function(target, effect)
    local power = effect:getPower()
    if power == 0 then
        target:addMod(invaderXim.mod.AGI, 3)
        target:addMod(invaderXim.mod.VIT, -5)
    else
        target:addMod(invaderXim.mod.AGI, 13)
        target:addMod(invaderXim.mod.VIT, -5)
    end
end

itemObject.onEffectLose = function(target, effect)
    local power = effect:getPower()
    if power == 0 then
        target:delMod(invaderXim.mod.AGI, 3)
        target:delMod(invaderXim.mod.VIT, -5)
    else
        target:delMod(invaderXim.mod.AGI, 13)
        target:delMod(invaderXim.mod.VIT, -5)
    end
end

return itemObject
