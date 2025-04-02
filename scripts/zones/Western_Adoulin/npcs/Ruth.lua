-----------------------------------
-- Area: Western Adoulin
--  NPC: Ruth
-- Involved With Quest: 'A Pioneers Best (Imaginary) Friend'
-- !pos -144 4 -10 256
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(invaderXim.mission.log_id.SOA) >= invaderXim.mission.id.soa.LIFE_ON_THE_FRONTIER then
        if
            player:getQuestStatus(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.A_PIONEERS_BEST_IMAGINARY_FRIEND) == invaderXim.questStatus.QUEST_ACCEPTED and
            not player:hasStatusEffect(invaderXim.effect.IONIS)
        then
            -- Progresses Quest: 'A Pioneers Best (Imaginary) Friend'
            player:startEvent(2523)
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 2523 then
        -- Progresses Quest: 'A Pioneers Best (Imaginary) Friend'
        player:delStatusEffectsByFlag(invaderXim.effectFlag.INFLUENCE, true)
        player:addStatusEffect(invaderXim.effect.IONIS, 0, 0, 9000)
    end
end

return entity
