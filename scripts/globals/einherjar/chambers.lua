-----------------------------------
-- Einherjar: Chambers management
-----------------------------------
xi = xi or {}
invaderXim.einherjar = invaderXim.einherjar or {}

local ID = zones[invaderXim.zone.HAZHALM_TESTING_GROUNDS]

local chambersByTier =
{
    [invaderXim.einherjar.wing.WING_1] =
    {
        {
            id     = invaderXim.einherjar.chamber.ROSSWEISSE,
            ki     = invaderXim.ki.ROSSWEISSES_FEATHER,
            menu   = 0x2,
            center = { 401.1, -216, 40.6, 28 },
            ichor  = 960,
        },
        {
            id     = invaderXim.einherjar.chamber.GRIMGERDE,
            ki     = invaderXim.ki.GRIMGERDES_FEATHER,
            menu   = 0x4,
            center = { 159.6, -196, -41.4, 220 },
            ichor  = 960,
        },
        {
            id     = invaderXim.einherjar.chamber.SIEGRUNE,
            ki     = invaderXim.ki.SIEGRUNES_FEATHER,
            menu   = 0x8,
            center = { 78.5, -176, -281, 221 },
            ichor  = 960,
        },
    },
    [invaderXim.einherjar.wing.WING_2] =
    {
        {
            id     = invaderXim.einherjar.chamber.HELMWIGE,
            ki     = invaderXim.ki.HELMWIGES_FEATHER,
            menu   = 0x10,
            center = { -197.32, -146, -439.5, 218 },
            ichor  = 1440,
        },
        {
            id     = invaderXim.einherjar.chamber.SCHWERTLEITE,
            ki     = invaderXim.ki.SCHWERTLEITES_FEATHER,
            menu   = 0x20,
            center = { -437.3986, -126.0, -281.89, 34 },
            ichor  = 1440,
        },
        {
            id     = invaderXim.einherjar.chamber.WALTRAUTE,
            ki     = invaderXim.ki.WALTRAUTES_FEATHER,
            menu   = 0x40,
            center = { -678, -106, -120, 28 },
            ichor  = 1440,
        },
    },
    [invaderXim.einherjar.wing.WING_3] =
    {
        {
            id     = invaderXim.einherjar.chamber.ORTLINDE,
            ki     = invaderXim.ki.ORTLINDES_FEATHER,
            menu   = 0x80,
            center = { -519.36, -66, 158.96, 56 },
            ichor  = 1920,
        },
        {
            id     = invaderXim.einherjar.chamber.GERHILDE,
            ki     = invaderXim.ki.GERHILDES_FEATHER,
            menu   = 0x100,
            center = { -360.81, -46, 398.3684, 96 },
            ichor  = 1920,
        },
        {
            id     = invaderXim.einherjar.chamber.BRUNNHILDE,
            ki     = invaderXim.ki.BRUNHILDES_FEATHER,
            menu   = 0x200,
            center = { -82.26, -6, 242.05, 159 },
            ichor  = 1920,
        },
    },
    [invaderXim.einherjar.wing.VALGRIND] =
    {
        {
            id     = invaderXim.einherjar.chamber.ODIN,
            ki     = 0,
            menu   = 0x400,
            center = { -277.4, 34, -38.15, 222 },
            ichor  = 2880,
        },
        {
            id     = invaderXim.einherjar.chamber.ODIN_II,
            ki     = 0,
            menu   = 0x1000,
            center = { -277.4, 34, -38.15, 222 },
            ichor  = 3600,
        },
    },
}

invaderXim.einherjar.chambers =
{
    [invaderXim.einherjar.chamber.ROSSWEISSE]   = chambersByTier[invaderXim.einherjar.wing.WING_1][1],
    [invaderXim.einherjar.chamber.GRIMGERDE]    = chambersByTier[invaderXim.einherjar.wing.WING_1][2],
    [invaderXim.einherjar.chamber.SIEGRUNE]     = chambersByTier[invaderXim.einherjar.wing.WING_1][3],
    [invaderXim.einherjar.chamber.HELMWIGE]     = chambersByTier[invaderXim.einherjar.wing.WING_2][1],
    [invaderXim.einherjar.chamber.SCHWERTLEITE] = chambersByTier[invaderXim.einherjar.wing.WING_2][2],
    [invaderXim.einherjar.chamber.WALTRAUTE]    = chambersByTier[invaderXim.einherjar.wing.WING_2][3],
    [invaderXim.einherjar.chamber.ORTLINDE]     = chambersByTier[invaderXim.einherjar.wing.WING_3][1],
    [invaderXim.einherjar.chamber.GERHILDE]     = chambersByTier[invaderXim.einherjar.wing.WING_3][2],
    [invaderXim.einherjar.chamber.BRUNNHILDE]   = chambersByTier[invaderXim.einherjar.wing.WING_3][3],
    -- [invaderXim.einherjar.chamber.ODIN]         = chambersByTier[invaderXim.einherjar.wing.VALGRIND][1], -- Not implemented
}

