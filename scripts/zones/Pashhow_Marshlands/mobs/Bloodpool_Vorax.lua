-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Bloodpool Vorax
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 211)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 216 })
end

return entity
