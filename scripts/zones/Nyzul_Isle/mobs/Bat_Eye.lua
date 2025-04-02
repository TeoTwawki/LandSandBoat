-----------------------------------
--  MOB: Bat Eye
-- Area: Nyzul Isle
-- Info: NM
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addMobMod(invaderXim.mobMod.CHECK_AS_NM, 1)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.eliminateAllKill(mob)
    end
end

return entity
