-----------------------------------
-- Area: Qufim Island
--  Mob: Giant Hunter
-- Note: PH for Slippery Sucker
-----------------------------------
local ID = zones[invaderXim.zone.QUFIM_ISLAND]
-----------------------------------
---@type TMobEntity
local entity = {}

local slipperyPHTable =
{
    [ID.mob.SLIPPERY_SUCKER - 9] = ID.mob.SLIPPERY_SUCKER, -- hunter
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 44, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 45, 2, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, slipperyPHTable, 10, 600) -- 10 minutes
end

return entity
