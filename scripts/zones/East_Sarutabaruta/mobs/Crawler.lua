-----------------------------------
-- Area: East Sarutabaruta
--  Mob: Crawler
-- Note: PH for Spiny Spipi
-----------------------------------
local ID = zones[invaderXim.zone.EAST_SARUTABARUTA]
-----------------------------------
---@type TMobEntity
local entity = {}

local spinySpipiPHTable =
{
    [ID.mob.SPINY_SPIPI - 1] = ID.mob.SPINY_SPIPI,
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 92, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 93, 2, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, spinySpipiPHTable, 10, 2700) -- 45 minute minimum
end

return entity
