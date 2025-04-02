-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Mevreauche
-- Type: Smithing Guild Master
-- !pos -193.584 10 148.655 231
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.guildMasterOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.guildMasterOnTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.crafting.guildMasterOnEventFinish(player, csid, option, npc)
end

return entity
