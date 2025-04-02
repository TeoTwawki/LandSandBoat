-----------------------------------
-- Area: Monastic Cavern
--  NPC: Altar
-- Involved in Quests: The Circle of Time
-- !pos 108 -2 -144 150
-----------------------------------
local ID = zones[invaderXim.zone.MONASTIC_CAVERN]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local circleOfTime = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_CIRCLE_OF_TIME)

    if
        circleOfTime == invaderXim.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(invaderXim.ki.STAR_RING1) and
        player:hasKeyItem(invaderXim.ki.MOON_RING)
    then
        if
            player:getCharVar('circleTime') == 7 and
            npcUtil.popFromQM(player, npc, ID.mob.BUGABOO, { hide = 0 })
        then
            -- no further action needed
        elseif player:getCharVar('circleTime') == 8 then
            player:startEvent(3)
        else
            player:messageSpecial(ID.text.ALTAR)
        end
    else
        player:messageSpecial(ID.text.ALTAR)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 3 then
        player:setCharVar('circleTime', 9)
        player:delKeyItem(invaderXim.ki.MOON_RING)
        player:delKeyItem(invaderXim.ki.STAR_RING1)
    end
end

return entity
