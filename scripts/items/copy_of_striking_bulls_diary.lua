-----------------------------------
-- ID: 6151
-- Item: Bull's Diary
-- An account penned by Striking Bull during the Second Battle of Konschtat.
-- It details the Republic's victory over King Raigegue the Lupine's San d'Orian army.
-- Adventurers note that reading it increases one's axe skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.skillBookCheck(target, invaderXim.skill.AXE)
end

itemObject.onItemUse = function(target)
    invaderXim.itemUtils.skillBookUse(target, invaderXim.skill.AXE)
end

return itemObject
