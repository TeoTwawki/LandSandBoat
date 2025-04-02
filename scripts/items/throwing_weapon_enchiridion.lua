-----------------------------------
-- ID: 6161
-- Item: T.W. Enchiridion
-- A guide to the finer points of hurling projectile objects at opponents,
-- written by an anonymous individual.
-- Adventurers note that reading it increases one's throwing skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.THROWING)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.THROWING)
end

return itemObject
