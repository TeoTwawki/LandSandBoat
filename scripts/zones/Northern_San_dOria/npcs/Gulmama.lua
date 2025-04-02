-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Gulmama
-- Starts and Finishes Quest: Trial by Ice
-- Involved in Quest: Class Reunion
-- !pos -186 0 107 231
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local trialByIce = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRIAL_BY_ICE)
    local classReunion = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CLASS_REUNION)
    local classReunionProgress = player:getCharVar('ClassReunionProgress')

    -----------------------------------
    -- Class Reunion
    if classReunion == 1 and classReunionProgress == 4 then
        player:startEvent(713, 0, invaderXim.item.ICE_PENDULUM, 0, 0, 0, 0, 0, 0) -- he gives you an ice pendulum and wants you to go to Cloister of Frost
    elseif
        classReunion == 1 and
        classReunionProgress == 5 and
        not player:hasItem(invaderXim.item.ICE_PENDULUM)
    then
        player:startEvent(712, 0, invaderXim.item.ICE_PENDULUM, 0, 0, 0, 0, 0, 0) -- lost the ice pendulum need another one
    -----------------------------------
    elseif
        (trialByIce == invaderXim.questStatus.QUEST_AVAILABLE and player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 6) or
        (trialByIce == invaderXim.questStatus.QUEST_COMPLETED and os.time() > player:getCharVar('TrialByIce_date'))
    then
        player:startEvent(706, 0, invaderXim.ki.TUNING_FORK_OF_ICE) -- Start and restart quest 'Trial by ice'
    elseif
        trialByIce == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.TUNING_FORK_OF_ICE) and
        not player:hasKeyItem(invaderXim.ki.WHISPER_OF_FROST)
    then
        player:startEvent(718, 0, invaderXim.ki.TUNING_FORK_OF_ICE) -- Defeat against Shiva : Need new Fork
    elseif
        trialByIce == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.WHISPER_OF_FROST)
    then
        player:startEvent(707, 0, invaderXim.ki.TUNING_FORK_OF_ICE, 4)
    elseif
        trialByIce == invaderXim.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(invaderXim.ki.WHISPER_OF_FROST)
    then
        local numitem = 0

        if player:hasItem(invaderXim.item.SHIVAS_CLAWS) then
            numitem = numitem + 1
        end  -- Shiva's Claws

        if player:hasItem(invaderXim.item.ICE_BELT) then
            numitem = numitem + 2
        end  -- Ice Belt

        if player:hasItem(invaderXim.item.ICE_RING) then
            numitem = numitem + 4
        end  -- Ice Ring

        if player:hasItem(invaderXim.item.BOTTLE_OF_RUST_B_GONE) then
            numitem = numitem + 8
        end   -- Rust 'B' Gone

        if player:hasSpell(invaderXim.magic.spell.SHIVA) then
            numitem = numitem + 32
        end  -- Ability to summon Shiva

        player:startEvent(709, 0, invaderXim.ki.TUNING_FORK_OF_ICE, 4, 0, numitem)
    else
        player:startEvent(710) -- Standard dialog
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 706 and option == 1 then
        if player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRIAL_BY_ICE) == invaderXim.questStatus.QUEST_COMPLETED then
            player:delQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRIAL_BY_ICE)
        end

        player:addQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRIAL_BY_ICE)
        player:setCharVar('TrialByIce_date', 0)
        npcUtil.giveKeyItem(player, invaderXim.ki.TUNING_FORK_OF_ICE)
    elseif csid == 718 then
        npcUtil.giveKeyItem(player, invaderXim.ki.TUNING_FORK_OF_ICE)
    elseif csid == 709 then
        local item = 0

        if option == 1 then
            item = invaderXim.item.SHIVAS_CLAWS -- Shiva's Claws
        elseif option == 2 then
            item = invaderXim.item.ICE_BELT -- Ice Belt
        elseif option == 3 then
            item = invaderXim.item.ICE_RING -- Ice Ring
        elseif option == 4 then
            item = invaderXim.item.BOTTLE_OF_RUST_B_GONE  -- Rust 'B' Gone
        end

        if player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, item)
        else
            if option == 5 then
                npcUtil.giveCurrency(player, 'gil', 10000)
            elseif option == 6 then
                player:addSpell(invaderXim.magic.spell.SHIVA) -- Avatar
                player:messageSpecial(ID.text.SHIVA_UNLOCKED, 0, 0, 4)
            else
                player:addItem(item)
                player:messageSpecial(ID.text.ITEM_OBTAINED, item) -- Item
            end

            player:addTitle(invaderXim.title.HEIR_OF_THE_GREAT_ICE)
            player:delKeyItem(invaderXim.ki.WHISPER_OF_FROST) --Whisper of Frost, as a trade for the above rewards
            player:setCharVar('TrialByIce_date', getMidnight())
            player:addFame(invaderXim.fameArea.SANDORIA, 30)
            player:completeQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRIAL_BY_ICE)
        end
    elseif csid == 713 or csid == 712 then
        if player:getFreeSlotsCount() ~= 0 then
            player:addItem(invaderXim.item.ICE_PENDULUM)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.ICE_PENDULUM)
            player:setCharVar('ClassReunionProgress', 5)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.ICE_PENDULUM)
        end
    end
end

return entity
