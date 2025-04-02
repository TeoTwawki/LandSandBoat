-----------------------------------
-- Abyssea Sturdy Pyxis - Experience
-----------------------------------
xi = xi or {}
invaderXim.pyxis = invaderXim.pyxis or {}

invaderXim.pyxis.exp = {}

invaderXim.pyxis.exp.giveExperience = function(npc, player)
    local alliance = player:getAlliance()
    local exp = npc:getLocalVar('EXP')

    for p, member in ipairs(alliance) do
        if member:getZoneID() == player:getZoneID() and member:isPC() then
            member:addExp(exp)
        end
    end
end
