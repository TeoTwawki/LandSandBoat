-----------------------------------
--  MOB: Sewer Syrup
-- Area: Nyzul Isle
-- Info: NM
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 4000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 19000)
    mob:setMobMod(invaderXim.mobMod.MUG_GIL, 3500)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.eliminateAllKill(mob)
    end
end

return entity
