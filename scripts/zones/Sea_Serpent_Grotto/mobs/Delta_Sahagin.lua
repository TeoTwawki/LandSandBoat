-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Delta Sahagin
-- Note: PH for Zuug the Shoreleaper
-----------------------------------
local ID = zones[invaderXim.zone.SEA_SERPENT_GROTTO]
-----------------------------------
---@type TMobEntity
local entity = {}

local zuugPHTable =
{
    [ID.mob.ZUUG_THE_SHORELEAPER - 4] = ID.mob.ZUUG_THE_SHORELEAPER,
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 806, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 807, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 808, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, zuugPHTable, 10, 7200) -- 2 hours
end

return entity
