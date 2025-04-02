-----------------------------------
-- ID: 6160
-- Item: Barrels of Fun
-- An educational text authored by Elivira Gogol.
-- It discusses how to dismantle, clean, and reconstruct firearms in careful detail.
-- Adventurers note that reading it increases one's marksmanship skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.MARKSMANSHIP)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.MARKSMANSHIP)
end

return itemObject
