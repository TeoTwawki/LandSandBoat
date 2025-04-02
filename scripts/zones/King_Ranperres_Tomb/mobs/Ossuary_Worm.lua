-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Ossuary Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 636, 1, invaderXim.regime.type.GROUNDS)
end

return entity
