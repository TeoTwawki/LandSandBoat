-----------------------------------
-- ID: 6148
-- Item: Dagger enchiridion
-- A guide to the finer points of wielding a dagger,
-- written by an anonymous individual.
-- Adventurers note that reading it increases one's dagger skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.DAGGER)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.DAGGER)
end

return itemObject
