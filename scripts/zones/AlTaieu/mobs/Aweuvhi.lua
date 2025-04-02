-----------------------------------
-- Area: AlTaieu
--  Mob: Aw'euvhi
-----------------------------------
local ID = zones[invaderXim.zone.ALTAIEU]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.CHECK_AS_NM, 1)
end

entity.onMobDeath = function(mob, player, optParams)
    local mobID = mob:getID()

    if
        mobID == ID.mob.EUVHIS_OFFSET + 0 or
        mobID == ID.mob.EUVHIS_OFFSET + 2 or
        mobID == ID.mob.EUVHIS_OFFSET + 4
    then
        if not player:hasKeyItem(invaderXim.ki.WHITE_CARD) then
            npcUtil.giveKeyItem(player, invaderXim.ki.WHITE_CARD)
        end

    elseif
        mobID == ID.mob.EUVHIS_OFFSET + 6 or
        mobID == ID.mob.EUVHIS_OFFSET + 8 or
        mobID == ID.mob.EUVHIS_OFFSET + 10
    then
        if not player:hasKeyItem(invaderXim.ki.RED_CARD) then
            npcUtil.giveKeyItem(player, invaderXim.ki.RED_CARD)
        end

    elseif
        mobID == ID.mob.EUVHIS_OFFSET + 12 or
        mobID == ID.mob.EUVHIS_OFFSET + 14 or
        mobID == ID.mob.EUVHIS_OFFSET + 16
    then
        if not player:hasKeyItem(invaderXim.ki.BLACK_CARD) then
            npcUtil.giveKeyItem(player, invaderXim.ki.BLACK_CARD)
        end
    end
end

return entity
