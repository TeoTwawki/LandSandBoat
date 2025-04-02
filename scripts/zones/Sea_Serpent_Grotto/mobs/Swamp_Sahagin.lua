-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Swamp Sahagin
-- Note: PH for Pahh the Gullcaller
-----------------------------------
local ID = zones[invaderXim.zone.SEA_SERPENT_GROTTO]
-----------------------------------
---@type TMobEntity
local entity = {}

local pahhPHTable =
{
    [ID.mob.PAHH_THE_GULLCALLER - 5] = ID.mob.PAHH_THE_GULLCALLER, -- -13.532 21.301 -20.861
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 806, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 807, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 808, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, pahhPHTable, 10, 7200) -- 2 hours
end

return entity