-- Bitmask of chambers the player has access to
-- Player must own all key items from previous tier to access the next tier
-- Wing 1 is always accessible
-- Mark of the Einherjar owners have all wings open
invaderXim.einherjar.getChambersMenu = function(player)
    local mask = 0xFF0
    local wings =
    {
        invaderXim.einherjar.wing.WING_1,
        invaderXim.einherjar.wing.WING_2,
        invaderXim.einherjar.wing.WING_3,
        -- invaderXim.einherjar.wing.VALGRIND -- Not implemented
    }

    -- Mark of the Einherjar owners don't need to have all previous tiers KI
    -- Odin still requires all 9 feathers to be owned.
    if player:hasKeyItem(invaderXim.ki.MARK_OF_THE_EINHERJAR) then
        -- TODO: Uncomment when Odin is implemented
        --local ownedFeathers = invaderXim.einherjar.getFeathers(player)
        --if
        --    #ownedFeathers[invaderXim.einherjar.wing.WING_1] == 3 and
        --    #ownedFeathers[invaderXim.einherjar.wing.WING_2] == 3 and
        --    #ownedFeathers[invaderXim.einherjar.wing.WING_3] == 3
        --then
        --    return 0x0800 -- All 3 wings + Odin
        --end

        return 0x0C00 -- All 3 wings open
    end

    for i = 1, #wings do
        local tierChambers     = chambersByTier[wings[i]]
        local nextTierChambers = chambersByTier[wings[i + 1]]

        -- Check if player owns all key items in the current tier
        local ownsAllCurrent = true
        for _, chamber in ipairs(tierChambers) do
            if not player:hasKeyItem(chamber.ki) then
                ownsAllCurrent = false
                break
            end
        end

        if not ownsAllCurrent then
            break
        end

        if nextTierChambers then
            for _, chamber in ipairs(nextTierChambers) do
                mask = bit.band(mask, bit.bnot(bit.lshift(1, chamber.id)))
            end
        end
    end

    return mask
end

-- Bitmask of feathers the player is missing, as used by the Mark of the Einherjar NPC
invaderXim.einherjar.getMissingFeathersMenu = function(player, tier)
    local mask = 0x3FE  -- Start with nothing missing 1111111110
    local tierChambers = chambersByTier[tier]

    for _, chamber in ipairs(tierChambers) do
        if not player:hasKeyItem(chamber.ki) then
            mask = bit.band(mask, bit.bnot(chamber.menu))
        end
    end

    return mask
end

invaderXim.einherjar.giveMark = function(player)
    player:addKeyItem(invaderXim.ki.MARK_OF_THE_EINHERJAR)
    player:messageSpecial(ID.text.KEYITEM_OBTAINED, invaderXim.ki.MARK_OF_THE_EINHERJAR)
end

-- Give the player the chamber feather and the Mark of the Einherjar if all feathers are owned
invaderXim.einherjar.giveChamberFeather = function(player, chamberId)
    if invaderXim.einherjar.chambers[chamberId].ki then
        if not player:hasKeyItem(invaderXim.einherjar.chambers[chamberId].ki) then
            player:addKeyItem(invaderXim.einherjar.chambers[chamberId].ki)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, invaderXim.einherjar.chambers[chamberId].ki)
        end

        -- If that was the 9th feather, give the Mark of the Einherjar
        if not player:hasKeyItem(invaderXim.ki.MARK_OF_THE_EINHERJAR) then
            local allFeathers = invaderXim.einherjar.getFeathers(player)
            if
                #allFeathers[invaderXim.einherjar.wing.WING_1] == 3 and
                #allFeathers[invaderXim.einherjar.wing.WING_2] == 3 and
                #allFeathers[invaderXim.einherjar.wing.WING_3] == 3
            then
                invaderXim.einherjar.giveMark(player)
            end
        end
    end
end

-- Returns a table of feathers the player has, ordered by tier
invaderXim.einherjar.getFeathers = function(player)
    local feathersByTier = {}

    for tier, tierChambers in pairs(chambersByTier) do
        local feathers = {}
        for _, chamber in pairs(tierChambers) do
            if player:hasKeyItem(chamber.ki) then
                table.insert(feathers, chamber.ki)
            end
        end

        feathersByTier[tier] = feathers
    end

    return feathersByTier
end

-- Entering Odin's Chamber clears all feathers.
invaderXim.einherjar.consumeAllFeathers = function(player)
    for _, chamber in pairs(invaderXim.einherjar.chambers) do
        if chamber.ki and player:hasKeyItem(chamber.ki) then
            player:delKeyItem(chamber.ki)
        end
    end

    player:messageSpecial(ID.text.FEATHERS_CONSUMED)
end
