-----------------------------------
-- Area: South Gustaberg
--  NPC: Cavernous Maw
-- !pos 340 -0.5 -680
-- Teleports Players to Abyssea - Altepa
-----------------------------------
local ID = zones[invaderXim.zone.SOUTH_GUSTABERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if invaderXim.settings.main.ENABLE_ABYSSEA == 1 and player:getMainLvl() >= 30 then
        if
            player:getQuestStatus(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DAWN_OF_DEATH) == invaderXim.questStatus.QUEST_ACCEPTED and
            player:getQuestStatus(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.A_BEAKED_BLUSTERER) == invaderXim.questStatus.QUEST_AVAILABLE and
            invaderXim.abyssea.getHeldTraverserStones(player) >= 1
        then
            player:startEvent(0)
        else
            player:startEvent(914, 0, 1) -- No param = no entry.
        end
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 0 then
        player:addQuest(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.A_BEAKED_BLUSTERER)
    elseif csid == 1 then
        -- Killed Bennu
    elseif csid == 914 and option == 1 then
        player:setPos(432, 0, 321, 125, 218)
    end
end

return entity
