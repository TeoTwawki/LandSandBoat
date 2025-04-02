-----------------------------------
-- Area: Valkurm Dunes
--  NPC: Song Runes
-- Finishes Quest: Path of the Bard
-- !pos -721 -7 102 103
-----------------------------------
local ID = zones[invaderXim.zone.VALKURM_DUNES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    -- PATH OF THE BARD (Bard Flag)
    if
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.PATH_OF_THE_BARD) == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getCharVar('PathOfTheBard_Event') == 1
    then
        player:startEvent(2)

    -- DEFAULT DIALOG
    else
        player:messageSpecial(ID.text.SONG_RUNES_DEFAULT)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 2 then
        npcUtil.giveCurrency(player, 'gil', 3000)
        player:addTitle(invaderXim.title.WANDERING_MINSTREL)
        player:unlockJob(invaderXim.job.BRD) -- Bard
        player:messageSpecial(ID.text.UNLOCK_BARD)  --You can now become a bard!
        player:setCharVar('PathOfTheBard_Event', 0)
        player:addFame(invaderXim.fameArea.JEUNO, 30)
        player:completeQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.PATH_OF_THE_BARD)
    end
end

return entity
