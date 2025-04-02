-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Namtar
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 369)
    invaderXim.regime.checkRegime(player, mob, 805, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 366 })
end

return entity
