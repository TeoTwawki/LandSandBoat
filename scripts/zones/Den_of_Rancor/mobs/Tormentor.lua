-----------------------------------
-- Area: Den of Rancor
--  Mob: Tormentor
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 802, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 803, 1, invaderXim.regime.type.GROUNDS)
end

return entity
