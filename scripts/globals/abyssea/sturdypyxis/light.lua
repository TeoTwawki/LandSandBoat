-----------------------------------
-- Abyssea Sturdy Pyxis - Light
-----------------------------------
require('scripts/globals/abyssea')
-----------------------------------
xi = xi or {}
invaderXim.pyxis = invaderXim.pyxis or {}

invaderXim.pyxis.light = {}

invaderXim.pyxis.light.giveLight = function(npc, player)
    local alliance = player:getAlliance()
    local light  = npc:getLocalVar('LIGHT')
    local lightValue = npc:getLocalVar('LIGHT_VALUE')

    for p, member in ipairs(alliance) do
        if
            member:getZoneID() == player:getZoneID() and
            member:isPC()
        then
            invaderXim.abyssea.addPlayerLights(member, light, lightValue)
        end
    end
end
