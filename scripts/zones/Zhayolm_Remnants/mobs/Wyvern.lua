-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Wyvern
-----------------------------------
local ID = zones[invaderXim.zone.ZHAYOLM_REMNANTS]
-----------------------------------

---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setDelay(480)
    mob:setMod(invaderXim.mod.ATT, 100)
    mob:setMod(invaderXim.mod.MAIN_DMG_RATING, -15)
end

entity.onMobDeath = function(mob, player, optParams)
    local instance = mob:getInstance()

    if instance then
        if optParams.isKiller or optParams.noKiller then
            if invaderXim.salvage.groupKilled(instance, utils.slice(ID.mob.WYVERN, 9, 16)) then
                local id        = ID.mob.MAMOOL_JA_SPEARMAN[1]
                local stageBoss = GetMobByID(id, instance)

                if stageBoss and stageBoss:getLocalVar('spawned') == 0 then
                    SpawnMob(id, instance)
                    stageBoss:setLocalVar('spawned', 1)
                end
            end

            if invaderXim.salvage.groupKilled(instance, utils.slice(ID.mob.WYVERN, 1, 8)) then
                local id        = ID.mob.MAMOOL_JA_BOUNDER[1]
                local stageBoss = GetMobByID(id, instance)

                if stageBoss and stageBoss:getLocalVar('spawned') == 0 then
                    SpawnMob(id, instance)
                    stageBoss:setLocalVar('spawned', 1)
                end
            end
        end
    end
end

return entity
