-----------------------------------
-- ID: 6170
-- Item: Bounty List
-- A simple list of known criminals who are better off dead.
-- Every single name is crossed out in Azima's handwriting.
-- Adventurers note that reading it increases one's elemental magic skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.ELEMENTAL_MAGIC)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.ELEMENTAL_MAGIC)
end

return itemObject
