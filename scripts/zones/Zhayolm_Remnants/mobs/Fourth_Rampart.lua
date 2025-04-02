-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Fourth Rampart
-----------------------------------
mixins = { require('scripts/mixins/families/rampart') }
-----------------------------------

---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.NO_AGGRO, 1)
    mob:setMobMod(invaderXim.mobMod.ROAM_DISTANCE, 0)
    mob:setMobMod(invaderXim.mobMod.ROAM_TURNS, 0)
    mob:setLocalVar('spawnCount', 1)
    mob:setLocalVar('spawnOffset', 3)
end

entity.onMobEngage = function(mob, target)
    local instance = mob:getInstance()

    if instance then
        if instance:getProgress() > 1 then
            local mobID = mob:getID()

            DespawnMob(mobID - 1, instance)
            DespawnMob(mobID - 2, instance)
            DespawnMob(mobID - 3, instance)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        local instance    = mob:getInstance()

        if instance then
            local enteringDay = instance:getLocalVar('dayElement') - 1

            if enteringDay == invaderXim.day.LIGHTSDAY or enteringDay == invaderXim.day.DARKSDAY then
                instance:setLocalVar('stageComplete', 4)
            else
                instance:setLocalVar('notComplete', 1)
            end
        end
    end
end

return entity
