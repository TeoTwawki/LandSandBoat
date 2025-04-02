-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Ni'Zho Bladebender
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 60, 1, invaderXim.regime.type.FIELDS)
    invaderXim.hunts.checkHunt(mob, player, 214)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 893 })
end

return entity
