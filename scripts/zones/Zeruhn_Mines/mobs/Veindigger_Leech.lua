-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Veindigger Leech
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 630, 2, invaderXim.regime.type.GROUNDS)
end

return entity
