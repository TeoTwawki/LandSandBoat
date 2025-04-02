-----------------------------------
-- Area: Gusgen Mines
--  Mob: Fly Agaric
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 680, 1, invaderXim.regime.type.GROUNDS)
end

return entity
