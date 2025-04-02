-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Bigclaw
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 807, 2, invaderXim.regime.type.GROUNDS)
end

return entity
