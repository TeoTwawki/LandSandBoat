-----------------------------------
-- Guild Point NPCs (Union Representatives)
-----------------------------------
require('scripts/globals/crafting/crafting_utils')
require('scripts/globals/npc_util')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.crafting = invaderXim.crafting or {}

-----------------------------------
-- Data
-----------------------------------
---@class hqCrystals : { id: invaderXim.item, cost: integer }
local hqCrystals =
{
    [0] = { id = invaderXim.item.ROBBER_RIG,       cost = 1500 }, -- Robber Rig is located in category 3. Not a typo.
    [1] = { id = invaderXim.item.INFERNO_CRYSTAL,  cost =  200 },
    [2] = { id = invaderXim.item.GLACIER_CRYSTAL,  cost =  200 },
    [3] = { id = invaderXim.item.CYCLONE_CRYSTAL,  cost =  200 },
    [4] = { id = invaderXim.item.TERRA_CRYSTAL,    cost =  200 },
    [5] = { id = invaderXim.item.PLASMA_CRYSTAL,   cost =  200 },
    [6] = { id = invaderXim.item.TORRENT_CRYSTAL,  cost =  200 },
    [7] = { id = invaderXim.item.AURORA_CRYSTAL,   cost =  500 },
    [8] = { id = invaderXim.item.TWILIGHT_CRYSTAL, cost =  500 },
}

