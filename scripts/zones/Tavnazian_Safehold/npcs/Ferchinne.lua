-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Ferchinne
-- Note: Involved in quest: "Fly High"
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local flyHigh = player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.FLY_HIGH)

    if
        flyHigh == invaderXim.questStatus.QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, { { invaderXim.item.HIPPOGRYPH_TAILFEATHER, 2 } })
    then
        -- 2x Hippogryph Tailfeather
        player:startEvent(243)
    elseif
        flyHigh == invaderXim.questStatus.QUEST_COMPLETED and
        npcUtil.tradeHas(trade, { { invaderXim.item.HIPPOGRYPH_TAILFEATHER, 2 } })
    then
        -- 2x Hippogryph Tailfeather
        player:startEvent(245)
    end
end

entity.onTrigger = function(player, npc)
    if
        player:getCurrentMission(invaderXim.mission.log_id.COP) == invaderXim.mission.id.cop.THE_SAVAGE or
        player:hasCompletedMission(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.THE_SAVAGE)
    then
        local flyHigh = player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.FLY_HIGH)

        if flyHigh == invaderXim.questStatus.QUEST_AVAILABLE then
            player:startEvent(241)
        elseif flyHigh == invaderXim.questStatus.QUEST_ACCEPTED then
            player:startEvent(242)
        elseif flyHigh == invaderXim.questStatus.QUEST_COMPLETED then
            player:startEvent(244)
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 241 then
        player:addQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.FLY_HIGH)
    elseif
        csid == 243 and
        npcUtil.completeQuest(player, invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.FLY_HIGH, { item = invaderXim.item.MISTMELT })
    then
        -- Mistmelt
        player:confirmTrade()
    elseif csid == 245 and npcUtil.giveItem(player, invaderXim.item.MISTMELT) then -- Mistmelt
        player:confirmTrade()
    end
end

return entity
