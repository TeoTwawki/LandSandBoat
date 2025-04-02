-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Miliart T.K
-- Type: Sigil NPC
-- !pos 107 1 -31 80
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
