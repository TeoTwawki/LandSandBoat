-----------------------------------
-- Area: The Boyahda Tree
--   NM: Voluptuous Vivian
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 20000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 24000)
end

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.NO_MOVE, 0)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.PARALYZE)
end

entity.onMobRoam = function(mob)
    mob:setMobMod(invaderXim.mobMod.NO_MOVE, 0)
end

entity.onMobFight = function(mob, target)
    local spawnPos = mob:getSpawnPos()
    local drawInTable =
    {
        conditions =
        {
            target:checkDistance(spawnPos.x, spawnPos.y, spawnPos.z) > 25,
        },
        position = mob:getPos(),
        wait = 3,
    }
    if drawInTable.conditions[1] then
        mob:setMobMod(invaderXim.mobMod.NO_MOVE, 1)
        utils.drawIn(target, drawInTable)
    else
        mob:setMobMod(invaderXim.mobMod.NO_MOVE, 0)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(invaderXim.title.THE_VIVISECTOR)
end

return entity
