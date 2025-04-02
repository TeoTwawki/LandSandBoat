-----------------------------------
-- Area: Gusgen Mines
--  Mob: Mauthe Doog
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 682, 3, invaderXim.regime.type.GROUNDS)
end

return entity
