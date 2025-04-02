-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Mourioche
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 720, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 721, 1, invaderXim.regime.type.GROUNDS)
end

return entity
