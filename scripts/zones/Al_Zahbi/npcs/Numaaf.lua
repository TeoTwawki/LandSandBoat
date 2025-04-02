-----------------------------------
-- Area: Al Zahbi
--  NPC: Numaaf
-- Type: Cooking Normal/Adv. Image Support
-- !pos 54.966 -7 8.328 48
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.ahtUhrganImageSupportOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.ahtUhrganImageSupportOnTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.crafting.ahtUhrganImageSupportOnEventFinish(player, csid, option, npc)
end

return entity
