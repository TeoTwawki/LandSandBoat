-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Marsh Sahagin
-- Note: PH for Worr the Clawfisted and Voll the Sharkfinned
-----------------------------------
local ID = zones[invaderXim.zone.SEA_SERPENT_GROTTO]
-----------------------------------
---@type TMobEntity
local entity = {}

local worrPHTable =
{
    [ID.mob.WORR_THE_CLAWFISTED - 3] = ID.mob.WORR_THE_CLAWFISTED, -- -308.649 17.344 -52.316
}

local vollPHTable =
{
    [ID.mob.VOLL_THE_SHARKFINNED - 2] = ID.mob.VOLL_THE_SHARKFINNED, -- -337.035 16.950 -106.841
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 806, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 807, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 808, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, worrPHTable, 10, 7200) -- 2 hours
    invaderXim.mob.phOnDespawn(mob, vollPHTable, 10, 7200) -- 2 hours
end

return entity
