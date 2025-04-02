-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Poroggo Madame
-----------------------------------
local ID = zones[invaderXim.zone.ZHAYOLM_REMNANTS]
-----------------------------------

---@type TMobEntity
local entity = {}

local elementMods =
{
    [1] = { null = invaderXim.mod.FIRE_NULL,  res = invaderXim.mod.FIRE_RES_RANK },
    [2] = { null = invaderXim.mod.EARTH_NULL, res = invaderXim.mod.EARTH_RES_RANK },
    [3] = { null = invaderXim.mod.WATER_NULL, res = invaderXim.mod.WATER_RES_RANK },
    [4] = { null = invaderXim.mod.WIND_NULL,  res = invaderXim.mod.WIND_RES_RANK },
    [5] = { null = invaderXim.mod.ICE_NULL,   res = invaderXim.mod.ICE_RES_RANK },
    [6] = { null = invaderXim.mod.LTNG_NULL,  res = invaderXim.mod.THUNDER_RES_RANK },
    [7] = { null = invaderXim.mod.LIGHT_NULL, res = invaderXim.mod.LIGHT_RES_RANK },
    [8] = { null = invaderXim.mod.DARK_NULL,  res = invaderXim.mod.DARK_RES_RANK },
}

entity.onMobInitialize = function(mob)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:setMobMod(invaderXim.mobMod.DETECTION, invaderXim.detects.SIGHT)
end

entity.onMobSpawn = function(mob)
    local instance = mob:getInstance()

    if instance then
        local enteringDay = instance:getLocalVar('dayElement')
        -- nulls out dmg taken on the particular day
        -- also prevents enfeebs
        mob:addMod(elementMods[enteringDay].null, 100)
        mob:addMod(elementMods[enteringDay].res, -3)
        mob:addMod(invaderXim.mod.SPELLINTERRUPT, -20)
        if enteringDay == invaderXim.day.DARKSDAY then -- takes double dmg on Darksday
            mob:addMod(invaderXim.mod.UDMGPHYS, 100)
            mob:addMod(invaderXim.mod.UDMGBREATH, 100)
            mob:addMod(invaderXim.mod.UDMGMAGIC, 1000)
            mob:addMod(invaderXim.mod.UDMGRANGE, 100)
        end

        -- first floor madames are bigger
        if instance:getStage() == 1 then
            --mob:setEntitySize(invaderXim.entitySize.LARGE)
            mob:setMobMod(invaderXim.mobMod.MAGIC_COOL, 40)
            mob:setDelay(200)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        local instance = mob:getInstance()

        if instance then
            instance:setLocalVar('killedNMs', instance:getLocalVar('killedNMs') + 1)

            if instance:getStage() == 2 then
                invaderXim.salvage.handleSocketCells(mob, player)
            elseif mob:getID() == ID.mob.POROGGO_MADAME[4] then
                mob:setDropID(0)
                invaderXim.salvage.spawnTempChest(mob, { rate = 1000 })
            end
        end
    end
end

return entity
