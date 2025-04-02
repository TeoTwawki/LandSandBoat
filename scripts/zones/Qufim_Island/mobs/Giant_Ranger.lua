-----------------------------------
-- Area: Qufim Island
--  Mob: Giant Ranger
-- Note: PH for Slippery Sucker
-----------------------------------
local ID = zones[invaderXim.zone.QUFIM_ISLAND]
-----------------------------------
---@type TMobEntity
local entity = {}

local slipperyPHTable =
{
    [ID.mob.SLIPPERY_SUCKER - 13] = ID.mob.SLIPPERY_SUCKER, -- range
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 44, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 45, 2, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, slipperyPHTable, 10, 600) -- 10 minutes
end

return entity
