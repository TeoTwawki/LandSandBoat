-----------------------------------
-- ID: 6158
-- Item: K-P's Memoirs
-- Memoirs penned by Kayeel-Payeel.
-- They describe in particular detail the time he received Claustrum from the Warlock Warlord Robel-Akbel.
-- Adventurers note that reading them increases one's staff skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.STAFF)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.STAFF)
end

return itemObject
