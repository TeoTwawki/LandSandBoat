-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Pudding
-- Involved in Eco Warrior (Bastok)
-----------------------------------
local ID = zones[invaderXim.zone.GUSGEN_MINES]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.SLOW)
end

entity.onMobDeath = function(mob, player, optParams)
    if
        player:getCharVar('EcoStatus') == 101 and
        player:hasStatusEffect(invaderXim.effect.LEVEL_RESTRICTION)
    then
        local bothDead = true
        for i = ID.mob.PUDDING_OFFSET, ID.mob.PUDDING_OFFSET + 1 do
            if i ~= mob:getID() and GetMobByID(i):isAlive() then
                bothDead = false
            end
        end

        if bothDead then
            player:setCharVar('EcoStatus', 102)
        end
    end
end

return entity
