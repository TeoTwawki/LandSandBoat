require('scripts/globals/abyssea/lights')
require('scripts/globals/abyssea')
require('scripts/globals/mixins')

g_mixins = g_mixins or {}

-----------------------------------
-- Drops Lights
-----------------------------------
g_mixins.drop_lights = function(mob)
    mob:addListener('SPAWN', 'ABYSSEA_SPAWN', function(mobArg)
        invaderXim.abyssea.AddDeathListeners(mobArg)
        mobArg:setDeathType(invaderXim.abyssea.deathType.NONE)
    end)

    invaderXim.abyssea.AddDeathListeners(mob)
end

return g_mixins.drop_lights
