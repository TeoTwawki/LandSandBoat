-----------------------------------
-- Area: Qufim Island
--  Mob: Kraken
-----------------------------------
local ID = zones[invaderXim.zone.QUFIM_ISLAND]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    if mob:getID() == ID.mob.KRAKEN_NM then
        mob:setMobMod(invaderXim.mobMod.ROAM_DISTANCE, 5)
        mob:setMobMod(invaderXim.mobMod.ROAM_TURNS, 1)
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
