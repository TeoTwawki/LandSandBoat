-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Hampu-Kampu
-- !pos  -115.597, -1.000, -158.703 94
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local sayItWithAHandbag = player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.SAY_IT_WITH_A_HANDBAG)
    local sayItWithAHandbagCS = player:getCharVar('sayItWithAHandbagCS')

    if sayItWithAHandbag == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(175)
    elseif player:hasKeyItem(invaderXim.ki.REPAIRED_HANDBAG) and sayItWithAHandbagCS == 4 then
        player:startEvent(174)
    elseif
        player:hasKeyItem(invaderXim.ki.TORN_PATCHES_OF_LEATHER) or
        sayItWithAHandbagCS == 3
    then
        player:startEvent(173)
    elseif
        sayItWithAHandbag == invaderXim.questStatus.QUEST_ACCEPTED and
        sayItWithAHandbagCS == 1
    then
        player:startEvent(172)
    elseif sayItWithAHandbag == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(170)
    elseif sayItWithAHandbag == invaderXim.questStatus.QUEST_AVAILABLE then
        player:startEvent(169)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 174 then -- Option doesn't matter as NPC will take key item if yes or no
        if
            npcUtil.completeQuest(player, invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.SAY_IT_WITH_A_HANDBAG, {
                item = 19110, -- Trainee's Needle
                var = 'sayItWithAHandbagCS'
            })
        then
            player:delKeyItem(invaderXim.ki.REPAIRED_HANDBAG)
            player:setCharVar('sayItWithAHandbagBonusCS', 1)
        end
    elseif csid == 172 then
        npcUtil.giveKeyItem(player, invaderXim.ki.TORN_PATCHES_OF_LEATHER)
    elseif csid == 169 then
        player:addQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.SAY_IT_WITH_A_HANDBAG)
    end
end

return entity
