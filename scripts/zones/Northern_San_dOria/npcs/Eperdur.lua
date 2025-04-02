-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Eperdur
-- Starts and Finishes Quest: Healing the Land,
-- !pos 129 -6 96 231
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local healingTheLand = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.HEALING_THE_LAND)
    local sorceryOfTheNorth = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.SORCERY_OF_THE_NORTH)

    if
        healingTheLand == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 4 and
        player:getMainLvl() >= 10
    then
        player:startEvent(681) -- Start quest "Healing the Land"
    elseif
        healingTheLand == invaderXim.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(invaderXim.ki.SEAL_OF_BANISHING)
    then
        player:startEvent(682) -- During quest "Healing the Land"
    elseif
        healingTheLand == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.SEAL_OF_BANISHING)
    then
        player:startEvent(683) -- Finish quest "Healing the Land"
    elseif
        healingTheLand == invaderXim.questStatus.QUEST_COMPLETED and
        sorceryOfTheNorth == invaderXim.questStatus.QUEST_AVAILABLE and
        player:needToZone()
    then
        player:startEvent(684) -- New standard dialog after "Healing the Land"
    elseif
        healingTheLand == invaderXim.questStatus.QUEST_COMPLETED and
        sorceryOfTheNorth == invaderXim.questStatus.QUEST_AVAILABLE and
        not player:needToZone()
    then
        player:startEvent(685) -- Start quest "Sorcery of the North"
    elseif
        sorceryOfTheNorth == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.FEIYIN_MAGIC_TOME)
    then
        player:startEvent(686) -- During quest "Sorcery of the North"
    elseif
        sorceryOfTheNorth == invaderXim.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(invaderXim.ki.FEIYIN_MAGIC_TOME)
    then
        player:startEvent(687) -- Finish quest "Sorcery of the North"
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 681 and option == 0 then
        player:addQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.HEALING_THE_LAND)
        npcUtil.giveKeyItem(player, invaderXim.ki.SEAL_OF_BANISHING)
    elseif csid == 683 then
        if npcUtil.giveItem(player, invaderXim.item.SCROLL_OF_TELEPORT_HOLLA) then
            player:addTitle(invaderXim.title.PILGRIM_TO_HOLLA)
            player:needToZone(true)
            player:addFame(invaderXim.fameArea.SANDORIA, 30)
            player:completeQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.HEALING_THE_LAND)
        end
    elseif csid == 685 and option == 0 then
        player:addQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.SORCERY_OF_THE_NORTH)
    elseif csid == 687 then
        if npcUtil.giveItem(player, invaderXim.item.SCROLL_OF_TELEPORT_VAHZL) then
            player:delKeyItem(invaderXim.ki.FEIYIN_MAGIC_TOME)
            player:addFame(invaderXim.fameArea.SANDORIA, 30)
            player:completeQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.SORCERY_OF_THE_NORTH)
        end
    end
end

return entity
