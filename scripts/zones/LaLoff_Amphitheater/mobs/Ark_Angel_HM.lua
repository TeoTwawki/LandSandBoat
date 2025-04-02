-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel HM
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addMod(invaderXim.mod.REGAIN, 50)
end

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        between = 30,
        specials =
        {
            { id = invaderXim.jsa.MIGHTY_STRIKES },
            { id = invaderXim.jsa.MIJIN_GAKURE },
        },
    })
end

entity.onMobEngage = function(mob, target)
    local mobid = mob:getID()

    for member = mobid, mobid + 7 do
        local m = GetMobByID(member)
        if m and m:getCurrentAction() == invaderXim.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
