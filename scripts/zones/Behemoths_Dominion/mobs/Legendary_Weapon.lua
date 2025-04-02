-----------------------------------
-- Area: Behemoths Dominion
--   NM: Legendary Weapon
-----------------------------------
local ID = zones[invaderXim.zone.BEHEMOTHS_DOMINION]
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobDisengage = function(mob)
    DespawnMob(mob:getID(), 120)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 102, 2, invaderXim.regime.type.FIELDS)
    if optParams.isKiller and GetMobByID(ID.mob.ANCIENT_WEAPON):isDead() then
        GetNPCByID(ID.npc.CERMET_HEADSTONE):setLocalVar('cooldown', os.time() + 900)
    end
end

return entity
