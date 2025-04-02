-----------------------------------
-- Area: Ghelsba Outpost
--  Mob: Furies
-- BCNM: Wings of Fury
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.SOUND_RANGE, 15)
    mob:setMobMod(invaderXim.mobMod.CHARMABLE, 1)
end

return entity
