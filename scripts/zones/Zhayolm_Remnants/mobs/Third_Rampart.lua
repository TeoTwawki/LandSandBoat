-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Third Rampart
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
    if instance and instance:getProgress() > 1 then
        local mobID = mob:getID()

        DespawnMob(mobID - 1, instance)
        DespawnMob(mobID - 2, instance)
        DespawnMob(mobID + 1, instance)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        local instance    = mob:getInstance()

        if instance then
            local enteringDay = instance:getLocalVar('dayElement') - 1

            if enteringDay == invaderXim.day.ICEDAY or enteringDay == invaderXim.day.LIGHTNINGDAY then
                instance:setLocalVar('stageComplete', 4)
            else
                instance:setLocalVar('notComplete', 1)
            end
        end
    end
end

return entity
