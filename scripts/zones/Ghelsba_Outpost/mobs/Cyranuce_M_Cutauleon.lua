-----------------------------------
-- Area: Ghelsba Outpost
--  Mob: Cyranuce M Cutauleon
-- Involved in Quest: The Holy Crest
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
end

entity.onMobWeaponSkillPrepare = function(mob, target)
    if mob:getHPP() <= 15 then
        return invaderXim.mobSkill.CHAOS_BREATH
    end
end

return entity
