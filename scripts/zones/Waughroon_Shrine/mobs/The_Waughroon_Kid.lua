-----------------------------------
-- Area: Waughroon Shrine
--  Mob: The Waughroon Kid
-- BCNM: The Final Bout
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(invaderXim.mod.REGAIN, 100)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
