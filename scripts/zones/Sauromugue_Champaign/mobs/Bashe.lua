-----------------------------------
-- Area: Sauromugue Champaign
--   NM: Bashe
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 273)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 284 })
end

return entity
