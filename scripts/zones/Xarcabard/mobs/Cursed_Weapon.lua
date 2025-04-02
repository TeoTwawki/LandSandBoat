-----------------------------------
-- Area: Xarcabard
--  Mob: Cursed Weapon
-- Note: PH for Barbaric Weapon
-----------------------------------
local ID = zones[invaderXim.zone.XARCABARD]
-----------------------------------
---@type TMobEntity
local entity = {}

local barbaricPHTable =
{
    [ID.mob.BARBARIC_WEAPON - 1] = ID.mob.BARBARIC_WEAPON,
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 52, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 53, 3, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, barbaricPHTable, 10, 7200) -- 2 hours
end

return entity
