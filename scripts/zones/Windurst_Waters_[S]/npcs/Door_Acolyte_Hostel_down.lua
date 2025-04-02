-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Door Acolyte Hostel
-- !pos  124.000, -3.000, 222.215 94
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WATERS_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STIRS) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(invaderXim.ki.SMALL_STARFRUIT)
    then
        player:startEvent(129)
    elseif
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STRIKES) == invaderXim.questStatus.QUEST_COMPLETED and
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.KNOT_QUITE_THERE) == invaderXim.questStatus.QUEST_AVAILABLE
    then
        if
            player:getCurrentMission(invaderXim.mission.log_id.WOTG) == invaderXim.mission.id.wotg.CAIT_SITH or
            player:hasCompletedMission(invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.CAIT_SITH)
        then
            player:startEvent(151)
        end
    elseif player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.KNOT_QUITE_THERE) == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(152)
    else
        player:messageSpecial(ID.text.DOOR_ACOLYTE_HOSTEL_LOCKED)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 129 then
        player:addItem(invaderXim.item.HI_ELIXIR)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 4144)
        player:delKeyItem(invaderXim.ki.SMALL_STARFRUIT)
        player:completeQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STIRS)
    elseif csid == 151 then
        player:addQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.KNOT_QUITE_THERE)
    end
end

return entity
