-----------------------------------
-- Area: Windurst Walls
-- Door: House of the Hero
-- Involved In Quest: Know One's Onions, Onion Rings, The Puppet Master, Class Reunion
-- !pos -26 -13 260 239
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local thePuppetMaster = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_PUPPET_MASTER)
    local classReunion = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CLASS_REUNION)
    local carbuncleDebacle = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CARBUNCLE_DEBACLE)
    local iCanHearARainbow = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.I_CAN_HEAR_A_RAINBOW)

    -- I CAN HEAR A RAINBOW
    if
        iCanHearARainbow == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getMainLvl() >= 30 and
        player:hasItem(invaderXim.item.CARBUNCLES_RUBY)
    then
        player:startEvent(384, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY)
    elseif iCanHearARainbow == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(385, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY, invaderXim.item.CARBUNCLES_RUBY)

    -- CLASS REUNION
    elseif
        thePuppetMaster == invaderXim.questStatus.QUEST_COMPLETED and
        classReunion == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getMainLvl() >= invaderXim.settings.main.AF2_QUEST_LEVEL and
        player:getMainJob() == invaderXim.job.SMN and
        not player:needToZone()
    then
        player:startEvent(413)

    -- CARBUNCLE DEBACLE
    elseif
        thePuppetMaster == invaderXim.questStatus.QUEST_COMPLETED and
        classReunion == invaderXim.questStatus.QUEST_COMPLETED and
        carbuncleDebacle == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getMainLvl() >= invaderXim.settings.main.AF3_QUEST_LEVEL and
        player:getMainJob() == invaderXim.job.SMN and
        not player:needToZone()
    then
        player:startEvent(415)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    -- I CAN HEAR A RAINBOW
    if csid == 384 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.I_CAN_HEAR_A_RAINBOW)

    -- CLASS REUNION
    elseif csid == 413 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CLASS_REUNION)
        npcUtil.giveKeyItem(player, invaderXim.ki.CARBUNCLES_TEAR)
        player:setCharVar('ClassReunionProgress', 1)

    -- CARBUNCLE DEBACLE
    elseif csid == 415 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CARBUNCLE_DEBACLE)
        player:setCharVar('CarbuncleDebacleProgress', 1)
    end
end

return entity
