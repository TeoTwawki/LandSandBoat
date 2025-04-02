-----------------------------------
-- ID: 4130
-- Item: Ether +2
-- Item Effect: Restores 30 MP
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
    target:messageBasic(invaderXim.msg.basic.RECOVERS_MP, 0, target:addMP(30 * invaderXim.settings.main.ITEM_POWER))
end

return itemObject
