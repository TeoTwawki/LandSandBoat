-----------------------------------
-- Area: Fort_Karugo-Narugo_[S]
--  NPC: Pecca-Pocca
-- Involved In Quest: REQUIEM_FOR_THE_DEPARTED
-- !pos -163 -68 -155 96
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.REQUIEM_FOR_THE_DEPARTED) == invaderXim.questStatus.QUEST_ACCEPTED then
        if player:hasKeyItem(invaderXim.ki.SHEAF_OF_HANDMADE_INCENSE) then
            player:startEvent(233) -- standard dialogue after receiving KI
        else
            player:startEvent(234) -- to receive KI
        end
    else
        player:startEvent(233)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 234 then
        npcUtil.giveKeyItem(player, invaderXim.ki.SHEAF_OF_HANDMADE_INCENSE)
    end
end

return entity
