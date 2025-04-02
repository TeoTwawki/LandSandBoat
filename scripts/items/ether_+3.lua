-----------------------------------
-- ID: 4131
-- Item: Ether +3
-- Item Effect: Restores 40 MP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getMP() == target:getMaxMP() then
        return invaderXim.msg.basic.ITEM_UNABLE_TO_USE
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:messageBasic(invaderXim.msg.basic.RECOVERS_MP, 0, target:addMP(40 * invaderXim.settings.main.ITEM_POWER))
end

return itemObject
