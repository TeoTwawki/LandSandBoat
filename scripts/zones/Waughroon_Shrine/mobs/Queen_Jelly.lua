-----------------------------------
-- Area: Waughroon Shrine
-- Mob: Queen Jelly
-- BCNM: Royal Jelly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addMod(invaderXim.mod.REGAIN, 200)
    mob:addMod(invaderXim.mod.ACC, 100)
    mob:addMod(invaderXim.mod.FASTCAST, 30)
    mob:setMobMod(invaderXim.mobMod.MAGIC_COOL, 15)
    mob:setMod(invaderXim.mod.SPELLINTERRUPT, 25)
end

entity.onMobSpawn = function(mob)
    mob:setBaseSpeed(60)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
