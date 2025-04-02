-----------------------------------
-- ID: 6172
-- Item: Breezy Libretto
-- A musical score composed by Lewenhart.
-- Its notes symbolize a fragrant, early morning summer breeze.
-- Adventurers note that reading it increases one's singing skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.SINGING)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.SINGING)
end

return itemObject
