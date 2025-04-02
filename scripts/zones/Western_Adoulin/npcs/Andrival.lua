-----------------------------------
-- Area: Western Adoulin
--  NPC: Andrival
-- !pos 26 0 127 256
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local soaMission = player:getCurrentMission(invaderXim.mission.log_id.SOA)

    if soaMission == invaderXim.mission.id.soa.THE_MERCILESS_ONE then
        -- Reminds player to accompany Ingrid to Castle Adoulin
        player:startEvent(139)
    end
end

return entity
