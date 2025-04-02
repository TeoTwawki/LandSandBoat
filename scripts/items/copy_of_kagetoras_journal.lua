-----------------------------------
-- ID: 6165
-- Item: Kage. Journal
-- A journal kept by Kagetora that delineates the extent to which
-- he and Yomi lost themselves in their studies of the martial arts
-- Adventurers note that reading it increases one's parrying skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.PARRY)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.PARRY)
end

return itemObject
