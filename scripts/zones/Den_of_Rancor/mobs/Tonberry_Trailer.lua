-----------------------------------
-- Area: Den of Rancor
--  Mob: Tonberry Trailer
-- Note: PH for Celeste-eyed Tozberry
-----------------------------------
mixins = { require('scripts/mixins/families/tonberry') }
local ID = zones[invaderXim.zone.DEN_OF_RANCOR]
-----------------------------------
---@type TMobEntity
local entity = {}

local celestePHTable =
{
    [ID.mob.CELESTE_EYED_TOZBERRY - 2] = ID.mob.CELESTE_EYED_TOZBERRY,
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 798, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 799, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 800, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, celestePHTable, 10, 7200) -- 2 hours
end

return entity
