-----------------------------------
-- ID: 4213
-- Icarus Wing
-- Increases TP of the user by 1000
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasStatusEffect(invaderXim.effect.MEDICINE) then
        return invaderXim.msg.basic.ITEM_NO_USE_MEDICATED
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addTP(1000)
    target:addStatusEffect(invaderXim.effect.MEDICINE, 0, 0, 7200)
end

return itemObject
