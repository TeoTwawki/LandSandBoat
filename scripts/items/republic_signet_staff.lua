-----------------------------------
-- ID: 17583
-- Item: Republic Signet Staff
-- Effect: Signet
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getNation() ~= invaderXim.nation.BASTOK then
        return invaderXim.msg.basic.ITEM_CANNOT_USE_ON
    end

    -- If target's current region is not a conquest region or not a nation city involved with conquest
    if target:getCurrentRegion() > invaderXim.region.JEUNO then
        return invaderXim.msg.basic.ITEM_UNABLE_TO_USE
    end

    -- Can only use on targets within party or self
    if target:getID() ~= caster:getID() then
        if
        caster:getPartyLeader() == nil or
            target:getPartyLeader():getID() ~= caster:getPartyLeader():getID()
        then
            return invaderXim.msg.basic.ITEM_CANNOT_USE_ON
        end
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:delStatusEffectsByFlag(invaderXim.effectFlag.INFLUENCE, true)
    target:addStatusEffect(invaderXim.effect.SIGNET, 0, 0, 18000)
end

return itemObject
