-----------------------------------
-- Area: Ordelle's Caves
--   NM: Necroplasm
-- Involved in Eco Warrior (San d'Oria)
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.PARALYZE)
end

entity.onMobDeath = function(mob, player, optParams)
    if
        player:getCharVar('EcoStatus') == 1 and
        player:hasStatusEffect(invaderXim.effect.LEVEL_RESTRICTION)
    then
        player:setCharVar('EcoStatus', 2)
    end
end

return entity
