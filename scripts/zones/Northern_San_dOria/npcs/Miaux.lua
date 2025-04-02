-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Miaux
-- Type: Quest Giver
-- !pos -169.127 2.999 158.677 231
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local aCraftsmansWork = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.A_CRAFTSMANS_WORK)
    local quotasStatus    = player:getCharVar('ChasingQuotas_Progress')

    if
        player:getMainJob() == invaderXim.job.DRG and
        player:getMainLvl() >= invaderXim.settings.main.AF1_QUEST_LEVEL and
        aCraftsmansWork == invaderXim.questStatus.QUEST_AVAILABLE
    then
        if player:getCharVar('has_seen_drgaf1_quest_already') == 0 then
            player:startEvent(73)
        else -- If player has seen the big cut scene, give them a smaller one.
            player:startEvent(71)
        end
    elseif
        aCraftsmansWork == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.ALTEPA_POLISHING_STONE)
    then
        player:startEvent(69)
    elseif aCraftsmansWork == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(70)
    elseif quotasStatus == 2 then
        player:startEvent(67) -- I found this earring.
    elseif quotasStatus == 3 or quotasStatus == 4 then
        player:startEvent(68) -- Post-earring, move along.
    elseif quotasStatus >= 5 then
        player:startEvent(66) -- The earring was helpful?
    else
        player:startEvent(11)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 73 and option == 0 then -- first part of long CS -- declines questgiver
        player:setCharVar('has_seen_drgaf1_quest_already', 1)
    elseif (csid == 73 or csid == 71) and option == 1 then
        player:addQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.A_CRAFTSMANS_WORK)
        player:setCharVar('has_seen_drgaf1_quest_already', 0)
        player:setCharVar('aCraftsmanWork', 1)
    elseif csid == 70 then -- This is only if player has Altepa Polishing Stone
        if npcUtil.giveItem(player, invaderXim.item.PEREGRINE) then
            player:setCharVar('aCraftsmanWork', 0)
            player:delKeyItem(invaderXim.ki.ALTEPA_POLISHING_STONE)
            player:addFame(invaderXim.fameArea.SANDORIA, 20)
            player:completeQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.A_CRAFTSMANS_WORK)
        end
    elseif csid == 67 then
        npcUtil.giveKeyItem(player, invaderXim.ki.SHINY_EARRING)
        player:setCharVar('ChasingQuotas_Progress', 3)
    end
end

return entity
