-----------------------------------
-- ID: 11538
-- Item: Nexus Cape
-- Enchantment: "Teleport" (Party Leader)
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = invaderXim.msg.basic.ITEM_UNABLE_TO_USE
    local leader = target:getPartyLeader()
    -- In a party and we were able to find the leader
    -- (currently fails in cross map server situations)
    if leader ~= nil and not leader:isInMogHouse() then
        -- Don't try to teleport to self!
        if target:getID() ~= leader:getID() then
            local leaderZone = leader:getZoneID()

            -- Locations with "**" in comment:
            -- ** If the party leader is located in a battlefield or other special location,
            -- players will be forced to travel to a specific location.
            --
            -- Other commented locations:
            -- Players will travel of a specific location, not that of the party leader.
            local validZoneList =
            {
                invaderXim.zone.ULEGUERAND_RANGE,
                invaderXim.zone.ATTOHWA_CHASM,
                invaderXim.zone.WEST_RONFAURE,
                invaderXim.zone.EAST_RONFAURE,
                invaderXim.zone.LA_THEINE_PLATEAU,
                invaderXim.zone.VALKURM_DUNES,
                invaderXim.zone.JUGNER_FOREST,
                invaderXim.zone.BATALLIA_DOWNS,
                invaderXim.zone.NORTH_GUSTABERG,
                invaderXim.zone.SOUTH_GUSTABERG,
                invaderXim.zone.KONSCHTAT_HIGHLANDS,
                invaderXim.zone.PASHHOW_MARSHLANDS,
                invaderXim.zone.ROLANBERRY_FIELDS,
                invaderXim.zone.BEAUCEDINE_GLACIER,
                invaderXim.zone.XARCABARD,
                invaderXim.zone.CAPE_TERIGGAN,
                invaderXim.zone.EASTERN_ALTEPA_DESERT,
                invaderXim.zone.WEST_SARUTABARUTA,
                invaderXim.zone.EAST_SARUTABARUTA,
                invaderXim.zone.TAHRONGI_CANYON,
                invaderXim.zone.BUBURIMU_PENINSULA,
                invaderXim.zone.MERIPHATAUD_MOUNTAINS,
                invaderXim.zone.SAUROMUGUE_CHAMPAIGN,
                invaderXim.zone.YUHTUNGA_JUNGLE,
                invaderXim.zone.YHOATOR_JUNGLE,
                invaderXim.zone.WESTERN_ALTEPA_DESERT,
                invaderXim.zone.QUFIM_ISLAND,
                invaderXim.zone.BEHEMOTHS_DOMINION,
                invaderXim.zone.VALLEY_OF_SORROWS,
                invaderXim.zone.SOUTHERN_SAN_DORIA,
                invaderXim.zone.NORTHERN_SAN_DORIA,
                invaderXim.zone.PORT_SAN_DORIA,
                invaderXim.zone.BASTOK_MINES,
                invaderXim.zone.BASTOK_MARKETS,
                invaderXim.zone.PORT_BASTOK,
                invaderXim.zone.WINDURST_WATERS,
                invaderXim.zone.WINDURST_WALLS,
                invaderXim.zone.PORT_WINDURST,
                invaderXim.zone.WINDURST_WOODS,
                invaderXim.zone.RULUDE_GARDENS,
                invaderXim.zone.UPPER_JEUNO,
                invaderXim.zone.LOWER_JEUNO,
                invaderXim.zone.PORT_JEUNO,
                invaderXim.zone.RABAO,
                invaderXim.zone.SELBINA,
                invaderXim.zone.MHAURA,
                invaderXim.zone.KAZHAM,
                invaderXim.zone.NORG,
                invaderXim.zone.CARPENTERS_LANDING,
                invaderXim.zone.BIBIKI_BAY,
                invaderXim.zone.LUFAISE_MEADOWS,
                invaderXim.zone.MISAREAUX_COAST,
                -- invaderXim.zone.TAVNAZIAN_SAFEHOLD,
                invaderXim.zone.ALTAIEU,
                -- invaderXim.zone.AL_ZAHBI,
                -- invaderXim.zone.AHT_URHGAN_WHITEGATE,
                -- ** invaderXim.zone.WAJAOM_WOODLANDS,
                invaderXim.zone.BHAFLAU_THICKETS,
                -- invaderXim.zone.NASHMAU,
                -- ** invaderXim.zone.MOUNT_ZHAYOLM,
                -- ** invaderXim.zone.CAEDARVA_MIRE,
                -- invaderXim.zone.SOUTHERN_SAN_DORIA_S,
                invaderXim.zone.EAST_RONFAURE_S,
                invaderXim.zone.JUGNER_FOREST_S,
                invaderXim.zone.VUNKERL_INLET_S,
                invaderXim.zone.BATALLIA_DOWNS_S,
                -- invaderXim.zone.BASTOK_MARKETS_S,
                invaderXim.zone.NORTH_GUSTABERG_S,
                invaderXim.zone.GRAUBERG_S,
                invaderXim.zone.PASHHOW_MARSHLANDS_S,
                invaderXim.zone.ROLANBERRY_FIELDS_S,
                -- invaderXim.zone.WINDURST_WATERS_S,
                invaderXim.zone.WEST_SARUTABARUTA_S,
                invaderXim.zone.FORT_KARUGO_NARUGO_S,
                invaderXim.zone.MERIPHATAUD_MOUNTAINS_S,
                invaderXim.zone.SAUROMUGUE_CHAMPAIGN_S,
                invaderXim.zone.THE_SANCTUARY_OF_ZITAH,
                invaderXim.zone.ROMAEVE,
                invaderXim.zone.RUAUN_GARDENS,
                invaderXim.zone.BEAUCEDINE_GLACIER_S,
                invaderXim.zone.XARCABARD_S,
                -- invaderXim.zone.METALWORKS,
                -- invaderXim.zone.HEAVENS_TOWER,
                -- invaderXim.zone.WESTERN_ADOULIN,
                -- invaderXim.zone.EASTERN_ADOULIN,
                -- invaderXim.zone.YAHSE_HUNTING_GROUNDS,
                -- invaderXim.zone.CEIZAK_BATTLEGROUNDS,
                -- invaderXim.zone.FORET_DE_HENNETIEL,
                -- invaderXim.zone.YORCIA_WEALD,
                -- invaderXim.zone.MORIMAR_BASALT_FIELDS,
                -- invaderXim.zone.MARJAMI_RAVINE,
                -- invaderXim.zone.KAMIHR_DRIFTS,
                -- invaderXim.zone.LEAFALLIA,
            }

            -- Make sure we can actually tele to that zone..
            result = invaderXim.msg.basic.ITEM_UNABLE_TO_USE_PARTY_LEADER

            for _, validZone in ipairs(validZoneList) do
                if validZone == leaderZone and target:hasVisitedZone(validZone) then
                    result = 0
                    break
                end
            end
        end
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.LEADER, 0, 4)
end

return itemObject
