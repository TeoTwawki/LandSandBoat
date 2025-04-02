-----------------------------------
-- Area: Western Adoulin
--  NPC: Volgoi
-- !pos -154 4 -22 256
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local soaMission = player:getCurrentMission(invaderXim.mission.log_id.SOA)

    if
        soaMission >= invaderXim.mission.id.soa.BEAUTY_AND_THE_BEAST and
        soaMission <= invaderXim.mission.id.soa.SALVATION
    then
        -- Speech while Arciela is 'kidnapped'
        player:startEvent(151)
    end
end

return entity
