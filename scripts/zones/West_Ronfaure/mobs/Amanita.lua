-----------------------------------
-- Area: West Ronfaure
--   NM: Amanita
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.REGAIN, 100)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 149)
end

return entity
