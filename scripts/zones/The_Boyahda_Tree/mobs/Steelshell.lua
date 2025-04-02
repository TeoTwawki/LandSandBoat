-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Steelshell
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 723, 2, invaderXim.regime.type.GROUNDS)
end

return entity
