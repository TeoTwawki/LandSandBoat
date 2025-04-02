-----------------------------------
-- Area: Balga's Dais
--  Mob: Bitoso
-- BCNM: Creeping Doom
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:setMobMod(invaderXim.mobMod.HP_HEAL_CHANCE, 90)
    mob:setMobMod(invaderXim.mobMod.HEAL_CHANCE, 100)
    mob:setMod(invaderXim.mod.REGEN, 0)
end

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.MAGIC_COOL, 20)
    mob:setMobMod(invaderXim.mobMod.SOUND_RANGE, 13)
end

entity.onMobFight = function(mob, target)
end

entity.onMagicHit = function(caster, target, spell)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
