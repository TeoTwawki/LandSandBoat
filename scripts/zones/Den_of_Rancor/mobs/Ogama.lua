-----------------------------------
-- Area: Den of Rancor
--   NM: Ogama
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobFight = function(mob, target)
    local mobHPP = mob:getHPP()
    local appliedDmgBoost = mob:getLocalVar('appliedDmgBoost')

    if
        mobHPP <= 50 and
        appliedDmgBoost == 0
    then
        mob:addMod(invaderXim.mod.MAIN_DMG_RATING, mob:getMainLvl() + 2)
        mob:setLocalVar('appliedDmgBoost', 1)
    elseif
        mobHPP > 50 and
        appliedDmgBoost == 1
    then
        mob:delMod(invaderXim.mod.MAIN_DMG_RATING, mob:getMainLvl() + 2)
        mob:setLocalVar('appliedDmgBoost', 0)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 398)
end

return entity
