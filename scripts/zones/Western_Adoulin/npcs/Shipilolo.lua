-----------------------------------
-- Area: Western Adoulin
--  NPC: Shipilolo
--  Involved with Quests: 'A Certain Substitute Patrolman'
--                        'Fertile Ground'
--                        'The Old Man and the Harpoon'
--                        'Wayward Waypoints'
-- !pos 84 0 -60 256
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local fertileGround    = player:getQuestStatus(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.FERTILE_GROUND)

    if player:getCurrentMission(invaderXim.mission.log_id.SOA) >= invaderXim.mission.id.soa.LIFE_ON_THE_FRONTIER then
        if
            player:getQuestStatus(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.THE_OLD_MAN_AND_THE_HARPOON) == invaderXim.questStatus.QUEST_ACCEPTED and
            player:hasKeyItem(invaderXim.ki.BROKEN_HARPOON)
        then
            -- Progresses Quest: 'The Old Man and the Harpoon'
            player:startEvent(2543)
        elseif
            fertileGround == invaderXim.questStatus.QUEST_ACCEPTED and
            not player:hasKeyItem(invaderXim.ki.BOTTLE_OF_FERTILIZER_X)
        then
            -- Progresses Quest: 'Fertile Ground'
            player:startEvent(2850)
        elseif
            player:getQuestStatus(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.WAYWARD_WAYPOINTS) == invaderXim.questStatus.QUEST_ACCEPTED and
            player:getCharVar('WW_Need_Shipilolo') > 0 and
            not player:hasKeyItem(invaderXim.ki.WAYPOINT_RECALIBRATION_KIT)
        then
            -- Progresses Quest: 'Wayward Waypoints'
            player:startEvent(79)
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 2543 then
        -- Progresses Quest: 'The Old Man and the Harpoon'
        player:delKeyItem(invaderXim.ki.BROKEN_HARPOON)
        npcUtil.giveKeyItem(player, invaderXim.ki.EXTRAVAGANT_HARPOON)
    elseif csid == 2850 then
        -- Progresses Quest: 'Fertile Ground' TODO: Should this also give the player a message?
        player:addKeyItem(invaderXim.ki.BOTTLE_OF_FERTILIZER_X)
    elseif csid == 79 then
        player:addKeyItem(invaderXim.ki.WAYPOINT_RECALIBRATION_KIT)
        player:setCharVar('WW_Need_Shipilolo', 0)
    end
end

return entity
