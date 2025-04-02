-----------------------------------
-- Area: Promyvion - Vahzl
--   NM: Provoker
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addMod(invaderXim.mod.ACC, 50)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onMobFight = function(mob, target)
    local changeTime = mob:getLocalVar('changeTime')
    local element    = mob:getLocalVar('element')

    if changeTime == 0 then
        mob:setLocalVar('changeTime', math.random(2, 3) * 15)
        return
    end

    if mob:getBattleTime() >= changeTime then
        local newElement = element
        while newElement == element do
            newElement = math.random(invaderXim.element.FIRE, invaderXim.element.DARK)
        end

        if element ~= 0 then
            mob:delMod(invaderXim.combat.element.getElementalAbsorptionModifier(element), 100)
        end

        mob:useMobAbility(624)
        mob:addMod(invaderXim.combat.element.getElementalAbsorptionModifier(newElement), 100)
        mob:setLocalVar('changeTime', mob:getBattleTime() + math.random(2, 3) * 15)
        mob:setLocalVar('element', newElement)
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    local element = mob:getLocalVar('element')
    if element > 0 then
        return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENFIRE + element - 1, { chance = 1000 })
    else
        return 0, 0, 0 -- Just in case its somehow not got a variable set
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
