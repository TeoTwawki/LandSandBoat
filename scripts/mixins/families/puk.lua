-- Puk family mixin
require('scripts/globals/mixins')
-----------------------------------

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.puk = function(mob)
    mob:addListener('SPAWN', 'PUK_SPAWN', function(puk)
        puk:setMod(invaderXim.mod.WIND_ABSORB, 100)
    end)

    mob:addListener('TAKE_DAMAGE', 'PUK_TAKE_DAMAGE', function(puk, amount, attacker, attackType, damageType)
        local elements =
        {
            { invaderXim.damageType.FIRE,    invaderXim.day.FIRESDAY     },
            { invaderXim.damageType.EARTH,   invaderXim.day.EARTHSDAY    },
            { invaderXim.damageType.WATER,   invaderXim.day.WATERSDAY    },
            { invaderXim.damageType.WIND,    invaderXim.day.WINDSDAY     },
            { invaderXim.damageType.ICE,     invaderXim.day.ICEDAY       },
            { invaderXim.damageType.THUNDER, invaderXim.day.LIGHTNINGDAY },
            { invaderXim.damageType.LIGHT,   invaderXim.day.LIGHTSDAY    },
            { invaderXim.damageType.DARK,    invaderXim.day.DARKSDAY     }
        }

        -- If the element corresponding to the elemental day of the in-game Vana'diel week is used on a Puk, it will get 100% TP instantly.
        for k, v in pairs(elements) do
            if damageType == v[1] and VanadielDayOfTheWeek() == v[2] then
                puk:addTP(1000)
            end
        end
    end)
end

return g_mixins.families.puk
