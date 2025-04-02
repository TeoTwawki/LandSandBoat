-----------------------------------
require('scripts/globals/missions')
-----------------------------------
xi = xi or {}
invaderXim.rhapsodies = invaderXim.rhapsodies or {}

invaderXim.rhapsodies.character =
{
    PRISHE     = 0,
    TENZEN     = 1,
    APHMAU     = 2,
    LILLISETTE = 3,
    CAIT_SITH  = 4,
    ARCIELA    = 5,
}

invaderXim.rhapsodies.expansion =
{
    [invaderXim.rhapsodies.character.PRISHE]     = invaderXim.mission.log_id.COP,
    [invaderXim.rhapsodies.character.TENZEN]     = invaderXim.mission.log_id.COP,
    [invaderXim.rhapsodies.character.APHMAU]     = invaderXim.mission.log_id.TOAU,
    [invaderXim.rhapsodies.character.LILLISETTE] = invaderXim.mission.log_id.WOTG,
    [invaderXim.rhapsodies.character.CAIT_SITH]  = invaderXim.mission.log_id.WOTG,
    [invaderXim.rhapsodies.character.ARCIELA]    = invaderXim.mission.log_id.SOA,
}

invaderXim.rhapsodies.unavailability =
{
    [invaderXim.rhapsodies.character.PRISHE] = set{
        invaderXim.mission.id.cop.DARKNESS_NAMED,
        invaderXim.mission.id.cop.SLANDEROUS_UTTERINGS,
        invaderXim.mission.id.cop.DESIRES_OF_EMPTINESS,
        invaderXim.mission.id.cop.THREE_PATHS,
        invaderXim.mission.id.cop.FOR_WHOM_THE_VERSE_IS_SUNG,
        invaderXim.mission.id.cop.A_PLACE_TO_RETURN,
        invaderXim.mission.id.cop.MORE_QUESTIONS_THAN_ANSWERS,
        invaderXim.mission.id.cop.ONE_TO_BE_FEARED,
        invaderXim.mission.id.cop.THE_WARRIORS_PATH,
        invaderXim.mission.id.cop.GARDEN_OF_ANTIQUITY,
        invaderXim.mission.id.cop.WHEN_ANGELS_FALL,
        invaderXim.mission.id.cop.DAWN,
    },
    [invaderXim.rhapsodies.character.TENZEN] = set{
        invaderXim.mission.id.cop.THE_CALL_OF_THE_WYRMKING,
        invaderXim.mission.id.cop.A_VESSEL_WITHOUT_A_CAPTAIN,
        invaderXim.mission.id.cop.DESIRES_OF_EMPTINESS,
        invaderXim.mission.id.cop.THE_WARRIORS_PATH,
        invaderXim.mission.id.cop.GARDEN_OF_ANTIQUITY,
        invaderXim.mission.id.cop.WHEN_ANGELS_FALL,
        invaderXim.mission.id.cop.DAWN,
    },
    [invaderXim.rhapsodies.character.APHMAU] = set{
        invaderXim.mission.id.toau.LAND_OF_SACRED_SERPENTS,
        invaderXim.mission.id.toau.IMMORTAL_SENTRIES,
        invaderXim.mission.id.toau.PRESIDENT_SALAHEEM,
        invaderXim.mission.id.toau.KNIGHT_OF_GOLD,
        invaderXim.mission.id.toau.CONFESSIONS_OF_ROYALTY,
        invaderXim.mission.id.toau.EASTERLY_WINDS,
        invaderXim.mission.id.toau.WESTERLY_WINDS,
        invaderXim.mission.id.toau.A_MERCENARY_LIFE,
        invaderXim.mission.id.toau.UNDERSEA_SCOUTING,
        invaderXim.mission.id.toau.ASTRAL_WAVES,
        invaderXim.mission.id.toau.IMPERIAL_SCHEMES,
        invaderXim.mission.id.toau.SWEETS_FOR_THE_SOUL,
        invaderXim.mission.id.toau.TEAHOUSE_TUMULT,
        invaderXim.mission.id.toau.FINDERS_KEEPERS,
        invaderXim.mission.id.toau.SEAL_OF_THE_SERPENT,
        invaderXim.mission.id.toau.MISPLACED_NOBILITY,
        invaderXim.mission.id.toau.BASTION_OF_KNOWLEDGE,
        invaderXim.mission.id.toau.PUPPET_IN_PERIL,
        invaderXim.mission.id.toau.PREVALENCE_OF_PIRATES,
        invaderXim.mission.id.toau.SHADES_OF_VENGEANCE,
        invaderXim.mission.id.toau.IN_THE_BLOOD,
        invaderXim.mission.id.toau.SENTINELS_HONOR,
        invaderXim.mission.id.toau.TESTING_THE_WATERS,
        invaderXim.mission.id.toau.LEGACY_OF_THE_LOST,
        invaderXim.mission.id.toau.GAZE_OF_THE_SABOTEUR,
        invaderXim.mission.id.toau.PATH_OF_BLOOD,
        invaderXim.mission.id.toau.STIRRINGS_OF_WAR,
        invaderXim.mission.id.toau.ALLIED_RUMBLINGS,
        invaderXim.mission.id.toau.UNRAVELING_REASON,
        invaderXim.mission.id.toau.LIGHT_OF_JUDGMENT,
        invaderXim.mission.id.toau.PATH_OF_DARKNESS,
        invaderXim.mission.id.toau.FANGS_OF_THE_LION,
        invaderXim.mission.id.toau.NASHMEIRAS_PLEA,
        invaderXim.mission.id.toau.RAGNAROK,
        invaderXim.mission.id.toau.IMPERIAL_CORONATION,
    },
    [invaderXim.rhapsodies.character.LILLISETTE] = set{
        invaderXim.mission.id.wotg.CAVERNOUS_MAWS,
        invaderXim.mission.id.wotg.BACK_TO_THE_BEGINNING,
        invaderXim.mission.id.wotg.CAIT_SITH,
        invaderXim.mission.id.wotg.THE_QUEEN_OF_THE_DANCE,
        invaderXim.mission.id.wotg.WHILE_THE_CAT_IS_AWAY,
        invaderXim.mission.id.wotg.ON_THIN_ICE,
        invaderXim.mission.id.wotg.PROOF_OF_VALOR,
        invaderXim.mission.id.wotg.A_SANGUINARY_PRELUDE,
        invaderXim.mission.id.wotg.DUNGEONS_AND_DANCERS,
        invaderXim.mission.id.wotg.DISTORTER_OF_TIME,
        invaderXim.mission.id.wotg.THE_WILL_OF_THE_WORLD,
        invaderXim.mission.id.wotg.ADIEU_LILISETTE,
        invaderXim.mission.id.wotg.BY_THE_FADING_LIGHT,
        invaderXim.mission.id.wotg.EDGE_OF_IXIMSTENCE,
        invaderXim.mission.id.wotg.HER_MEMORIES,
        invaderXim.mission.id.wotg.FORGET_ME_NOT,
        invaderXim.mission.id.wotg.PILLAR_OF_HOPE,
        invaderXim.mission.id.wotg.GLIMMER_OF_LIFE,
        invaderXim.mission.id.wotg.TIME_SLIPS_AWAY,
        invaderXim.mission.id.wotg.WHEN_WILLS_COLLIDE,
        invaderXim.mission.id.wotg.WHISPERS_OF_DAWN,
        invaderXim.mission.id.wotg.WHERE_IT_ALL_BEGAN,
        invaderXim.mission.id.wotg.A_TOKEN_OF_TROTH,
        invaderXim.mission.id.wotg.LEST_WE_FORGET,
    },
    [invaderXim.rhapsodies.character.CAIT_SITH] = set{
        invaderXim.mission.id.wotg.CAVERNOUS_MAWS,
        invaderXim.mission.id.wotg.BACK_TO_THE_BEGINNING,
        invaderXim.mission.id.wotg.WHERE_IT_ALL_BEGAN,
        invaderXim.mission.id.wotg.A_TOKEN_OF_TROTH,
        invaderXim.mission.id.wotg.LEST_WE_FORGET,
    },
    [invaderXim.rhapsodies.character.ARCIELA] = set{
        invaderXim.mission.id.soa.RUMORS_FROM_THE_WEST,
        invaderXim.mission.id.soa.THE_GEOMAGNETRON,
        invaderXim.mission.id.soa.ONWARD_TO_ADOULIN,
        invaderXim.mission.id.soa.HEARTWINGS_AND_THE_KINDHEARTED,
        invaderXim.mission.id.soa.PIONEER_REGISTRATION,
        invaderXim.mission.id.soa.LIFE_ON_THE_FRONTIER,
        invaderXim.mission.id.soa.MEETING_OF_THE_MINDS,
        invaderXim.mission.id.soa.ARCIELA_APPEARS_AGAIN,
        invaderXim.mission.id.soa.BUILDING_PROSPECTS,
        invaderXim.mission.id.soa.THE_LIGHT_SHINING_IN_YOUR_EYES,
        invaderXim.mission.id.soa.THE_HEIRLOOM,
        invaderXim.mission.id.soa.AN_AIMLESS_JOURNEY,
        invaderXim.mission.id.soa.THE_ORDERS_TREASURES,
        invaderXim.mission.id.soa.AUGUSTS_HEIRLOOM,
        invaderXim.mission.id.soa.BEAUTY_AND_THE_BEAST,
        invaderXim.mission.id.soa.WILDCAT_WITH_A_GOLD_PELT,
        invaderXim.mission.id.soa.IN_SEARCH_OF_ARCIELA,
        invaderXim.mission.id.soa.LOOKING_FOR_LEADS,
        invaderXim.mission.id.soa.DRIFTING_NORTHWEST,
        invaderXim.mission.id.soa.KUMHAU_THE_FLASHFROST_NAAKUAL,
        invaderXim.mission.id.soa.SOUL_SIPHON,
        invaderXim.mission.id.soa.STONEWALLED,
        invaderXim.mission.id.soa.SALVATION,
        invaderXim.mission.id.soa.BALAMOR_THE_DEATHBORNE_XOL,
        invaderXim.mission.id.soa.ANAGNORISIS,
        invaderXim.mission.id.soa.JUST_THE_THING,
        invaderXim.mission.id.soa.SUGARCOATED_SALVATION,
        invaderXim.mission.id.soa.RECKONING,
        invaderXim.mission.id.soa.ABOMINATION,
        invaderXim.mission.id.soa.UNDYING_LIGHT,
        invaderXim.mission.id.soa.THE_LIGHT_WITHIN,
    },
}

