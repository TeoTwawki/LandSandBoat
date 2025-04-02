-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Awd Goggie
-- !pos -253.026 -1.867 253.055 197
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 120)
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(invaderXim.title.BOGEYDOWNER)
end

return entity
