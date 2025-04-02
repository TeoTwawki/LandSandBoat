-----------------------------------
-- ID: 6171
-- Item: Dark Deeds
-- A guide to the finer points of insidious dark magic, as compiled by Azima.
-- Proceeds from this tome have gone to fund her various purchases dealing with alchemical research.
-- Adventurers note that reading it increases one's dark magic skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.DARK_MAGIC)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.DARK_MAGIC)
end

return itemObject
