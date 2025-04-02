-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Tonberry Harrier
-- Note: PH for Sozu Terberry
-----------------------------------
local ID = zones[invaderXim.zone.TEMPLE_OF_UGGALEPIH]
mixins = { require('scripts/mixins/families/tonberry') }
-----------------------------------
---@type TMobEntity
local entity = {}

local terberryPHTable =
{
    [ID.mob.SOZU_TERBERRY - 3] = ID.mob.SOZU_TERBERRY, -- -122 0.028 -13
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 790, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 791, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 792, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 793, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 794, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 795, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, terberryPHTable, 10, 3600) -- 1 hour
end

return entity
