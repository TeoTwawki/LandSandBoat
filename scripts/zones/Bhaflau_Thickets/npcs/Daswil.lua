-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: Daswil
-- Type: Assault
-- !pos -208.720 -12.889 -779.713 52
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local toauMission = player:getCurrentMission(invaderXim.mission.log_id.TOAU)

    -- ASSAULT
    if toauMission >= invaderXim.mission.id.toau.PRESIDENT_SALAHEEM then
        local IPpoint = player:getCurrency('imperial_standing')
        if
            player:hasKeyItem(invaderXim.ki.MAMOOL_JA_ASSAULT_ORDERS) and
            not player:hasKeyItem(invaderXim.ki.ASSAULT_ARMBAND)
        then
            player:startEvent(512, 50, IPpoint)
        else
            player:startEvent(7)
            -- player:delKeyItem(invaderXim.ki.ASSAULT_ARMBAND)
        end

    -- DEFAULT DIALOG
    else
        player:startEvent(4)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    -- ASSAULT
    if csid == 512 and option == 1 then
        player:delCurrency('imperial_standing', 50)
        npcUtil.giveKeyItem(player, invaderXim.ki.ASSAULT_ARMBAND)
    end
end

return entity
