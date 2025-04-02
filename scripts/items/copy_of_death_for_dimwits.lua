-----------------------------------
-- ID: 6152
-- Item: Death for Dimwits
-- A guide to the finer points of hacking everything in one's way to pieces with a two-handed axe,
-- written by an anonymous individual.
-- Adventurers note that reading it increases one's great axe skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.GREAT_AXE)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.GREAT_AXE)
end

return itemObject
