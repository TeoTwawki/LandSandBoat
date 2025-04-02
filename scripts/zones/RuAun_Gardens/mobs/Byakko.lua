-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Byakko
-----------------------------------
local ID = zones[invaderXim.zone.RUAUN_GARDENS]
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    GetNPCByID(ID.npc.PORTAL_OFFSET + 8):setAnimation(invaderXim.anim.CLOSE_DOOR)
end

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 1500)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 30000)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENLIGHT)
end

entity.onMobDeath = function(mob, player, optParams)
    player:showText(mob, ID.text.SKY_GOD_OFFSET + 12)
    GetNPCByID(ID.npc.PORTAL_OFFSET + 8):setAnimation(invaderXim.anim.OPEN_DOOR)
end

entity.onMobDespawn = function(mob)
    GetNPCByID(ID.npc.PORTAL_OFFSET + 8):setAnimation(invaderXim.anim.OPEN_DOOR)
end

return entity
