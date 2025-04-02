-----------------------------------
-- Area: Western Adoulin (256)
--  NPC: Sylvie
-- Starts Dances with Luopans
-- !pos 78.094 32.000 135.725
-----------------------------------
local ID = zones[invaderXim.zone.WESTERN_ADOULIN]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- DANCES WITH LUOPANS
    if player:getQuestStatus(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.DANCES_WITH_LUOPANS) == invaderXim.questStatus.QUEST_ACCEPTED then
        if
            player:hasKeyItem(invaderXim.ki.FISTFUL_OF_HOMELAND_SOIL) and
            npcUtil.tradeHas(trade, invaderXim.item.PETRIFIED_LOG)
        then
            player:startEvent(34)
        end
    end
end

entity.onTrigger = function(player, npc)
    -- Buying a replacement Matre Bell on Geomancer
    if
        player:getLocalVar('Sylvie_Need_Zone') == 0 and
        player:getMainJob() == invaderXim.job.GEO and
        not player:hasItem(invaderXim.item.MATRE_BELL)
    then
        player:setLocalVar('Sylvie_Need_Zone', 1)
        player:startEvent(37)
        return
    end

    -- DANCES WITH LUOPANS
    local dwlQuestStatus = player:getQuestStatus(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.DANCES_WITH_LUOPANS)
    if dwlQuestStatus == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(39)
    elseif player:getCharVar('GEO_DWL_Luopan') == 1 then
        player:startEvent(36)
    elseif
        dwlQuestStatus == invaderXim.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(invaderXim.ki.LUOPAN)
    then
        player:startEvent(35)
    elseif dwlQuestStatus == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(33)
    elseif player:getCharVar('GEO_DWL_Triggered') == 1 then
        player:startEvent(32)
    elseif
        dwlQuestStatus == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getMainLvl() >= invaderXim.settings.main.ADVANCED_JOB_LEVEL
    then
        player:startEvent(31)
    else
        player:startEvent(38)  -- Standard dialog
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    -- Buying a replacement Matre Bell on Geomancer
    if csid == 37 and (option == 1 or option == 2) then
        local eventUpdateParam = 0  -- 0 = can't afford, 1 = success, 2 = full inventory
        if player:getFreeSlotsCount() < 1 then
            eventUpdateParam = 2
        elseif
            (option == 1 and player:getGil() >= 300000) or
            (option == 2 and player:getCurrency('bayld') >= 150000)
        then
            player:setLocalVar('Sylvie_Matre_Bell', option)
            eventUpdateParam = 1
        end

        player:updateEvent(0, 0, 0, 0, 0, 0, 0, eventUpdateParam)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    -- DANCES WITH LUOPANS
    if csid == 31 or csid == 32 then
        if option == 0 then
            player:setCharVar('GEO_DWL_Triggered', 1)
        elseif option == 1 then
            player:setCharVar('GEO_DWL_Triggered', 0)
            player:addQuest(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.DANCES_WITH_LUOPANS)
        end
    elseif csid == 34 then
        player:confirmTrade()
        player:delKeyItem(invaderXim.ki.FISTFUL_OF_HOMELAND_SOIL)
        npcUtil.giveKeyItem(player, invaderXim.ki.LUOPAN)
    elseif csid == 36 then
        if npcUtil.giveItem(player, { invaderXim.item.PLATE_OF_INDI_POISON, invaderXim.item.MATRE_BELL }) then -- 'plate of Indi-Poison' and 'Matre Bell'
            player:unlockJob(invaderXim.job.GEO)
            player:messageSpecial(ID.text.YOU_CAN_NOW_BECOME, 0)  -- You can now become a geomancer!
            npcUtil.giveKeyItem(player, invaderXim.ki.JOB_GESTURE_GEOMANCER)
            player:setCharVar('GEO_DWL_Luopan', 0)
            player:completeQuest(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.DANCES_WITH_LUOPANS)
        end
    end

    -- Buying replacement Matre Bell on Geomancer
    if csid == 37 and option == 1 then
        local purchaseOption = player:getLocalVar('Sylvie_Matre_Bell')
        if
            purchaseOption ~= 0 and
            npcUtil.giveItem(player, { invaderXim.item.MATRE_BELL })
        then
            player:setLocalVar('Sylvie_Matre_Bell', 0)
            if purchaseOption == 1 then  -- gil
                player:setGil(player:getGil() - 300000)
            elseif purchaseOption == 2 then  -- bayld
                player:setCurrency('bayld', player:getCurrency('bayld') - 150000)
            end
        end
    end
end

return entity
