-----------------------------------
-- Area: Apollyon Central
--  Mob: Gunpod
-- TODO: Gunpod has a special (non-standard) speed boost of 5x (40 to 200) when
-- target is out of range. This should be added eventually when such mods come to IXIM
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addListener('ITEM_DROPS', 'GUNPOD_ITEM_DROPS', function(mobArg, loot)
        local result = math.random(1, 100)
        local group
        if result <= 25 then
            -- Apollyon Chips
            group =
            {
                { item = invaderXim.item.SMALT_CHIP },
                { item = invaderXim.item.SMOKY_CHIP },
                { item = invaderXim.item.CHARCOAL_CHIP },
                { item = invaderXim.item.MAGENTA_CHIP },
            }
        elseif result <= 50 then
            -- Craft Materials
            group =
            {
                { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE },
                { item = invaderXim.item.CHUNK_OF_ADAMAN_ORE },
                { item = invaderXim.item.DARKSTEEL_INGOT },
                { item = invaderXim.item.DARKSTEEL_SHEET },
                { item = invaderXim.item.SPOOL_OF_RAINBOW_THREAD },
                { item = invaderXim.item.PIECE_OF_OXBLOOD },
                { item = invaderXim.item.HANDFUL_OF_CLOT_PLASMA },
                { item = invaderXim.item.LIGHT_STEEL_INGOT },
                { item = invaderXim.item.PONZE_OF_SHELL_POWDER },
            }
        elseif result <= 86 then
            -- AF+1 Materials
            group =
            {
                { item = invaderXim.item.ARGYRO_RIVET },
                { item = invaderXim.item.ANCIENT_BRASS_INGOT },
                { item = invaderXim.item.SPOOL_OF_BENEDICT_YARN },
                { item = invaderXim.item.SPOOL_OF_DIABOLIC_YARN },
                { item = invaderXim.item.SQUARE_OF_CARDINAL_CLOTH },
                { item = invaderXim.item.SPOOL_OF_LIGHT_FILAMENT },
                { item = invaderXim.item.WHITE_RIVET },
                { item = invaderXim.item.BLACK_RIVET },
                { item = invaderXim.item.FETID_LANOLIN_CUBE },
                { item = invaderXim.item.SQUARE_OF_BROWN_DOESKIN },
                { item = invaderXim.item.SQUARE_OF_CHARCOAL_COTTON },
                { item = invaderXim.item.SHEET_OF_KUROGANE },
                { item = invaderXim.item.POT_OF_EBONY_LACQUER },
                { item = invaderXim.item.BLUE_RIVET },
                { item = invaderXim.item.SQUARE_OF_ASTRAL_LEATHER },
                { item = invaderXim.item.SQUARE_OF_FLAMESHUN_CLOTH },
                { item = invaderXim.item.SQUARE_OF_CANVAS_TOILE },
                { item = invaderXim.item.SQUARE_OF_CORDUROY_CLOTH },
                { item = invaderXim.item.GOLD_STUD },
                { item = invaderXim.item.ELECTRUM_STUD },
            }
        else
            -- Acient Beastcoins
            loot:addItem(invaderXim.item.ANCIENT_BEASTCOIN, invaderXim.drop_rate.GUARANTEED, 5)
            loot:addItem(invaderXim.item.ANCIENT_BEASTCOIN, invaderXim.drop_rate.COMMON)
            return
        end

        loot:addGroup(invaderXim.drop_rate.GUARANTEED, group)
    end)
end

return entity
