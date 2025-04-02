-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Bull Bugard
-----------------------------------
local ID = zones[invaderXim.zone.ZHAYOLM_REMNANTS]
-----------------------------------

---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setDelay(750)
    mob:setMod(invaderXim.mod.ATT, 100)
    mob:setMod(invaderXim.mod.MAIN_DMG_RATING, -15)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        local instance = mob:getInstance()

        if invaderXim.salvage.groupKilled(instance, ID.mob.BULL_BUGARD) then
            SpawnMob(ID.mob.POROGGO_GENT[4], instance):setDropID(3377)
        end
    end
end

return entity
