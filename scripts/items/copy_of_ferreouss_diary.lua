-----------------------------------
-- ID: 6157
-- Item: Ferreous's Diary
-- A diary written by Ferreous Coffin that describes his encounters with Orcs in the north.
-- So many were there that his war hammer became coated with a thick layer of blood after all was said and done.
-- Adventurers note that reading it increases one's club skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.CLUB)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.CLUB)
end

return itemObject
