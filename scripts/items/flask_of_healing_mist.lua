-----------------------------------
-- ID: 5832
-- Item: flask_of_healing_mist
-- Item Effect: Restores 600 HP to Party members within 10'
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:forMembersInRange(10, function(member)
        member:messageBasic(invaderXim.msg.basic.RECOVERS_HP, 0, member:addHP(600 * invaderXim.settings.main.ITEM_POWER))
    end)
end

return itemObject
