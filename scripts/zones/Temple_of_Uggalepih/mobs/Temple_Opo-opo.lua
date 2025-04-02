-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Temple Opo-opo
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 792, 2, invaderXim.regime.type.GROUNDS)
end

return entity
