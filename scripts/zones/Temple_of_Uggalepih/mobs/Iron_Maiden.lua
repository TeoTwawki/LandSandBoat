-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Iron Maiden
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 795, 2, invaderXim.regime.type.GROUNDS)
end

return entity
