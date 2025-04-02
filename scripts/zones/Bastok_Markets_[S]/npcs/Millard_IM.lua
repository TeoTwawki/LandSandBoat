-----------------------------------
-- Area: Bastok Markets [S]
--  NPC: Millard IM
-- Type: Sigil NPC
-- !pos -248.5 0 81.2 87
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.campaign.sigilOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.campaign.sigilOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.campaign.sigilOnEventFinish(player, csid, option, npc)
end

return entity
