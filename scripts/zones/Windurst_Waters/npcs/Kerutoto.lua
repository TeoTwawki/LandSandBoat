-----------------------------------
-- Area: Windurst Waters
--  NPC: Kerutoto
-- Starts Quest Food For Thought
-- Involved in Quest: Riding on the Clouds
-- !pos 13 -5 -157 238
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WATERS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local wakingDreams = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.WAKING_DREAMS)

    -- WAKING DREAMS
    if player:hasKeyItem(invaderXim.ki.WHISPER_OF_DREAMS) then
        local availRewards = 0
            + (player:hasItem(invaderXim.item.DIABOLOSS_POLE) and 1 or 0) -- Diabolos's Pole
            + (player:hasItem(invaderXim.item.DIABOLOSS_EARRING) and 2 or 0) -- Diabolos's Earring
            + (player:hasItem(invaderXim.item.DIABOLOSS_RING) and 4 or 0) -- Diabolos's Ring
            + (player:hasItem(invaderXim.item.DIABOLOSS_TORQUE) and 8 or 0) -- Diabolos's Torque
            + (player:hasSpell(invaderXim.magic.spell.DIABOLOS) and 32 or 16) -- Pact or gil
        player:startEvent(920, invaderXim.item.DIABOLOSS_POLE, invaderXim.item.DIABOLOSS_EARRING, invaderXim.item.DIABOLOSS_RING, invaderXim.item.DIABOLOSS_TORQUE, 0, 0, 0, availRewards)
    elseif
        -- TODO: There is no current way to reobtain the KI in case of BCNM failure.  This KI
        -- is consumed on battlefield entry.

        not player:hasKeyItem(invaderXim.ki.VIAL_OF_DREAM_INCENSE) and
        (
            player:hasCompletedMission(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.DARKNESS_NAMED) and
            wakingDreams == invaderXim.questStatus.QUEST_AVAILABLE
        )
        or
        (
            wakingDreams == invaderXim.questStatus.QUEST_COMPLETED and
            os.time() > player:getCharVar('Darkness_Named_date')
        )
    then
        player:startEvent(918)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    -- WAKING DREAMS
    if csid == 918 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.WAKING_DREAMS)
        npcUtil.giveKeyItem(player, invaderXim.ki.VIAL_OF_DREAM_INCENSE)
    elseif csid == 920 then
        local reward = { fame = 0 }

        if option == 1 and not player:hasItem(invaderXim.item.DIABOLOSS_POLE) then
            reward.item = invaderXim.item.DIABOLOSS_POLE
        elseif option == 2 and not player:hasItem(invaderXim.item.DIABOLOSS_EARRING) then
            reward.item = invaderXim.item.DIABOLOSS_EARRING
        elseif option == 3 and not player:hasItem(invaderXim.item.DIABOLOSS_RING) then
            reward.item = invaderXim.item.DIABOLOSS_RING
        elseif option == 4 and not player:hasItem(invaderXim.item.DIABOLOSS_TORQUE) then
            reward.item = invaderXim.item.DIABOLOSS_TORQUE
        elseif option == 5 then
            reward.gil = 15000
        elseif option == 6 and not player:hasSpell(invaderXim.magic.spell.DIABOLOS) then
            player:addSpell(invaderXim.magic.spell.DIABOLOS)
            player:messageSpecial(ID.text.DIABOLOS_UNLOCKED, 0, 0, 0)
        end

        if npcUtil.completeQuest(player, invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.WAKING_DREAMS, reward) then
            player:delKeyItem(invaderXim.ki.WHISPER_OF_DREAMS)
            player:setCharVar('Darkness_Named_date', getMidnight())
        end
    end
end

return entity
