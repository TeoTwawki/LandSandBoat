-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Miah Riyuh
-- !pos 5.323 -2 37.462 94
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WATERS_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local allegiance = player:getCampaignAllegiance()
    -- 0 = none, 1 = San d'Oria Iron Rams, 2 = Bastok Fighting Fourth, 3 = Windurst Cobras

    local theFightingFourth = player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_FIGHTING_FOURTH)
    local snakeOnThePlains = player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.SNAKE_ON_THE_PLAINS)
    local steamedRams = player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.STEAMED_RAMS)
    local greenLetter = player:hasKeyItem(invaderXim.ki.GREEN_RECOMMENDATION_LETTER)

    if
        steamedRams == invaderXim.questStatus.QUEST_ACCEPTED or
        theFightingFourth == invaderXim.questStatus.QUEST_ACCEPTED
    then
        player:startEvent(122)
    elseif snakeOnThePlains == invaderXim.questStatus.QUEST_AVAILABLE and greenLetter then
        player:startEvent(103)
    elseif
        snakeOnThePlains == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getCharVar('GREEN_R_LETTER_USED') == 1
    then
        player:startEvent(105)
    elseif
        snakeOnThePlains == invaderXim.questStatus.QUEST_ACCEPTED and
        utils.mask.isFull(player:getCharVar('SEALED_DOORS'), 3)
    then
        player:startEvent(106)
    elseif
        snakeOnThePlains == invaderXim.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(invaderXim.ki.ZONPA_ZIPPAS_ALL_PURPOSE_PUTTY)
    then
        local puttyUsed = 0

        if utils.mask.getBit(player:getCharVar('SEALED_DOORS'), 0) then
            puttyUsed = puttyUsed + 1
        end

        if utils.mask.getBit(player:getCharVar('SEALED_DOORS'), 1) then
            puttyUsed = puttyUsed + 1
        end

        if utils.mask.getBit(player:getCharVar('SEALED_DOORS'), 2) then
            puttyUsed = puttyUsed + 1
        end

        player:startEvent(104, 0, 0, 0, 0, 0, 0, 0, puttyUsed)
    elseif snakeOnThePlains == invaderXim.questStatus.QUEST_COMPLETED and allegiance == 3 then
        player:startEvent(107)
    else
        player:startEvent(121)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 103 and option == 0 then
        player:addQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.SNAKE_ON_THE_PLAINS)
        npcUtil.giveKeyItem(player, invaderXim.ki.ZONPA_ZIPPAS_ALL_PURPOSE_PUTTY)
        player:setCharVar('GREEN_R_LETTER_USED', 1)
        player:delKeyItem(invaderXim.ki.GREEN_RECOMMENDATION_LETTER)
    elseif csid == 103 and option == 1 then
        player:setCharVar('GREEN_R_LETTER_USED', 1)
        player:delKeyItem(invaderXim.ki.GREEN_RECOMMENDATION_LETTER)
    elseif csid == 104 and option == 1 then
        player:delQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.SNAKE_ON_THE_PLAINS)
        player:delKeyItem(invaderXim.ki.ZONPA_ZIPPAS_ALL_PURPOSE_PUTTY)
        player:setCharVar('SEALED_DOORS', 0)
    elseif csid == 105 and option == 0 then
        player:addQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.SNAKE_ON_THE_PLAINS)
        npcUtil.giveKeyItem(player, invaderXim.ki.ZONPA_ZIPPAS_ALL_PURPOSE_PUTTY)
        player:setCharVar('GREEN_R_LETTER_USED', 1)
        player:delKeyItem(invaderXim.ki.GREEN_RECOMMENDATION_LETTER)
    elseif csid == 106 and option == 0 then
        -- Is first join, so add Sprinter's Shoes and bronze medal
        if player:getCharVar('Campaign_Nation') == 0 then
            if player:getFreeSlotsCount() >= 1 then
                player:setCampaignAllegiance(3)
                player:setCharVar('GREEN_R_LETTER_USED', 0)
                player:addTitle(invaderXim.title.COBRA_UNIT_MERCENARY)
                npcUtil.giveKeyItem(player, invaderXim.ki.BRONZE_RIBBON_OF_SERVICE)
                npcUtil.giveItem(player, invaderXim.item.SPRINTERS_SHOES)
                player:completeQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.SNAKE_ON_THE_PLAINS)
                player:setCharVar('SEALED_DOORS', 0)
            else
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.SPRINTERS_SHOES)
            end
        else
            player:setCampaignAllegiance(3)
            player:setCharVar('GREEN_R_LETTER_USED', 0)
            player:addTitle(invaderXim.title.COBRA_UNIT_MERCENARY)
            player:completeQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.SNAKE_ON_THE_PLAINS)
            player:setCharVar('SEALED_DOORS', 0)
        end
    end
end

return entity
