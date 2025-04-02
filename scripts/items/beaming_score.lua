-----------------------------------
-- ID: 6174
-- Item: Beaming Score
-- A musical score composed by Lewenhart.
-- Its notes symbolize the gently glowing beams of light that filter through the leaves of a deciduous tree in the late afternoon.
-- Adventurers note that reading it increases one's wind instrument skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.WIND_INSTRUMENT)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.WIND_INSTRUMENT)
end

return itemObject
