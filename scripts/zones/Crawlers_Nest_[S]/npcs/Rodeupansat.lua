-----------------------------------
-- Area: Crawlers_Nest_[S]
--  NPC: Rodeupansat
-- Starts and Finishes Quest: EVIL_AT_THE_INLET
-- !pos 129 -34 26 171
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local evilAtTheInlet = player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.EVIL_AT_THE_INLET)

    -- Change to BRASS_RIBBON_OF_SERVICE later when Campaign has been added.
    if
        evilAtTheInlet == invaderXim.questStatus.QUEST_AVAILABLE and
        player:hasKeyItem(invaderXim.ki.BRONZE_RIBBON_OF_SERVICE) and
        player:getMainLvl() >= 30
    then
        player:startEvent(107) -- Start quest "Evil at the Inlet"
    elseif evilAtTheInlet == invaderXim.questStatus.QUEST_ACCEPTED then
        if player:hasKeyItem(invaderXim.ki.EVIL_WARDING_SEAL) then
            player:startEvent(108) -- During quest after receiving KI and before losing KI
        else
            player:startEvent(109) -- After losing KI and returning for reward
        end
    elseif evilAtTheInlet == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(110) -- New standard dialog after "Evil at the Inlet"
    else
        player:startEvent(106) -- Standard dialog
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 107 then
        player:addQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.EVIL_AT_THE_INLET)
        npcUtil.giveKeyItem(player, invaderXim.ki.EVIL_WARDING_SEAL)
    elseif csid == 109 then
        npcUtil.completeQuest(player, invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.EVIL_AT_THE_INLET, { item = invaderXim.item.SCROLL_OF_RECALL_JUGNER })
    end
end

return entity
