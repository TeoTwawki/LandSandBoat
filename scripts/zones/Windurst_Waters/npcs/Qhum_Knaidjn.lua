-----------------------------------
-- Area: Windurst Waters
--  NPC: Qhum_Knaidjn
-- Type: Guildworker's Union Representative
-- !pos -112.561 -2 55.205 238
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WATERS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.guildPointOnTrade(player, npc, trade, 10025, invaderXim.guild.COOKING)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.guildPointOnTrigger(player, 10024, invaderXim.guild.COOKING)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 10024 then
        invaderXim.crafting.guildPointOnEventUpdate(player, option, npc, invaderXim.guild.COOKING)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 10024 then
        invaderXim.crafting.guildPointOnEventFinish(player, option, invaderXim.guild.COOKING)
    elseif csid == 10025 then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
