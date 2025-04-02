-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Dhea Prandoleh
-- !pos 1 -1 15 94
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WATERS_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if
        player:getCampaignAllegiance() > 0 and
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STIRS) == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(128)
    elseif player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STIRS) == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(160)
    elseif
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STIRS) == invaderXim.questStatus.QUEST_COMPLETED and
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STRIKES) == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(133)
    elseif player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STRIKES) == invaderXim.questStatus.QUEST_ACCEPTED then
        if player:getCharVar('TigressStrikesProg') < 3 then
            player:startEvent(135)
        elseif player:getCharVar('TigressStrikesProg') == 3 then
            player:startEvent(134)
        end
    else
        player:startEvent(136)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 128 then
        player:addQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STIRS)
    elseif csid == 133 then
        player:addQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STRIKES)
    elseif csid == 134 then
        player:addItem(invaderXim.item.STAR_GLOBE)
        player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.STAR_GLOBE)
        player:completeQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STRIKES)
        player:needToZone(true)
        player:addTitle(invaderXim.title.AJIDO_MARUJIDOS_MINDER)
    end
end

return entity
