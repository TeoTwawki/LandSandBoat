-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Torama
-- Note: PH for Flauros
-----------------------------------
local ID = zones[invaderXim.zone.TEMPLE_OF_UGGALEPIH]
-----------------------------------
---@type TMobEntity
local entity = {}

local flaurosPHTable =
{
    [ID.mob.FLAUROS + 3] = ID.mob.FLAUROS, -- 259 0.03 80
}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, flaurosPHTable, 10, 3600) -- 1 hour
end

return entity
