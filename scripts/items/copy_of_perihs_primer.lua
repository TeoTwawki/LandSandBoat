-----------------------------------
-- ID: 6159
-- Item: Perih's Primer
-- A guidebook Perih Vashai jotted down for the edification of new recruits.
-- It discusses everything from the various ways of holding a bow to methods of judging distance.
-- Adventurers note that reading it increases one's archery skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.ARCHERY)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.ARCHERY)
end

return itemObject
