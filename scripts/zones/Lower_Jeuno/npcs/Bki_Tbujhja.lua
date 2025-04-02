-----------------------------------
-- Area: Lower Jeuno
--  NPC: Bki Tbujhja
-- Involved in Quest: The Old Monument
-- Starts and Finishes Quests: Path of the Bard (just start), The Requiem (BARD AF2)
-- !pos -22 0 -60 245
-----------------------------------
local ID = zones[invaderXim.zone.LOWER_JEUNO]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- THE REQUIEM (holy water)
    if
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_REQUIEM) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('TheRequiemCS') == 2 and
        trade:hasItemQty(invaderXim.item.FLASK_OF_HOLY_WATER, 1) and
        trade:getItemCount() == 1
    then
        player:startEvent(151)
    end
end

entity.onTrigger = function(player, npc)
    local theRequiem = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_REQUIEM)

    -- PATH OF THE BARD (Bard Flag)
    if
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.A_MINSTREL_IN_DESPAIR) == invaderXim.questStatus.QUEST_COMPLETED and
        player:getCharVar('PathOfTheBard_Event') == 0
    then
        player:startEvent(182) -- mentions song runes in Valkurm

    -- THE REQUIEM (Bard AF2)
    elseif
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.PAINFUL_MEMORY) == invaderXim.questStatus.QUEST_COMPLETED and
        theRequiem == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getMainJob() == invaderXim.job.BRD and
        player:getMainLvl() >= invaderXim.settings.main.AF2_QUEST_LEVEL
    then
        if player:getCharVar('TheRequiemCS') == 0 then
            player:startEvent(145) -- Long dialog & Start Quest "The Requiem"
        else
            player:startEvent(148) -- Shot dialog & Start Quest "The Requiem"
        end

    elseif
        theRequiem == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('TheRequiemCS') == 2
    then
        player:startEvent(146) -- During Quest "The Requiem" (before trading Holy Water)

    elseif
        theRequiem == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('TheRequiemCS') == 3 and
        not player:hasKeyItem(invaderXim.ki.STAR_RING1)
    then
        if math.random(1, 100) <= 50 then
            player:startEvent(147) -- oh, did you take the holy water and play the requiem? you must do both!
        else
            player:startEvent(149) -- his stone sarcophagus is deep inside the eldieme necropolis.
        end

    elseif
        theRequiem == invaderXim.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(invaderXim.ki.STAR_RING1)
    then
        player:startEvent(150) -- Finish Quest "The Requiem"

    elseif theRequiem == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(134) -- Standard dialog after "The Requiem"

    -- DEFAULT DIALOG
    else
        player:startEvent(180)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    -- PATH OF THE BARD
    if csid == 182 then
        player:setCharVar('PathOfTheBard_Event', 1)

    -- THE REQUIEM
    elseif csid == 145 and option == 0 then
        player:setCharVar('TheRequiemCS', 1) -- player declines quest
    elseif
        (csid == 145 or csid == 148) and
        option == 1
    then
        player:addQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_REQUIEM)
        player:setCharVar('TheRequiemCS', 2)

    elseif csid == 151 then
        player:setCharVar('TheRequiemCS', 3)
        player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.FLASK_OF_HOLY_WATER) -- Holy Water (just message)
        player:setCharVar('TheRequiemRandom', math.random(1, 5)) -- pick a random sarcophagus

    elseif csid == 150 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.CHORAL_SLIPPERS)
        else
            player:addItem(invaderXim.item.CHORAL_SLIPPERS)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.CHORAL_SLIPPERS)
            player:addFame(invaderXim.fameArea.JEUNO, 30)
            player:completeQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_REQUIEM)
        end
    end
end

return entity
