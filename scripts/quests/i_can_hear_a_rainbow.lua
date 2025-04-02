-----------------------------------
-- I Can Hear a Rainbow
-----------------------------------

quests = quests or {}
quests.i_can_hear_a_rainbow = quests.i_can_hear_a_rainbow or {}

-----------------------------------
-- local data
-----------------------------------

local rubyData =
{
    [invaderXim.weather.HOT_SPELL] =
    {
        bit = 0,
        zones = set{
            invaderXim.zone.VALKURM_DUNES,
            invaderXim.zone.ROLANBERRY_FIELDS,
            invaderXim.zone.CAPE_TERIGGAN,
            invaderXim.zone.EASTERN_ALTEPA_DESERT,
            invaderXim.zone.MERIPHATAUD_MOUNTAINS,
            invaderXim.zone.YUHTUNGA_JUNGLE,
            invaderXim.zone.YHOATOR_JUNGLE,
            invaderXim.zone.WESTERN_ALTEPA_DESERT,
        },
    },
    [invaderXim.weather.NONE] =
    {
        bit = 1,
        zones = set{
            invaderXim.zone.WEST_RONFAURE,
            invaderXim.zone.EAST_RONFAURE,
            invaderXim.zone.NORTH_GUSTABERG,
            invaderXim.zone.SOUTH_GUSTABERG,
            invaderXim.zone.EASTERN_ALTEPA_DESERT,
            invaderXim.zone.WEST_SARUTABARUTA,
            invaderXim.zone.EAST_SARUTABARUTA,
            invaderXim.zone.BUBURIMU_PENINSULA,
            invaderXim.zone.YHOATOR_JUNGLE,
        },
    },
    [invaderXim.weather.DUST_STORM] =
    {
        bit = 2,
        zones = set{
            invaderXim.zone.VALKURM_DUNES,
            invaderXim.zone.BATALLIA_DOWNS,
            invaderXim.zone.KONSCHTAT_HIGHLANDS,
            invaderXim.zone.EASTERN_ALTEPA_DESERT,
            invaderXim.zone.TAHRONGI_CANYON,
            invaderXim.zone.MERIPHATAUD_MOUNTAINS,
            invaderXim.zone.SAUROMUGUE_CHAMPAIGN,
            invaderXim.zone.WESTERN_ALTEPA_DESERT,
        },
    },
    [invaderXim.weather.WIND] =
    {
        bit = 3,
        zones = set{
            invaderXim.zone.LA_THEINE_PLATEAU,
            invaderXim.zone.CAPE_TERIGGAN,
            invaderXim.zone.TAHRONGI_CANYON,
            invaderXim.zone.BUBURIMU_PENINSULA,
        },
    },
    [invaderXim.weather.RAIN] =
    {
        bit = 4,
        zones = set{
            invaderXim.zone.LA_THEINE_PLATEAU,
            invaderXim.zone.JUGNER_FOREST,
            invaderXim.zone.PASHHOW_MARSHLANDS,
            invaderXim.zone.ROLANBERRY_FIELDS,
            invaderXim.zone.BUBURIMU_PENINSULA,
            invaderXim.zone.THE_SANCTUARY_OF_ZITAH,
            invaderXim.zone.YUHTUNGA_JUNGLE,
            invaderXim.zone.YHOATOR_JUNGLE,
        },
    },
    [invaderXim.weather.SNOW] =
    {
        bit = 5,
        zones = set{
            invaderXim.zone.BATALLIA_DOWNS,
            invaderXim.zone.BEAUCEDINE_GLACIER,
            invaderXim.zone.XARCABARD,
        },
    },
    [invaderXim.weather.THUNDER] =
    {
        bit = 6,
        zones = set{
            invaderXim.zone.JUGNER_FOREST,
            invaderXim.zone.KONSCHTAT_HIGHLANDS,
            invaderXim.zone.PASHHOW_MARSHLANDS,
            invaderXim.zone.SAUROMUGUE_CHAMPAIGN,
            invaderXim.zone.THE_SANCTUARY_OF_ZITAH,
        },
    },
}

-----------------------------------
-- public functions
-----------------------------------

quests.i_can_hear_a_rainbow.onZoneIn = function(player)
    if
        player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.I_CAN_HEAR_A_RAINBOW) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:hasItem(invaderXim.item.CARBUNCLES_RUBY, 0)
    then
        local trigger = false

        -- get data for basic weather (e.g. downgrade GALES to WIND)
        local zone = player:getZone(true)
        if not zone then
            return false
        end

        local weather = zone:getWeather()
        if not weather then
            return false
        end

        local baseWeather = (weather % 2 == 0) and weather or weather - 1
        local data = rubyData[baseWeather]

        if data and data.zones[zone:getID()] then
            local mask = player:getCharVar('I_CAN_HEAR_A_RAINBOW')
            local hasColor = utils.mask.getBit(mask, data.bit)

            if not hasColor then
                trigger = true
                player:setCharVar('I_CAN_HEAR_A_RAINBOW', utils.mask.setBit(mask, data.bit, true))
                player:setLocalVar('[rainbow]weather', weather)
            end
        end

        return trigger
    end
end

quests.i_can_hear_a_rainbow.onEventUpdate = function(player)
    local weather = player:getLocalVar('[rainbow]weather')

    -- in some zones the light cutscene does not handle invaderXim.weather.SUNSHINE properly
    if weather == invaderXim.weather.SUNSHINE then
        weather = invaderXim.weather.NONE
    end

    if utils.mask.isFull(player:getCharVar('I_CAN_HEAR_A_RAINBOW'), 7) then -- has collected all 7 colors?
        player:updateEvent(0, 0, weather, 6)
    else
        player:updateEvent(0, 0, weather)
    end
end

-- shorthand
quests.rainbow = quests.i_can_hear_a_rainbow
