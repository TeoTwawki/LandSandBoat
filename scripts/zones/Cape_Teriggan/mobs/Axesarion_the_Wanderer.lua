-----------------------------------
-- Area: Cape Teriggan
--   NM: Axesarion the Wanderer
-----------------------------------
local ID = zones[invaderXim.zone.CAPE_TERIGGAN]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.STUN)
end

entity.onMobDisengage = function(mob)
    DespawnMob(mob:getID(), 120)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller then
        GetNPCByID(ID.npc.CERMET_HEADSTONE):setLocalVar('cooldown', os.time() + 900)
    end
end

return entity
