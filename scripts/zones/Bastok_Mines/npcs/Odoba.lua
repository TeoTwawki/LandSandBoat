-----------------------------------
-- Area: Bastok Mines
--  NPC: Odoba
-- Guild Merchant NPC: Alchemy Guild
-- !pos 108.473 5.017 1.089 234
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local guildSkillId = invaderXim.skill.ALCHEMY
    local stock = invaderXim.shop.generalGuildStock[guildSkillId]
    invaderXim.shop.generalGuild(player, stock, guildSkillId)
    player:showText(npc, ID.text.ODOBA_SHOP_DIALOG)
end

return entity
