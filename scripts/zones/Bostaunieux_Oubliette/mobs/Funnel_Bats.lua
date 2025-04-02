-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Funnel Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 611, 1, invaderXim.regime.type.GROUNDS)
end

return entity
