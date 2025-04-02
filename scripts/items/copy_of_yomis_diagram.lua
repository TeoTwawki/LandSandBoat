-----------------------------------
-- ID: 6175
-- Item: Yomi's Diagram
-- A meticulously drawn diagram Yomi made for Kagetora explaining how to construct certain ninja tools.
-- Adventurers note that reading it increases one's ninjutsu skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.NINJUTSU)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.NINJUTSU)
end

return itemObject
