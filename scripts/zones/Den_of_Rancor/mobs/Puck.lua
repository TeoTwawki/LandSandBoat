-----------------------------------
-- Area: Den of Rancor
--  Mob: Puck
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 802, 2, invaderXim.regime.type.GROUNDS)
end

return entity
