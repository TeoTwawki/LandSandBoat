-----------------------------------
-- Area: Sea Serpent Grotto
--  NPC: ??? Used for Norg quest "It's not your vault"
-- !pos -173 26 252 176
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.ITS_NOT_YOUR_VAULT) == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.SEALED_IRON_BOX)
    then
        npcUtil.giveKeyItem(player, invaderXim.ki.SEALED_IRON_BOX)
    end
end

return entity
