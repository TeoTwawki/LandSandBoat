-----------------------------------
-- Area: Bibiki Bay
--  Mob: Shen's Filtrate - Shen Elemental
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob)
    mob:addMod(invaderXim.mod.REGEN, 120)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.STUN)
    mob:addImmunity(invaderXim.immunity.POISON)
    mob:setMobMod(invaderXim.mobMod.SKIP_ALLEGIANCE_CHECK, 1)
end

entity.onMobDeath = function(mob, player, optParams)
    local shen = mob:getZone():queryEntitiesByName('Shen')[1]
    shen:setLocalVar('filtrateDeath', 1)
end

return entity