invaderXim.rhapsodies.requiredCharacters =
{
    [invaderXim.mission.id.rov.RING_MY_BELL] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.SPIRITS_AWOKEN] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.CRASHING_WAVES] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.CALL_TO_SERVE] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.NUMBERING_DAYS] =
    {
        invaderXim.rhapsodies.character.TENZEN,
        invaderXim.rhapsodies.character.PRISHE,
    },

    [invaderXim.mission.id.rov.INESCAPABLE_BINDS] =
    {
        invaderXim.rhapsodies.character.TENZEN,
        invaderXim.rhapsodies.character.PRISHE,
    },

    [invaderXim.mission.id.rov.EVER_FORWARD] =
    {
        invaderXim.rhapsodies.character.PRISHE,
    },

    [invaderXim.mission.id.rov.REUNITED] =
    {
        invaderXim.rhapsodies.character.APHMAU,
    },

    [invaderXim.mission.id.rov.TAKE_WING] =
    {
        invaderXim.rhapsodies.character.TENZEN,
        invaderXim.rhapsodies.character.APHMAU,
    },

    [invaderXim.mission.id.rov.PRIME_NUMBER] =
    {
        invaderXim.rhapsodies.character.TENZEN,
        invaderXim.rhapsodies.character.APHMAU,
    },

    [invaderXim.mission.id.rov.FROM_THE_RUINS] =
    {
        invaderXim.rhapsodies.character.TENZEN,
        invaderXim.rhapsodies.character.APHMAU,
    },

    [invaderXim.mission.id.rov.CAUTERIZE] =
    {
        invaderXim.rhapsodies.character.CAIT_SITH,
    },

    [invaderXim.mission.id.rov.UNCERTAIN_DESTINATIONS] =
    {
        invaderXim.rhapsodies.character.CAIT_SITH,
    },

    [invaderXim.mission.id.rov.GANGED_UP_ON] =
    {
        invaderXim.rhapsodies.character.LILLISETTE,
    },

    [invaderXim.mission.id.rov.SACRIFICE] =
    {
        invaderXim.rhapsodies.character.LILLISETTE,
        invaderXim.rhapsodies.character.CAIT_SITH,
    },

    [invaderXim.mission.id.rov.SOMBER_DREAMS] =
    {
        invaderXim.rhapsodies.character.LILLISETTE,
        invaderXim.rhapsodies.character.CAIT_SITH,
    },

    [invaderXim.mission.id.rov.OF_LIGHT_AND_DARKNESS] =
    {
        invaderXim.rhapsodies.character.LILLISETTE,
        invaderXim.rhapsodies.character.CAIT_SITH,
    },

    [invaderXim.mission.id.rov.PAST_IMPERFECT] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.THE_CURSED_TEMPLE] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.WISDOM_OF_OUR_FOREFATHERS] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.WHERE_DIVINITIES_COLLIDE] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.VISIONS_OF_DREAD] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.TO_THE_SKIES] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.ESCHA_RUAUN] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.THE_DECISIVE_HEROINE] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.FALL_FROM_GRACE] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.OVER_THE_RAINBOW] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.CACOPHONOUS_DISCORD] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.CALL_OF_THE_VOID] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.WHAT_REMAINS_OF_HOPE] =
    {
        invaderXim.rhapsodies.character.ARCIELA,
    },

    [invaderXim.mission.id.rov.DEATH_CARES_NOT] =
    {
        invaderXim.rhapsodies.character.ARCIELA,
    },

    [invaderXim.mission.id.rov.NO_TIME_LIKE_THE_FUTURE] =
    {
        invaderXim.rhapsodies.character.ARCIELA,
    },

    [invaderXim.mission.id.rov.SIN] =
    {
        invaderXim.rhapsodies.character.ARCIELA,
    },

    [invaderXim.mission.id.rov.FROM_WEST_TO_EAST] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.GOOD_THINGS_COME_IN_THREES] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.TACKLING_THE_PROBLEM] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.WAY_TO_DIVINITY] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.NARY_A_CLOUD_IN_SIGHT] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.AN_UNENDING_SONG] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.GUARDIANS] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.IROHA_IN_DISTRESS] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },

    [invaderXim.mission.id.rov.ABSOLUTE_TRUST] =
    {
        invaderXim.rhapsodies.character.TENZEN,
    },
}

-----------------------------------
-- PUBLIC FUNCTIONS
-----------------------------------
-- Lockout Table:
-- http://forum.square-enix.com/ffxi/threads/47983-What-should-I-do-if-I-can%E2%80%99t-progress-in-Rhapsodies-of-Vana%E2%80%99diel

invaderXim.rhapsodies.charactersAvailable = function(player)
    local rovMission = player:getCurrentMission(invaderXim.mission.log_id.ROV)
    for _, char in pairs(invaderXim.rhapsodies.requiredCharacters[rovMission]) do
        local expansionMission = player:getCurrentMission(invaderXim.rhapsodies.expansion[char])
        if invaderXim.rhapsodies.unavailability[char][expansionMission] then
            return false
        end
    end

    return true
end
