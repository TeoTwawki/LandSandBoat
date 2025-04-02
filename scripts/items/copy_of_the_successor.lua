-----------------------------------
-- ID: 6164
-- Item: The Successor
-- An essay authored by Cerane I Virgaut,
-- mainly concerning the night Perseus bequeathed unto her an exemplary shield.
-- Adventurers note that reading it increases one's shield skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.SHIELD)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.SHIELD)
end

return itemObject
