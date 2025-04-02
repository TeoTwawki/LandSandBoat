-----------------------------------
-- Area: Windurst Walls (239)
--  NPC: Greeter Moogle
-- !pos -203 -0.276 -139 239
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local csid = 528
    invaderXim.events.loginCampaign.onTrigger(player, csid)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.events.loginCampaign.onEventUpdate(player, csid, option, npc)
end

return entity
