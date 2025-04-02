-----------------------------------
-- Area: Western Adoulin
--  NPC: Nikkhail
--  Involved With Quest: 'A Thirst for the Ages'
-- !pos -101 3 9 256
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local atfta = player:getQuestStatus(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.A_THIRST_FOR_THE_AGES)
    local atftaNeedKI = player:getCharVar('ATFTA_Status') < 2 and not player:hasKeyItem(invaderXim.ki.COPY_OF_THE_ALLIANCE_AGREEMENT)
    local soaMission = player:getCurrentMission(invaderXim.mission.log_id.SOA)

    if soaMission >= invaderXim.mission.id.soa.LIFE_ON_THE_FRONTIER then
        if atfta == invaderXim.questStatus.QUEST_ACCEPTED and atftaNeedKI then
            -- Progresses Quest: 'A Thirst for the Ages'
            player:startEvent(5053)
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 5053 then
        npcUtil.giveKeyItem(player, invaderXim.ki.COPY_OF_THE_ALLIANCE_AGREEMENT)
    end
end

return entity
