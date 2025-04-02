-----------------------------------
-- Area: Windurst Woods
--  NPC: Peshi Yohnts
-- Type: Bonecraft Guild Master
-- !pos -6.175 -6.249 -144.667 241
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
