-----------------------------------
-- ID: 6167
-- Item: Coveffe Musings
-- A collection of thoughts scribbled out by Ferreous Coffin on his visit to Coveffe Barrows.
-- Adventurers note that reading it increases one's healing magic skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.HEALING_MAGIC)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.HEALING_MAGIC)
end

return itemObject
