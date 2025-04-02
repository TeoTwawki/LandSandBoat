-----------------------------------
-- Einherjar: Treasure Generation
-----------------------------------
local ID = zones[invaderXim.zone.HAZHALM_TESTING_GROUNDS]

local bossDrops = {
    -- Wing 1
    [ID.mob.HAKENMANN] =
    {
        { item = invaderXim.item.CHUNK_OF_OROBON_MEAT, rate = 1000 },
    },
    [ID.mob.HILDESVINI] =
    {
        { item = invaderXim.item.MARID_HIDE,         rate = 1000 },
        { item = invaderXim.item.MARID_HIDE,         rate = 1000 },
        { item = invaderXim.item.LOCK_OF_MARID_HAIR, rate = 1000 },
    },
    [ID.mob.HIMINRJOT] =
    {
        { item = invaderXim.item.BUFFALO_HIDE,          rate = 1000 },
        { item = invaderXim.item.SLICE_OF_BUFFALO_MEAT, rate = 1000 },
    },
    [ID.mob.HRAESVELG] =
    {
        { item = invaderXim.item.MANTICORE_FANG,         rate = 1000 },
        { item = invaderXim.item.LOCK_OF_MANTICORE_HAIR, rate = 1000 },
        { item = invaderXim.item.MANTICORE_HIDE,         rate = 1000 },
    },
    [ID.mob.MORBOL_EMPEROR] =
    {
        { item = invaderXim.item.AMERETAT_VINE,    rate = 1000 },
        { item = invaderXim.item.LACQUER_TREE_LOG, rate = 1000 },
    },
    [ID.mob.NIHHUS] =
    {
        { item = invaderXim.item.WIVRE_HORN, rate = 1000 },
        { item = invaderXim.item.WIVRE_HIDE, rate = 1000 },
        { item = invaderXim.item.WIVRE_MAUL, rate = 1000 },
    },

    -- Wing 2
    [ID.mob.ANDHRIMNIR] =
    {
        { item = invaderXim.item.CORSE_BRACELET, rate = 1000 },
        { item = invaderXim.item.CORSE_ROBE,     rate = 1000 },
        { item = invaderXim.item.CORSE_BRACELET, rate = 1000 },
    },
    [ID.mob.ARIRI_SAMARIRI] =
    {
        { item = invaderXim.item.POROGGO_HAT, rate = 1000 },
        { item = invaderXim.item.POROGGO_HAT, rate = 1000 },
        { item = invaderXim.item.POROGGO_HAT, rate = 1000 },
    },
    [ID.mob.BALRAHN] =
    {
        { item = invaderXim.item.SOULFLAYER_TENTACLE, rate = 1000 },
        { item = invaderXim.item.SOULFLAYER_STAFF,    rate = 1000 },
        { item = invaderXim.item.SOULFLAYER_ROBE,     rate = 1000 },
    },
    [ID.mob.HRUNGNIR] =
    {
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE, rate = 1000 },
        { item = invaderXim.item.GOLEM_SHARD,          rate = 1000 },
        { item = invaderXim.item.GOLEM_SHARD,          rate = 1000 },
    },
    [ID.mob.MOKKURALFI] =
    {
        { item = invaderXim.item.CHUNK_OF_FLAN_MEAT, rate = 1000 },
        { item = invaderXim.item.CHUNK_OF_FLAN_MEAT, rate = 1000 },
        { item = invaderXim.item.CHUNK_OF_FLAN_MEAT, rate = 1000 },
    },
    [ID.mob.TANNGRISNIR] =
    {
        { item = invaderXim.item.HANDFUL_OF_DRAGON_SCALES, rate = 1000 },
        { item = invaderXim.item.HANDFUL_OF_DRAGON_SCALES, rate = 1000 },
        { item = invaderXim.item.DRAGON_TALON,             rate = 1000 },
    },

    -- Wing 3
    [ID.mob.DENDAINSONNE] =
    {
        { item = invaderXim.item.BEHEMOTH_HORN, rate = 1000 },
    },
    [ID.mob.FREKE] =
    {
        { item = invaderXim.item.SLICE_OF_CERBERUS_MEAT, rate = 1000 },
        { item = invaderXim.item.CERBERUS_CLAW,          rate =   50 }, -- 5% chance
    },
    [ID.mob.GORGIMERA] =
    {
        { item = invaderXim.item.KHIMAIRA_HORN, rate = 1000 },
        { item = invaderXim.item.KHIMAIRA_MANE, rate =   50 }, -- 5% chance
    },
    [ID.mob.MOTSOGNIR] =
    {
        { item = invaderXim.item.DEMON_SKULL, rate = 1000 },
    },
    [ID.mob.STOORWORM] =
    {
        { item = invaderXim.item.CHUNK_OF_HYDRA_MEAT, rate = 1000 },
    },
    [ID.mob.VAMPYR_JARL] =
    {
        { item = invaderXim.item.VIAL_OF_DRAGON_BLOOD, rate = 1000 },
    },
}

