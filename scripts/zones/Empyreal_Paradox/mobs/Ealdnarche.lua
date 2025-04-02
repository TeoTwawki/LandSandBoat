-----------------------------------
-- Area: Emperial Paradox
--  Mob: Eald'narche
-- Apocalypse Nigh Final Fight
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.TELEPORT_CD, 30)
    mob:setMobMod(invaderXim.mobMod.TELEPORT_START, 988)
    mob:setMobMod(invaderXim.mobMod.TELEPORT_END, 989)
    mob:setMobMod(invaderXim.mobMod.TELEPORT_TYPE, 1)
    mob:setMod(invaderXim.mod.MDEF, 50)
end

entity.onMobSpawn = function(mob)
    mob:addMod(invaderXim.mod.EVA, 50)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
