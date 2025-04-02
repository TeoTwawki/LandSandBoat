-----------------------------------
-- Area: Windurst Waters
--  NPC: Fomina
-- Only sells when Windurst controlls Elshimo Lowlands
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WATERS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local regionOwner = GetRegionOwner(invaderXim.region.ELSHIMOLOWLANDS)

    if regionOwner ~= invaderXim.nation.WINDURST then
        player:showText(npc, ID.text.FOMINA_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.FOMINA_OPEN_DIALOG)

        local stock =
        {
            612,     55,  -- Kazham Peppers
            4432,    55,  -- Kazham Pineapple
            4390,    36,  -- Mithran Tomato
            626,    234,  -- Black Pepper
            630,     88,  -- Ogre Pumpkin
            632,    110,  -- Kukuru Bean
            1411,  1656   -- Phalaenopsis
        }
        invaderXim.shop.general(player, stock, invaderXim.fameArea.WINDURST)
    end
end

return entity
