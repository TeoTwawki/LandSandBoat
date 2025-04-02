-----------------------------------
-- ID: 5411
-- Item: bottle_of_dawn_mulsum
-- Item Effect: Instantly restores 20%-35% of pet HP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if not target:hasPet() then
        return invaderXim.msg.basic.REQUIRES_A_PET
    end

    return 0
end

itemObject.onItemUse = function(target)
    local pet = target:getPet()
    if not pet then
        return
    end

    local percent = math.random(20, 35) * invaderXim.settings.main.ITEM_POWER
    local totalHP = (pet:getMaxHP() / 100) * percent
    pet:addHP(totalHP)
    pet:messageBasic(invaderXim.msg.basic.RECOVERS_HP, 0, totalHP)
end

return itemObject
