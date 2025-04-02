-----------------------------------
-- Area: Horlais Peak
--  Mob: Chlevnik
-- KSNM99
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.SILENCE)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.STUN, { chance = 20, duration = math.random(5, 10) })
end

entity.onSpellPrecast = function(mob, spell)
    if spell:getID() == 218 then
        spell:setAoE(invaderXim.magic.aoe.RADIAL)
        spell:setFlag(invaderXim.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280)
        spell:setMPCost(1)
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
