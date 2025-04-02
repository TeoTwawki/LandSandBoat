-----------------------------------
-- Area: Al Zahbi
--  NPC: Rajaaha
-- Type: Goldsmithing Normal/Adv. Image Support
-- !pos 49.9 0.1 -45.2 48
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
