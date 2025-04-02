-----------------------------------
-- Area: Vunkerl_Inlet_[S]
--  NPC: qm6 (???)
-- Involved In Quest: EVIL_AT_THE_INLET
-- !pos -636 -51 -454 83
-----------------------------------
local ID = zones[invaderXim.zone.VUNKERL_INLET_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.EVIL_AT_THE_INLET) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(invaderXim.ki.EVIL_WARDING_SEAL)
    then
        player:startEvent(112)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 112 then
        player:delKeyItem(invaderXim.ki.EVIL_WARDING_SEAL)
    end
end

return entity