local synthMaterials =
{
    { item = invaderXim.item.GOLD_INGOT,           rate = 300, max = 4 },
    { item = invaderXim.item.PLATINUM_INGOT,       rate = 300, max = 4 },
    { item = invaderXim.item.ANGELSTONE,           rate = 100, max = 3 },
    { item = invaderXim.item.SCINTILLANT_INGOT,    rate = 100, max = 3 },
    { item = invaderXim.item.ADAMAN_INGOT,         rate =  75, max = 4 },
    { item = invaderXim.item.ORICHALCUM_INGOT,     rate =  50, max = 2 },
    { item = invaderXim.item.IMPERIAL_WOOTZ_INGOT, rate =  50, max = 3 }, -- captures show 2 max, ffo.jp claims 3
    { item = invaderXim.item.CHUNK_OF_KHROMA_ORE,  rate =  25, max = 1 }
}

local abjurations =
{
    [invaderXim.einherjar.wing.WING_1] =
    {
        invaderXim.item.HADEAN_ABJURATION_HANDS,
        invaderXim.item.HADEAN_ABJURATION_FEET,
        invaderXim.item.PHANTASMAL_ABJURATION_HANDS,
        invaderXim.item.PHANTASMAL_ABJURATION_LEGS,
        invaderXim.item.WYRMAL_ABJURATION_HEAD,
        invaderXim.item.EARTHEN_ABJURATION_LEGS,
        invaderXim.item.NEPTUNAL_ABJURATION_HEAD,
        invaderXim.item.NEPTUNAL_ABJURATION_LEGS,
        invaderXim.item.DRYADIC_ABJURATION_FEET,
    },
    [invaderXim.einherjar.wing.WING_2] =
    {
        invaderXim.item.EARTHEN_ABJURATION_HANDS,
        invaderXim.item.PHANTASMAL_ABJURATION_HEAD,
        invaderXim.item.PHANTASMAL_ABJURATION_FEET,
        invaderXim.item.HADEAN_ABJURATION_HEAD,
        invaderXim.item.HADEAN_ABJURATION_HANDS,
        invaderXim.item.NEPTUNAL_ABJURATION_LEGS,
        invaderXim.item.AQUARIAN_ABJURATION_FEET,
        invaderXim.item.WYRMAL_ABJURATION_HEAD,
        invaderXim.item.MARTIAL_ABJURATION_LEGS,
    },
    [invaderXim.einherjar.wing.WING_3] =
    {
        invaderXim.item.PHANTASMAL_ABJURATION_HEAD,
        invaderXim.item.PHANTASMAL_ABJURATION_LEGS,
        invaderXim.item.HADEAN_ABJURATION_LEGS,
        invaderXim.item.NEPTUNAL_ABJURATION_HEAD,
        invaderXim.item.AQUARIAN_ABJURATION_HANDS,
        invaderXim.item.AQUARIAN_ABJURATION_FEET,
        invaderXim.item.DRYADIC_ABJURATION_FEET,
        invaderXim.item.MARTIAL_ABJURATION_LEGS,
        invaderXim.item.MARTIAL_ABJURATION_FEET,
    }
}

-- Crafting rewards are generated based on the following steps:
-- 1. Roll to determine the number of different items (1, 2, or 3)
-- 2. Select N items based on their rates
-- 3. Apply linear decay formula to determine quantity (1-4: 40%, 30%, 20%, 10%, 1-2: 66%, 33%)
local function craftingMaterialRewards()
    local rewards = {}

    -- Step 1: Roll to determine the number of item types
    local roll     = math.random(1, 100)
    local numItems = 1  -- Default to 1 item type

    if roll <= 30 then
        numItems = 1  -- 30% chance
    elseif roll <= 95 then
        numItems = 2  -- 65% chance
    else
        numItems = 3  -- 5% chance
    end

    -- Step 2: Select N items based on their rates
    local availableMaterials = { unpack(synthMaterials) }

    for _ = 1, numItems do
        -- Roll a random number within the total rate
        local itemRoll       = math.random(1, 1000)
        local cumulativeRate = 0

        -- Select item based on the weighted roll
        for index, material in ipairs(availableMaterials) do
            cumulativeRate = cumulativeRate + material.rate
            if itemRoll <= cumulativeRate then
                -- Step 3: Apply linear decay formula to determine quantity
                local totalWeight              = material.max * (material.max + 1) / 2
                local quantityRoll             = math.random(1, totalWeight)
                local cumulativeQuantityWeight = 0
                local quantity                 = 1

                for n = 1, material.max do
                    cumulativeQuantityWeight = cumulativeQuantityWeight + (material.max + 1 - n)
                    if quantityRoll <= cumulativeQuantityWeight then
                        quantity = n
                        break
                    end
                end

                for _ = 1, quantity do
                    table.insert(rewards, material.item)
                end

                -- Remove the selected item to avoid duplicates
                table.remove(availableMaterials, index)
                break
            end
        end
    end

    return rewards
