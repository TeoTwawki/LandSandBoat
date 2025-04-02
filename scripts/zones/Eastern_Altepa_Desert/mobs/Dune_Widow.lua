-----------------------------------
-- Area: Eastern Altepa Desert (114)
--   NM: Dune Widow
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 408)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 712 })
end

return entity
