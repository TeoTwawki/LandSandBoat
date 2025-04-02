-----------------------------------
-- Area: South San d'Oria
--  NPC: Alivatand
-- Type: Guildworker's Union Representative
-- !pos -179.458 -1 15.857 230
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.guildPointOnTrade(player, npc, trade, 691, invaderXim.guild.LEATHERCRAFT)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.guildPointOnTrigger(player, 690, invaderXim.guild.LEATHERCRAFT)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 690 then
        invaderXim.crafting.guildPointOnEventUpdate(player, option, npc, invaderXim.guild.LEATHERCRAFT)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 690 then
        invaderXim.crafting.guildPointOnEventFinish(player, option, invaderXim.guild.LEATHERCRAFT)
    elseif csid == 691 then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
