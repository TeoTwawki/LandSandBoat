-----------------------------------
-- ID: 5875
-- Item: Galette Des Rois
-- Food Effect: 180 Min, All Races
-----------------------------------
-- HP +8
-- MP +3% (cap13)
-- Intelligence +2
-- Random Jewel
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if target:hasStatusEffect(invaderXim.effect.FOOD) then
        result = invaderXim.msg.basic.IS_FULL
    end

    if target:getFreeSlotsCount() == 0 then
        result = invaderXim.msg.basic.ITEM_NO_USE_INVENTORY
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5875)
    local rand = math.random(784, 815)
    npcUtil.giveItem(target, { { rand, 1 } })
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 8)
    target:addMod(invaderXim.mod.FOOD_MPP, 3)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 13)
    target:addMod(invaderXim.mod.INT, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 8)
    target:delMod(invaderXim.mod.FOOD_MPP, 3)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 13)
    target:delMod(invaderXim.mod.INT, 2)
end

return itemObject
