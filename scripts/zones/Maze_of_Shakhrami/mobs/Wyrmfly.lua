-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Wyrmfly
-- Involved in Eco Warrior (Windurst)
-----------------------------------
local ID = zones[invaderXim.zone.MAZE_OF_SHAKHRAMI]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.POISON)
end

entity.onMobDeath = function(mob, player, optParams)
    if
        player:getCharVar('EcoStatus') == 201 and
        player:hasStatusEffect(invaderXim.effect.LEVEL_RESTRICTION)
    then
        local allFliesDead = true
        for i = ID.mob.WYRMFLY_OFFSET, ID.mob.WYRMFLY_OFFSET + 2 do
            if i ~= mob:getID() and GetMobByID(i):isAlive() then
                allFliesDead = false
            end
        end

        if allFliesDead then
            player:setCharVar('EcoStatus', 202)
        end
    end
end

return entity
