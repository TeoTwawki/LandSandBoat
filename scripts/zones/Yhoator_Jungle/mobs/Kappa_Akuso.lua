-----------------------------------
-- Area: Yhoator Jungle
--   NM: Kappa Akuso
-- Involved in Quest: True will
-----------------------------------
local ID = zones[invaderXim.zone.YHOATOR_JUNGLE]
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, optParams)
    if player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRUE_WILL) == invaderXim.questStatus.QUEST_ACCEPTED then
        local lastNM = not (GetMobByID(ID.mob.KAPPA_BONZE):isAlive() or GetMobByID(ID.mob.KAPPA_BIWA):isAlive())
        if lastNM then -- Only count the kill for the last alive/spawned NM dying
            player:incrementCharVar('trueWillKilledNM', 1)
        end
    end
end

return entity
