-----------------------------------
-- Area: Selbina
--  NPC: Gibol
-- Guild Merchant NPC: Clothcrafting Guild
-- !pos 13.591 -7.287 8.569 248
-----------------------------------
local ID = zones[invaderXim.zone.SELBINA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local guildSkillId = invaderXim.skill.CLOTHCRAFT
    local stock = invaderXim.shop.generalGuildStock[guildSkillId]
    invaderXim.shop.generalGuild(player, stock, guildSkillId)
    player:showText(npc, ID.text.CLOTHCRAFT_SHOP_DIALOG)
end

return entity
