-----------------------------------
-- Area: Mount_Zhayolm
--  NPC: Waudeen
-- Type: Assault
-- !pos 673.882 -23.995 367.604 61
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local toauMission = player:getCurrentMission(invaderXim.mission.log_id.TOAU)

    -- ASSAULT
    if toauMission >= invaderXim.mission.id.toau.PRESIDENT_SALAHEEM then
        local IPpoint = player:getCurrency('imperial_standing')
        if
            player:hasKeyItem(invaderXim.ki.LEBROS_ASSAULT_ORDERS) and
            not player:hasKeyItem(invaderXim.ki.ASSAULT_ARMBAND)
        then
            player:startEvent(209, 50, IPpoint)
        else
            player:startEvent(6)
        end

    -- DEFAULT DIALOG
    else
        player:startEvent(3)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    -- ASSAULT
    if csid == 209 and option == 1 then
        player:delCurrency('imperial_standing', 50)
        npcUtil.giveKeyItem(player, invaderXim.ki.ASSAULT_ARMBAND)
    end
end

return entity
