-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (H-10 / COR boat)
-- Involved in Quests: 'Luck of the Draw', 'Equipped for All Occasions', 'Navigating the Unfriendly Seas'
-- !pos 468.767 -12.292 111.817 54
-----------------------------------
local ID = zones[invaderXim.zone.ARRAPAGO_REEF]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local mJob   = player:getMainJob()
    local mLvl   = player:getMainLvl()
    local efao   = player:getQuestStatus(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.EQUIPPED_FOR_ALL_OCCASIONS)
    local ntus   = player:getQuestStatus(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.NAVIGATING_THE_UNFRIENDLY_SEAS)

    -- NAVIGATING THE UNFRIENDLY SEAS
    if
        efao == invaderXim.questStatus.QUEST_COMPLETED and
        ntus == invaderXim.questStatus.QUEST_AVAILABLE and
        mJob == invaderXim.job.COR and
        mLvl >= invaderXim.settings.main.AF2_QUEST_LEVEL
    then
        player:startEvent(232)
    elseif player:getCharVar('NavigatingtheUnfriendlySeas') == 4 then
        player:startEvent(233)

    -- DEFAULT DIALOG
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    -- NAVIGATING THE UNFRIENDLY SEAS
    if csid == 232 then
        player:addQuest(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.NAVIGATING_THE_UNFRIENDLY_SEAS)
        player:setCharVar('NavigatingtheUnfriendlySeas', 1)
    elseif csid == 233 then
        npcUtil.completeQuest(player, invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.NAVIGATING_THE_UNFRIENDLY_SEAS, { item = 15601, var = { 'NavigatingtheUnfriendlySeas', 'HydrogauageTimer' } })
    end
end

return entity
