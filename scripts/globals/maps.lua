-----------------------------------
-- Functions for Map Vendor NPCs
-----------------------------------
xi = xi or {}
invaderXim.maps = invaderXim.maps or {}

-- TODO: When WotG Map Vendors are implemented, use this table to
-- store additional data regarding map discounts in past areas.
local mapVendors =
{
    ['Ashu_Bolkhomo']   = 1006,
    ['Elesca']          = 567,
    ['Karine']          = 210,
    ['Lombaria']        = 500,
    ['Ludwig']          = 500,
    ['Mhoji_Roccoruh']  = 10000,
    ['Pehki_Machumaht'] = 10000,
    ['Promurouve']      = 10000,
    ['Rex']             = 115,
    ['Riyadahf']        = 563,
    ['Rusese']          = 10000,
    ['Violitte']        = 595,
}

local mapInfo =
{
--   ID      Key Item                                  Cost
    [ 0] = { invaderXim.ki.MAP_OF_THE_SAN_DORIA_AREA,           200 },
    [ 1] = { invaderXim.ki.MAP_OF_THE_BASTOK_AREA,              200 },
    [ 2] = { invaderXim.ki.MAP_OF_THE_WINDURST_AREA,            200 },
    [ 3] = { invaderXim.ki.MAP_OF_THE_JEUNO_AREA,               600 },
    [ 4] = { invaderXim.ki.MAP_OF_ORDELLES_CAVES,               600 },
    [ 5] = { invaderXim.ki.MAP_OF_GHEIXIMA,                      600 },
    [ 6] = { invaderXim.ki.MAP_OF_DAVOI,                       3000 },
    [ 7] = { invaderXim.ki.MAP_OF_CARPENTERS_LANDING,          3000 },
    [ 8] = { invaderXim.ki.MAP_OF_THE_ZERUHN_MINES,             200 },
    [ 9] = { invaderXim.ki.MAP_OF_THE_PALBOROUGH_MINES,         600 },
    [10] = { invaderXim.ki.MAP_OF_BEADEAUX,                     600 },
    [11] = { invaderXim.ki.MAP_OF_GIDDEUS,                      600 },
    [12] = { invaderXim.ki.MAP_OF_CASTLE_OZTROJA,              3000 },
    [13] = { invaderXim.ki.MAP_OF_THE_MAZE_OF_SHAKHRAMI,        600 },
    [14] = { invaderXim.ki.MAP_OF_THE_LITELOR_REGION,          3000 },
    [15] = { invaderXim.ki.MAP_OF_BIBIKI_BAY,                  3000 },
    [16] = { invaderXim.ki.MAP_OF_QUFIM_ISLAND,                3000 },
    [17] = { invaderXim.ki.MAP_OF_THE_ELDIEME_NECROPOLIS,      3000 },
    [18] = { invaderXim.ki.MAP_OF_THE_GARLAIGE_CITADEL,        3000 },
    [19] = { invaderXim.ki.MAP_OF_THE_ELSHIMO_REGIONS,         3000 },
    [20] = { invaderXim.ki.MAP_OF_THE_NORTHLANDS_AREA,         3000 },
    [21] = { invaderXim.ki.MAP_OF_KING_RANPERRES_TOMB,          600 },
    [22] = { invaderXim.ki.MAP_OF_THE_DANGRUF_WADI,             600 },
    [23] = { invaderXim.ki.MAP_OF_THE_HORUTOTO_RUINS,           600 },
    [24] = { invaderXim.ki.MAP_OF_BOSTAUNIEUX_OUBLIETTE,       3000 },
    [25] = { invaderXim.ki.MAP_OF_THE_TORAIMARAI_CANAL,        3000 },
    [26] = { invaderXim.ki.MAP_OF_THE_GUSGEN_MINES,             600 },
    [27] = { invaderXim.ki.MAP_OF_THE_CRAWLERS_NEST,           3000 },
    [28] = { invaderXim.ki.MAP_OF_THE_RANGUEMONT_PASS,         3000 },
    [29] = { invaderXim.ki.MAP_OF_DELKFUTTS_TOWER,             3000 },
    [30] = { invaderXim.ki.MAP_OF_FEIYIN,                      3000 },
    [31] = { invaderXim.ki.MAP_OF_CASTLE_ZVAHL,                3000 },
    [32] = { invaderXim.ki.MAP_OF_THE_KUZOTZ_REGION,           3000 },
    [33] = { invaderXim.ki.MAP_OF_THE_RUAUN_GARDENS,           3000 },
    [34] = { invaderXim.ki.MAP_OF_NORG,                        3000 },
    [35] = { invaderXim.ki.MAP_OF_TEMPLE_OF_UGGALEPIH,         3000 },
    [36] = { invaderXim.ki.MAP_OF_THE_DEN_OF_RANCOR,           3000 },
    [37] = { invaderXim.ki.MAP_OF_THE_KORROLOKA_TUNNEL,        3000 },
    [38] = { invaderXim.ki.MAP_OF_THE_KUFTAL_TUNNEL,           3000 },
    [39] = { invaderXim.ki.MAP_OF_THE_BOYAHDA_TREE,            3000 },
    [40] = { invaderXim.ki.MAP_OF_VELUGANNON_PALACE,           3000 },
    [41] = { invaderXim.ki.MAP_OF_IFRITS_CAULDRON,             3000 },
    [42] = { invaderXim.ki.MAP_OF_THE_QUICKSAND_CAVES,         3000 },
    [43] = { invaderXim.ki.MAP_OF_SEA_SERPENT_GROTTO,          3000 },
    [44] = { invaderXim.ki.MAP_OF_THE_VOLLBOW_REGION,          3000 },
    [45] = { invaderXim.ki.MAP_OF_LABYRINTH_OF_ONZOZO,         3000 },
    [46] = { invaderXim.ki.MAP_OF_THE_ULEGUERAND_RANGE,        3000 },
    [47] = { invaderXim.ki.MAP_OF_THE_ATTOHWA_CHASM,           3000 },
    [48] = { invaderXim.ki.MAP_OF_PSOXJA,                      3000 },
    [49] = { invaderXim.ki.MAP_OF_OLDTON_MOVALPOLOS,           3000 },
    [50] = { invaderXim.ki.MAP_OF_NEWTON_MOVALPOLOS,           3000 },
    [51] = { invaderXim.ki.MAP_OF_TAVNAZIA,                    3000 },
    [52] = { invaderXim.ki.MAP_OF_THE_AQUEDUCTS,               3000 },
    [53] = { invaderXim.ki.MAP_OF_THE_SACRARIUM,               3000 },
    [54] = { invaderXim.ki.MAP_OF_CAPE_RIVERNE,                3000 },
    [55] = { invaderXim.ki.MAP_OF_ALTAIEU,                     3000 },
    [56] = { invaderXim.ki.MAP_OF_HUXZOI,                      3000 },
    [57] = { invaderXim.ki.MAP_OF_RUHMET,                      3000 },
    [58] = { invaderXim.ki.MAP_OF_AL_ZAHBI,                     600 },
    [59] = { invaderXim.ki.MAP_OF_NASHMAU,                     3000 },
    [60] = { invaderXim.ki.MAP_OF_WAJAOM_WOODLANDS,            3000 },
    [61] = { invaderXim.ki.MAP_OF_CAEDARVA_MIRE,               3000 },
    [62] = { invaderXim.ki.MAP_OF_MOUNT_ZHAYOLM,               3000 },
    [63] = { invaderXim.ki.MAP_OF_AYDEEWA_SUBTERRANE,          3000 },
    [64] = { invaderXim.ki.MAP_OF_MAMOOK,                      3000 },
    [65] = { invaderXim.ki.MAP_OF_HALVUNG,                     3000 },
    [66] = { invaderXim.ki.MAP_OF_ARRAPAGO_REEF,               3000 },
    [67] = { invaderXim.ki.MAP_OF_ALZADAAL_RUINS,              3000 },
    [68] = { invaderXim.ki.MAP_OF_BHAFLAU_THICKETS,            3000 },
    [69] = { invaderXim.ki.MAP_OF_VUNKERL_INLET,              30000 },
    [70] = { invaderXim.ki.MAP_OF_GRAUBERG,                   30000 },
    [71] = { invaderXim.ki.MAP_OF_FORT_KARUGO_NARUGO,         30000 },
}

