-----------------------------------
-- Area: The Boyahda Tree
--   NM: Agas
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobDeath = function(mob, player, optParams)
    if
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SEARCHING_FOR_THE_RIGHT_WORDS) == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.MOONDROP)
    then
        player:setCharVar('Searching_AgasKilled', 1)
    end
end

return entity
