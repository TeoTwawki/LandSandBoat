-----------------------------------
-- Area: Konschtat Highlands
--  NPC: Cavernous Maw
-- !pos 96.344, -69.080, -580.008 108
-- Teleports Players to Abyssea - Konschtat
-----------------------------------
local ID = zones[invaderXim.zone.KONSCHTAT_HIGHLANDS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if invaderXim.settings.main.ENABLE_ABYSSEA == 1 and player:getMainLvl() >= 30 then
        if
            invaderXim.abyssea.getHeldTraverserStones(player) >= 1 and
            player:getQuestStatus(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DAWN_OF_DEATH) == invaderXim.questStatus.QUEST_ACCEPTED and
            player:getQuestStatus(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.TO_PASTE_A_PEISTE) == invaderXim.questStatus.QUEST_AVAILABLE
        then
            player:startEvent(0)
        elseif invaderXim.abyssea.canEnterAbyssea(player) then
            player:startEvent(107, 0, 1) -- No param = no entry.
        end
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 0 then
        player:addQuest(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.TO_PASTE_A_PEISTE)
    elseif csid == 1 then
        -- Killed Kukulkan
    elseif csid == 107 and option == 1 then
        player:setPos(153, -72, -840, 140, 15)
    end
end

return entity