end

-- Einherjar Armoury Crate rewards generation
-- Note: Only for Wing 1-3, no crate in Odin's Chamber
invaderXim.einherjar.getArmouryCrateRewards = function(bossId, chamberId)
    local rewards = {}
    local tier    = math.ceil(chamberId / 3)

    -- 1. Boss specific drops (1-3 guaranteed items, some bosses also have non-guaranteed drops)
    for _, lootEntry in ipairs(bossDrops[bossId]) do
        -- Roll each item in the boss table
        local itemId   = lootEntry.item
        local itemRate = lootEntry.rate

        if math.random(1, 1000) <= itemRate then
            table.insert(rewards, itemId)
        end
    end

    -- 2. Crafting materials (1 (guaranteed) to 3 different types, with linear decay quantity)
    for _, item in ipairs(craftingMaterialRewards()) do
        table.insert(rewards, item)
    end

    -- 3. Wing specific abjuration (5% chance)
    if math.random(1, 100) <= 5 then
        table.insert(rewards, abjurations[tier][math.random(1, #abjurations[tier])])
    end

    -- 4. (Optional) Heithrun special rewards (not guaranteed)
    -- TODO: Not enough data to implement

    return rewards
end

invaderXim.einherjar.getAmpoulesReward = function(chamberId, defeatedCount, totalCount)
    local completionRate = defeatedCount / totalCount
    local baseReward     = invaderXim.einherjar.chambers[chamberId].ichor * invaderXim.einherjar.settings.EINHERJAR_ICHOR_RATE

    return math.floor(baseReward * completionRate)
end

invaderXim.einherjar.hideCrate = function(crateNpc)
    crateNpc:setStatus(invaderXim.status.INVISIBLE)
    crateNpc:setUntargetable(true)
end

local tempItems =
{
    { item = invaderXim.item.BOTTLE_OF_AMRITA,            min = 1,  max = 10 },
    { item = invaderXim.item.DUSTY_ELIXIR,                min = 1,  max = 10 },
    { item = invaderXim.item.DUSTY_ETHER,                 min = 12, max = 24 },
    { item = invaderXim.item.DUSTY_POTION,                min = 12, max = 24 },
    { item = invaderXim.item.DUSTY_SCROLL_OF_RERAISE,     min = 8,  max = 19 },
    { item = invaderXim.item.BOTTLE_OF_ASSASSINS_DRINK,   min = 1,  max =  4 },
    { item = invaderXim.item.BOTTLE_OF_BRAVERS_DRINK,     min = 1,  max =  2 },
    { item = invaderXim.item.BOTTLE_OF_CHAMPIONS_DRINK,   min = 1,  max =  2 },
    { item = invaderXim.item.BOTTLE_OF_CLERICS_DRINK,     min = 1,  max =  2 },
    { item = invaderXim.item.BOTTLE_OF_FANATICS_DRINK,    min = 1,  max =  6 },
    { item = invaderXim.item.BOTTLE_OF_FIGHTERS_DRINK,    min = 1,  max = 10 },
    { item = invaderXim.item.BOTTLE_OF_VICARS_DRINK,      min = 1,  max =  7 },
    { item = invaderXim.item.BOTTLE_OF_SPYS_DRINK,        min = 1,  max =  9 },
    { item = invaderXim.item.FLASK_OF_STRANGE_MILK,       min = 12, max = 24 },
    { item = invaderXim.item.BOTTLE_OF_STRANGE_JUICE,     min = 12, max = 24 },
    { item = invaderXim.item.MAX_POTION,                  min = 1,  max = 13 },
    { item = invaderXim.item.PINCH_OF_MANA_POWDER,        min = 1,  max =  3 },
    { item = invaderXim.item.REVITALIZER,                 min = 1,  max =  2 },
}

-- Generates a table of 6 random temporary items with random quantities
-- The quantity is encoded in the upper 16 bits of the returned value
invaderXim.einherjar.getTempItems = function()
    local temp = { }

    local availableTempItems = { unpack(tempItems) }

    for _ = 1, 6 do
        local roll             = math.random(1, #availableTempItems)
        local selectedTempItem = availableTempItems[roll]
        local selectedQty      = math.random(selectedTempItem.min, selectedTempItem.max)

        table.insert(temp, bit.bor(bit.lshift(selectedQty, 16), selectedTempItem.item))

        table.remove(availableTempItems, roll)
    end

    return temp
end
