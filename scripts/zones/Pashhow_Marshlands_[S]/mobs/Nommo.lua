-----------------------------------
-- Area: Pashhow Marshlands [S]
--   NM: Nommo
-- https://www.bg-wiki.com/ffxi/Nommo
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENAMNESIA, { chance = 10, duration = 30 })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 509)
end

return entity
