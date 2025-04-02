-----------------------------------
-- Area: Den of Rancor
--  Mob: Demonic Pugil
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 801, 1, invaderXim.regime.type.GROUNDS)
end

return entity