local guildKeyItemTable =
{
    [invaderXim.guild.FISHING] =
    {
        [0] = { id = invaderXim.ki.FROG_FISHING,    rank = invaderXim.craftRank.NOVICE,  cost =  30000 },
        [1] = { id = invaderXim.ki.SERPENT_RUMORS,  rank = invaderXim.craftRank.ADEPT,   cost =  95000 },
        [2] = { id = invaderXim.ki.MOOCHING,        rank = invaderXim.craftRank.VETERAN, cost = 115000 },
        [3] = { id = invaderXim.ki.ANGLERS_ALMANAC, rank = invaderXim.craftRank.VETERAN, cost =  20000 },
    },
    [invaderXim.guild.WOODWORKING] =
    {
        [0] = { id = invaderXim.ki.WOOD_PURIFICATION,    rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [1] = { id = invaderXim.ki.WOOD_ENSORCELLMENT,   rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [2] = { id = invaderXim.ki.LUMBERJACK,           rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [3] = { id = invaderXim.ki.BOLTMAKER,            rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [4] = { id = invaderXim.ki.WAY_OF_THE_CARPENTER, rank = invaderXim.craftRank.VETERAN, cost = 20000 },
    },
    [invaderXim.guild.SMITHING] =
    {
        [0] = { id = invaderXim.ki.METAL_PURIFICATION,    rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [1] = { id = invaderXim.ki.METAL_ENSORCELLMENT,   rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [2] = { id = invaderXim.ki.CHAINWORK,             rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [3] = { id = invaderXim.ki.SHEETING,              rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [4] = { id = invaderXim.ki.WAY_OF_THE_BLACKSMITH, rank = invaderXim.craftRank.VETERAN, cost = 20000 },
    },
    [invaderXim.guild.GOLDSMITHING] =
    {
        [0] = { id = invaderXim.ki.GOLD_PURIFICATION,    rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [1] = { id = invaderXim.ki.GOLD_ENSORCELLMENT,   rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [2] = { id = invaderXim.ki.CHAINWORK,            rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [3] = { id = invaderXim.ki.SHEETING,             rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [4] = { id = invaderXim.ki.CLOCKMAKING,          rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [5] = { id = invaderXim.ki.WAY_OF_THE_GOLDSMITH, rank = invaderXim.craftRank.VETERAN, cost = 20000 },
    },
    [invaderXim.guild.CLOTHCRAFT] =
    {
        [0] = { id = invaderXim.ki.CLOTH_PURIFICATION,  rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [1] = { id = invaderXim.ki.CLOTH_ENSORCELLMENT, rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [2] = { id = invaderXim.ki.SPINNING,            rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [3] = { id = invaderXim.ki.FLETCHING,           rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [4] = { id = invaderXim.ki.WAY_OF_THE_WEAVER,   rank = invaderXim.craftRank.VETERAN, cost = 20000 },
    },
    [invaderXim.guild.LEATHERCRAFT] =
    {
        [0] = { id = invaderXim.ki.LEATHER_PURIFICATION,  rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [1] = { id = invaderXim.ki.LEATHER_ENSORCELLMENT, rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [2] = { id = invaderXim.ki.TANNING,               rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [3] = { id = invaderXim.ki.WAY_OF_THE_TANNER,     rank = invaderXim.craftRank.VETERAN, cost = 20000 },
    },
    [invaderXim.guild.BONECRAFT] =
    {
        [0] = { id = invaderXim.ki.BONE_PURIFICATION,     rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [1] = { id = invaderXim.ki.BONE_ENSORCELLMENT,    rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [2] = { id = invaderXim.ki.FILING,                rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [3] = { id = invaderXim.ki.WAY_OF_THE_BONEWORKER, rank = invaderXim.craftRank.VETERAN, cost = 20000 },
    },
    [invaderXim.guild.ALCHEMY] =
    {
        [0] = { id = invaderXim.ki.ANIMA_SYNTHESIS,        rank = invaderXim.craftRank.NOVICE,  cost = 20000 },
        [1] = { id = invaderXim.ki.ALCHEMIC_PURIFICATION,  rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [2] = { id = invaderXim.ki.ALCHEMIC_ENSORCELLMENT, rank = invaderXim.craftRank.NOVICE,  cost = 40000 },
        [3] = { id = invaderXim.ki.TRITURATION,            rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [4] = { id = invaderXim.ki.CONCOCTION,             rank = invaderXim.craftRank.NOVICE,  cost = 20000 },
        [5] = { id = invaderXim.ki.IATROCHEMISTRY,         rank = invaderXim.craftRank.NOVICE,  cost = 10000 },
        [6] = { id = invaderXim.ki.WAY_OF_THE_ALCHEMIST,   rank = invaderXim.craftRank.VETERAN, cost = 20000 },
    },
    [invaderXim.guild.COOKING] =
    {
        [0] = { id = invaderXim.ki.RAW_FISH_HANDLING,     rank = invaderXim.craftRank.NOVICE,  cost = 30000 },
        [1] = { id = invaderXim.ki.NOODLE_KNEADING,       rank = invaderXim.craftRank.NOVICE,  cost = 30000 },
        [2] = { id = invaderXim.ki.PATISSIER,             rank = invaderXim.craftRank.NOVICE,  cost =  8000 },
        [3] = { id = invaderXim.ki.STEWPOT_MASTERY,       rank = invaderXim.craftRank.NOVICE,  cost = 30000 },
        [4] = { id = invaderXim.ki.WAY_OF_THE_CULINARIAN, rank = invaderXim.craftRank.VETERAN, cost = 20000 },
    },
}

local guildItemTable =
{
    [invaderXim.guild.FISHING] =
    {
        [0] = { id = invaderXim.item.FISHERMANS_BELT,      rank = invaderXim.craftRank.APPRENTICE, cost =  10000 },
        [1] = { id = invaderXim.item.WADERS,               rank = invaderXim.craftRank.JOURNEYMAN, cost =  70000 },
        [2] = { id = invaderXim.item.FISHERMANS_APRON,     rank = invaderXim.craftRank.ARTISAN,    cost = 100000 },
        [3] = { id = invaderXim.item.FISHING_HOLE_MAP,     rank = invaderXim.craftRank.VETERAN,    cost = 150000 },
        [4] = { id = invaderXim.item.FISHERMANS_SIGNBOARD, rank = invaderXim.craftRank.VETERAN,    cost = 200000 },
        -- There is a blank space here. Robber Rig SHOULD be here, but it isnt. It's with the crystals.
        [6] = { id = invaderXim.item.NET_AND_LURE,         rank = invaderXim.craftRank.ARTISAN,    cost =  50000 },
        [7] = { id = invaderXim.item.FISHERMENS_EMBLEM,    rank = invaderXim.craftRank.VETERAN,    cost =  15000 },
    },
    [invaderXim.guild.WOODWORKING] =
    {
        [0] = { id = invaderXim.item.CARPENTERS_BELT,      rank = invaderXim.craftRank.NOVICE,     cost =  10000 },
        [1] = { id = invaderXim.item.CARPENTERS_GLOVES,    rank = invaderXim.craftRank.JOURNEYMAN, cost =  70000 },
        [2] = { id = invaderXim.item.CARPENTERS_APRON,     rank = invaderXim.craftRank.ARTISAN,    cost = 100000 },
        [3] = { id = invaderXim.item.DRAWING_DESK,         rank = invaderXim.craftRank.VETERAN,    cost = 150000 },
        [4] = { id = invaderXim.item.CARPENTERS_SIGNBOARD, rank = invaderXim.craftRank.VETERAN,    cost = 200000 },
        [5] = { id = invaderXim.item.CARPENTERS_RING,      rank = invaderXim.craftRank.CRAFTSMAN,  cost =  80000 },
        [6] = { id = invaderXim.item.CARPENTERS_KIT,       rank = invaderXim.craftRank.ARTISAN,    cost =  50000 },
        [7] = { id = invaderXim.item.CARPENTERS_EMBLEM,    rank = invaderXim.craftRank.VETERAN,    cost =  15000 },
    },
    [invaderXim.guild.SMITHING] =
    {
        [0] = { id = invaderXim.item.BLACKSMITHS_BELT,      rank = invaderXim.craftRank.NOVICE,     cost =  10000 },
        [1] = { id = invaderXim.item.SMITHYS_MITTS,         rank = invaderXim.craftRank.JOURNEYMAN, cost =  70000 },
        [2] = { id = invaderXim.item.BLACKSMITHS_APRON,     rank = invaderXim.craftRank.ARTISAN,    cost = 100000 },
        [3] = { id = invaderXim.item.MASTERSMITH_ANVIL,     rank = invaderXim.craftRank.VETERAN,    cost = 150000 },
        [4] = { id = invaderXim.item.BLACKSMITHS_SIGNBOARD, rank = invaderXim.craftRank.VETERAN,    cost = 200000 },
        [5] = { id = invaderXim.item.SMITHS_RING,           rank = invaderXim.craftRank.CRAFTSMAN,  cost =  80000 },
        [6] = { id = invaderXim.item.STONE_HEARTH,          rank = invaderXim.craftRank.ARTISAN,    cost =  50000 },
        [7] = { id = invaderXim.item.BLACKSMITHS_EMBLEM,    rank = invaderXim.craftRank.VETERAN,    cost =  15000 },
    },
    [invaderXim.guild.GOLDSMITHING] =
    {
        [0] = { id = invaderXim.item.GOLDSMITHS_BELT,      rank = invaderXim.craftRank.NOVICE,     cost =  10000 },
        [1] = { id = invaderXim.item.SHADED_SPECTACLES,    rank = invaderXim.craftRank.JOURNEYMAN, cost =  70000 },
        [2] = { id = invaderXim.item.GOLDSMITHS_APRON,     rank = invaderXim.craftRank.ARTISAN,    cost = 100000 },
        [3] = { id = invaderXim.item.STACK_OF_FOOLS_GOLD,  rank = invaderXim.craftRank.VETERAN,    cost = 150000 },
        [4] = { id = invaderXim.item.GOLDSMITHS_SIGNBOARD, rank = invaderXim.craftRank.VETERAN,    cost = 200000 },
        [5] = { id = invaderXim.item.GOLDSMITHS_RING,      rank = invaderXim.craftRank.CRAFTSMAN,  cost =  80000 },
        [6] = { id = invaderXim.item.GEMSCOPE,             rank = invaderXim.craftRank.ARTISAN,    cost =  50000 },
        [7] = { id = invaderXim.item.GOLDSMITHS_EMBLEM,    rank = invaderXim.craftRank.VETERAN,    cost =  15000 },
    },
    [invaderXim.guild.CLOTHCRAFT] =
    {
        [0] = { id = invaderXim.item.WEAVERS_BELT,          rank = invaderXim.craftRank.NOVICE,     cost =  10000 },
        [1] = { id = invaderXim.item.MAGNIFYING_SPECTACLES, rank = invaderXim.craftRank.JOURNEYMAN, cost =  70000 },
        [2] = { id = invaderXim.item.WEAVERS_APRON,         rank = invaderXim.craftRank.ARTISAN,    cost = 100000 },
        [3] = { id = invaderXim.item.GILT_TAPESTRY,         rank = invaderXim.craftRank.VETERAN,    cost = 150000 },
        [4] = { id = invaderXim.item.WEAVERS_SIGNBOARD,     rank = invaderXim.craftRank.VETERAN,    cost = 200000 },
        [5] = { id = invaderXim.item.TAILORS_RING,          rank = invaderXim.craftRank.CRAFTSMAN,  cost =  80000 },
        [6] = { id = invaderXim.item.SPINNING_WHEEL,        rank = invaderXim.craftRank.ARTISAN,    cost =  50000 },
        [7] = { id = invaderXim.item.WEAVERS_EMBLEM,        rank = invaderXim.craftRank.VETERAN,    cost =  15000 },
    },
    [invaderXim.guild.LEATHERCRAFT] =
    {
        [0] = { id = invaderXim.item.TANNERS_BELT,      rank = invaderXim.craftRank.NOVICE,     cost =  10000 },
        [1] = { id = invaderXim.item.TANNERS_GLOVES,    rank = invaderXim.craftRank.JOURNEYMAN, cost =  70000 },
        [2] = { id = invaderXim.item.TANNERS_APRON,     rank = invaderXim.craftRank.ARTISAN,    cost = 100000 },
        [3] = { id = invaderXim.item.GOLDEN_FLEECE,     rank = invaderXim.craftRank.VETERAN,    cost = 150000 },
        [4] = { id = invaderXim.item.TANNERS_SIGNBOARD, rank = invaderXim.craftRank.VETERAN,    cost = 200000 },
        [5] = { id = invaderXim.item.TANNERS_RING,      rank = invaderXim.craftRank.CRAFTSMAN,  cost =  80000 },
        [6] = { id = invaderXim.item.HIDE_STRETCHER,    rank = invaderXim.craftRank.ARTISAN,    cost =  50000 },
        [7] = { id = invaderXim.item.TANNERS_EMBLEM,    rank = invaderXim.craftRank.VETERAN,    cost =  15000 },
    },
    [invaderXim.guild.BONECRAFT] =
    {
        [0] = { id = invaderXim.item.BONEWORKERS_BELT,          rank = invaderXim.craftRank.NOVICE,     cost =  10000 },
        [1] = { id = invaderXim.item.PROTECTIVE_SPECTACLES,     rank = invaderXim.craftRank.JOURNEYMAN, cost =  70000 },
        [2] = { id = invaderXim.item.BONEWORKERS_APRON,         rank = invaderXim.craftRank.ARTISAN,    cost = 100000 },
        [3] = { id = invaderXim.item.DROGAROGAS_FANG,           rank = invaderXim.craftRank.VETERAN,    cost = 150000 },
        [4] = { id = invaderXim.item.BONEWORKERS_SIGNBOARD,     rank = invaderXim.craftRank.VETERAN,    cost = 200000 },
        [5] = { id = invaderXim.item.BONECRAFTERS_RING,         rank = invaderXim.craftRank.CRAFTSMAN,  cost =  80000 },
        [6] = { id = invaderXim.item.SET_OF_BONECRAFTING_TOOLS, rank = invaderXim.craftRank.ARTISAN,    cost =  50000 },
        [7] = { id = invaderXim.item.BONEWORKERS_EMBLEM,        rank = invaderXim.craftRank.VETERAN,    cost =  15000 },
    },
    [invaderXim.guild.ALCHEMY] =
    {
        [0] = { id = invaderXim.item.ALCHEMISTS_BELT,      rank = invaderXim.craftRank.NOVICE,     cost =  10000 },
        [1] = { id = invaderXim.item.CADUCEUS,             rank = invaderXim.craftRank.JOURNEYMAN, cost =  70000 },
        [2] = { id = invaderXim.item.ALCHEMISTS_APRON,     rank = invaderXim.craftRank.ARTISAN,    cost = 100000 },
        [3] = { id = invaderXim.item.COPY_OF_EMERALDA,     rank = invaderXim.craftRank.VETERAN,    cost = 150000 },
        [4] = { id = invaderXim.item.ALCHEMISTS_SIGNBOARD, rank = invaderXim.craftRank.VETERAN,    cost = 200000 },
        [5] = { id = invaderXim.item.ALCHEMISTS_RING,      rank = invaderXim.craftRank.CRAFTSMAN,  cost =  80000 },
        [6] = { id = invaderXim.item.ALEMBIC,              rank = invaderXim.craftRank.ARTISAN,    cost =  50000 },
        [7] = { id = invaderXim.item.ALCHEMISTS_EMBLEM,    rank = invaderXim.craftRank.VETERAN,    cost =  15000 },
    },
    [invaderXim.guild.COOKING] =
    {
        [0] = { id = invaderXim.item.CULINARIANS_BELT,        rank = invaderXim.craftRank.NOVICE,     cost =  10000 },
        [1] = { id = invaderXim.item.CHEFS_HAT,               rank = invaderXim.craftRank.JOURNEYMAN, cost =  70000 },
        [2] = { id = invaderXim.item.CULINARIANS_APRON,       rank = invaderXim.craftRank.ARTISAN,    cost = 100000 },
        [3] = { id = invaderXim.item.CORDON_BLEU_COOKING_SET, rank = invaderXim.craftRank.VETERAN,    cost = 150000 },
        [4] = { id = invaderXim.item.CULINARIANS_SIGNBOARD,   rank = invaderXim.craftRank.VETERAN,    cost = 200000 },
        [5] = { id = invaderXim.item.CHEFS_RING,              rank = invaderXim.craftRank.CRAFTSMAN,  cost =  80000 },
        [6] = { id = invaderXim.item.BRASS_CROCK,             rank = invaderXim.craftRank.ARTISAN,    cost =  50000 },
        [7] = { id = invaderXim.item.CULINARIANS_EMBLEM,      rank = invaderXim.craftRank.VETERAN,    cost =  15000 },
    },
}

local function calculateKeyItemBitmask(player, rank, keyItemTable)
    local keyItemBits = 0

    for currentBit, keyItem in pairs(keyItemTable) do
        if rank >= keyItem.rank then
            if not player:hasKeyItem(keyItem.id) then
                keyItemBits = bit.bor(keyItemBits, bit.lshift(1, currentBit))
            end
        end
    end

    return keyItemBits
end

-----------------------------------
-- NPC Events
-----------------------------------
invaderXim.crafting.guildPointOnTrade = function(player, npc, trade, csid, guildId)
    local ID                 = zones[player:getZoneID()]
    local _, remainingPoints = player:getCurrentGPItem(guildId)

    if player:getCharVar('[GUILD]currentGuild') - 1 == guildId then
        if remainingPoints == 0 then
            player:messageText(npc, ID.text.NO_MORE_GP_ELIGIBLE)
        else
            local totalPoints = 0
            for tradeSlot = 0, 8 do
                local items, points = player:addGuildPoints(guildId, tradeSlot)

                if items ~= 0 and points ~= 0 then
                    totalPoints = totalPoints + points
                    trade:confirmSlot(tradeSlot, items)
                end
            end

            if totalPoints > 0 then
                player:confirmTrade()
                player:startEvent(csid, totalPoints)
            end
        end
    end
end

invaderXim.crafting.guildPointOnTrigger = function(player, csid, guildId)
    local currency                = invaderXim.crafting.guildTable[guildId][2]
    local gpItem, remainingPoints = player:getCurrentGPItem(guildId)
    local rank                    = player:getSkillRank(invaderXim.crafting.guildTable[guildId][1])
    local skillCap                = (rank + 1) * 10
    local keyItemBits             = calculateKeyItemBitmask(player, rank, guildKeyItemTable[guildId])

    player:startEvent(csid, player:getCurrency(currency), player:getCharVar('[GUILD]currentGuild') - 1, gpItem, remainingPoints, skillCap, 0, keyItemBits, 0)
end

invaderXim.crafting.guildPointOnEventUpdate = function(player, option, target, guildId)
    local category           = bit.band(bit.rshift(option, 2), 3)

    local ID                 = zones[player:getZoneID()]
    local _, remainingPoints = player:getCurrentGPItem(guildId)
    local rank               = player:getSkillRank(invaderXim.crafting.guildTable[guildId][1])
    local skillCap           = (rank + 1) * 10
    local currency           = invaderXim.crafting.guildTable[guildId][2]
    local keyItems           = guildKeyItemTable[guildId]

    -- GP Key Item Option.
    if category == 3 then
        local keyItem = keyItems[bit.band(bit.rshift(option, 5), 15) - 1]

        if keyItem and rank >= keyItem.rank then
            if player:getCurrency(currency) >= keyItem.cost then
                player:delCurrency(currency, keyItem.cost)
                npcUtil.giveKeyItem(player, keyItem.id)
            else
                player:messageText(target, ID.text.NOT_HAVE_ENOUGH_GP, false, 6)
            end
        end

        player:updateEvent(player:getCurrency(currency), player:getCharVar('[GUILD]currentGuild') - 1, keyItem.cost, remainingPoints, skillCap, 0, calculateKeyItemBitmask(player, rank, guildKeyItemTable[guildId]), 1)

    -- GP Item Option.
    elseif category == 2 or category == 1 then
        local index    = bit.band(option, 3)
        local items    = guildItemTable[guildId]
        local item     = items[(category - 1) * 4 + index]
        local quantity = math.min(bit.rshift(option, 9), 12)
        local cost     = quantity * item.cost

        if item and rank >= item.rank then
            if player:getCurrency(currency) >= cost then
                local delivered = 0

                for count = 1, quantity do -- addItem does not appear to honor quantity if the item doesn't stack.
                    if player:addItem(item.id, true) then
                        player:delCurrency(currency, item.cost)
                        player:messageSpecial(ID.text.ITEM_OBTAINED, item.id)
                        delivered = delivered + 1
                    end
                end

                if delivered == 0 then
                    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, item.id)
                end
            else
                player:messageText(target, ID.text.NOT_HAVE_ENOUGH_GP, false, 6)
            end
        end

        player:updateEvent(player:getCurrency(currency), player:getCharVar('[GUILD]currentGuild') - 1, item.cost, remainingPoints, skillCap, 0, calculateKeyItemBitmask(player, rank, guildKeyItemTable[guildId]), 1)

    -- HQ crystal Option.
    elseif
        category == 0 and
        option ~= utils.EVENT_CANCELLED_OPTION
    then
        local crystal  = hqCrystals[bit.band(bit.rshift(option, 5), 15)]
        local quantity = bit.rshift(option, 9)
        local cost     = quantity * crystal.cost

        if crystal and rank >= 3 then
            if
                player:getCurrency(currency) >= cost and
                npcUtil.giveItem(player, { { crystal.id, quantity } })
            then
                player:delCurrency(currency, cost)
            else
                player:messageText(target, ID.text.NOT_HAVE_ENOUGH_GP, false, 6)
            end
        end

        player:updateEvent(player:getCurrency(currency), player:getCharVar('[GUILD]currentGuild') - 1, crystal.cost, remainingPoints, skillCap, 0, calculateKeyItemBitmask(player, rank, guildKeyItemTable[guildId]), 1)
    end
end

invaderXim.crafting.guildPointOnEventFinish = function(player, option, guildId)
    local ID   = zones[player:getZoneID()]
    local rank = player:getSkillRank(invaderXim.crafting.guildTable[guildId][1])

    -- Contract Dialog.
    if bit.tobit(option) == -1 and rank >= 3 then
        local oldGuild = player:getCharVar('[GUILD]currentGuild') - 1
        player:setCharVar('[GUILD]currentGuild', guildId + 1)

        if oldGuild == -1 then
            player:messageSpecial(ID.text.GUILD_NEW_CONTRACT, guildId)
        else
            player:messageSpecial(ID.text.GUILD_TERMINATE_CONTRACT, guildId, oldGuild)
            player:setCharVar('[GUILD]daily_points', 1)
        end
    end
end
