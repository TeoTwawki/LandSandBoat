-----------------------------------
-- Area: Sauromugue Champaign
--   NM: Deadly Dodo
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 272)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 580 })
end

return entity