local function getMapEventParams(player)
    local paramTable = { 0, 0, 0 }

    for mapId = 0, #mapInfo do
        if player:hasKeyItem(mapInfo[mapId][1]) then
            local paramPos = math.floor(mapId / 32) + 1

            paramTable[paramPos] = bit.bor(paramTable[paramPos], bit.lshift(1, mapId))
        end
    end

    return paramTable
end

invaderXim.maps.onTrigger = function(player, npc)
    local eventParams = getMapEventParams(player)

    player:startEvent(mapVendors[npc:getName()], eventParams[1], eventParams[2], eventParams[3])
end

invaderXim.maps.onEventUpdate = function(player, csid, option, npc)
    local mapId = bit.rshift(option, 16)

    if csid ~= mapVendors[npc:getName()] then
        return
    end

    if
        mapId >= 0 and
        mapId <= #mapInfo and
        bit.band(option, 0xF) == 1
    then
        local mapCost = mapInfo[mapId][2]

        if mapCost <= player:getGil() then
            player:delGil(mapCost)
            npcUtil.giveKeyItem(player, mapInfo[mapId][1])
        else
            player:messageSpecial(zones[player:getZoneID()].text.NOT_HAVE_ENOUGH_GIL)
        end
    end

    player:updateEvent(unpack(getMapEventParams(player)))
end
