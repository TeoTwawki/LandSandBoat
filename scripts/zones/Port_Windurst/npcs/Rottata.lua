-----------------------------------
-- Area: Port Windurst
--  NPC: Rottata
-- Outpost Teleporter NPC
-- !pos 193.111 -12.999 215.638 240
-----------------------------------
---@type TNpcEntity
local entity = {}

local teleporterNation = invaderXim.nation.WINDURST
local teleporterEvent  = 552

entity.onTrigger = function(player, npc)
    invaderXim.conquest.teleporterOnTrigger(player, teleporterNation, teleporterEvent)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.conquest.teleporterOnEventUpdate(player, csid, option, teleporterEvent)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.conquest.teleporterOnEventFinish(player, csid, option, teleporterEvent)
end

return entity
