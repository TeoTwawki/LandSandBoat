-----------------------------------
-- Area: Bastok Mines
--  NPC: Conrad
-- Outpost Teleporter NPC
-- !pos 94.457 -0.375 -66.161 234
-----------------------------------
---@type TNpcEntity
local entity = {}

local teleporterNation = invaderXim.nation.BASTOK
local teleporterEvent  = 581

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
