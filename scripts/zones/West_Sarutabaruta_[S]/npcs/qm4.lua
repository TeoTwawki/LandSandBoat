-----------------------------------
-- Area: West Sarutabaruta [S]
--  NPC: qm4
-- Note: Involved in quest "The Tigress Stirs"
-- !pos 150 -39 331 95
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STIRS) == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.SMALL_STARFRUIT)
    then
        npcUtil.giveKeyItem(player, invaderXim.ki.SMALL_STARFRUIT)
    end
end

return entity
