-----------------------------------
-- Abyssea Sturdy Pyxis Chest
-----------------------------------
require('scripts/globals/abyssea')
require('scripts/globals/abyssea/sturdypyxis/augmented_item')
require('scripts/globals/abyssea/sturdypyxis/temporary_item')
require('scripts/globals/abyssea/sturdypyxis/keyitem')
require('scripts/globals/abyssea/sturdypyxis/item')
require('scripts/globals/abyssea/sturdypyxis/popitem')
require('scripts/globals/abyssea/sturdypyxis/cruor')
require('scripts/globals/abyssea/sturdypyxis/light')
require('scripts/globals/abyssea/sturdypyxis/experience')
require('scripts/globals/abyssea/sturdypyxis/time')
require('scripts/globals/abyssea/sturdypyxis/restore')
-----------------------------------
xi = xi or {}
invaderXim.pyxis = invaderXim.pyxis or {}

invaderXim.pyxis.chestType =
{
    BLUE = 1,
    RED  = 2,
    GOLD = 3,
}

invaderXim.pyxis.chestDropType =
{
    TEMPORARY_ITEM      = 1,
    ITEM                = 2,
    POPITEM             = 3,
    AUGMENTED_ITEM      = 4,
    KEY_ITEM            = 5,
    LIGHT               = 6,
    RESTORE             = 7,
    CRUOR               = 8,
    TIME                = 9,
    EXP                 = 10,
    NUMEROUS_TEMPITEMS  = 11
}

-----------------------------------
-- Desc: Messages sent to all players in a party in the zone
-----------------------------------
invaderXim.pyxis.canOpenChest = function(player, npc)
    local playerOwner = GetPlayerByID(npc:getLocalVar('PLAYERID'))
    local canOpen     = false

    if playerOwner then
        local ally = player:getAlliance()

        for _, member in ipairs(ally) do
            if member:getID() == playerOwner:getID() then
                canOpen = true
                break
            end
        end

        if not canOpen and playerOwner:getZoneID() ~= npc:getZoneID() then
            canOpen = true
        end

        if not canOpen then
            local ID = zones[player:getZoneID()]
            player:messageSpecial(ID.text.PARTY_NOT_OWN_CHEST)
        end
    end

    return canOpen
end

-----------------------------------
-- Desc: Messages sent to all players in a party in the zone
-----------------------------------
invaderXim.pyxis.messageChest = function(player, messageid, param1, param2, param3, param4, npc)
    local alliance = player:getAlliance()

    for _, member in ipairs(alliance) do
        if member:getZoneID() == player:getZoneID() and member:isPC() then
            member:messageName(messageid, player, param1, param2, param3, param4)
        end
    end
end

invaderXim.pyxis.isChestEmpty = function(contentsTable)
    for _, v in ipairs(contentsTable) do
        if v ~= 0 then
            return false
        end
    end

    return true
end

invaderXim.pyxis.removeChest = function(player, npc, addcruor, delay)
    local ID = zones[player:getZoneID()]
    local amount = npc:getLocalVar('TIER') * 10

    if addcruor ~= 0 then
        player:addCurrency('cruor', amount)
        player:messageSpecial(ID.text.CRUOR_OBTAINED, amount, 0, 0, 0)
    end

    npc:setUntargetable(true)
    npc:timer(delay * 1000, function(npcArg)
        npcArg:setAnimationSub(16)
        npcArg:setNpcFlags(3203)
        npcArg:setLocalVar('SPAWNSTATUS', 0)
        npcArg:setStatus(invaderXim.status.DISAPPEAR)
        npcArg:entityAnimationPacket(invaderXim.animationString.STATUS_DISAPPEAR)
        npc:setUntargetable(false)
    end)
end

invaderXim.pyxis.getDrops = function(npc, dropType, tier)
    if npc:getLocalVar('ITEMS_SET') == 1 then -- sets this to 1 so can get items once when triggered
        return
    end

    switch(dropType): caseof
    {
        [invaderXim.pyxis.chestDropType.TEMPORARY_ITEM] = function(x)
            invaderXim.pyxis.tempItem.setTempItems(npc, tier)
            npc:setLocalVar('ITEMS_SET', 1)
        end,

        [invaderXim.pyxis.chestDropType.KEY_ITEM] = function(x)
            invaderXim.pyxis.ki.setKeyItems(npc)
            npc:setLocalVar('ITEMS_SET', 1)
        end,

        [invaderXim.pyxis.chestDropType.AUGMENTED_ITEM] = function(x)
            invaderXim.pyxis.augItem.setAugmentItems(npc, tier)
            npc:setLocalVar('ITEMS_SET', 1)
        end,

        [invaderXim.pyxis.chestDropType.ITEM] = function(x)
            invaderXim.pyxis.item.setItems(npc, tier)
            npc:setLocalVar('ITEMS_SET', 1)
        end,

        [invaderXim.pyxis.chestDropType.POPITEM] = function(x)
            invaderXim.pyxis.popitem.setPopItems(npc)
            npc:setLocalVar('ITEMS_SET', 1)
        end
    }
end

invaderXim.pyxis.openChest = function(player, npc)
    local dropType = npc:getLocalVar('DROPTYPE')

    npc:setAnimationSub(13)

    switch(dropType) : caseof
    {
        [invaderXim.pyxis.chestDropType.LIGHT] = function() -- LIGHT
            invaderXim.pyxis.light.giveLight(npc, player)
            invaderXim.pyxis.removeChest(player, npc, 0, 3)
        end,

        [invaderXim.pyxis.chestDropType.RESTORE] = function() -- RESTORE HP/MP/JA
            invaderXim.pyxis.restore.giveRestore(npc, player)
            invaderXim.pyxis.removeChest(player, npc, 0, 4)
        end,

        [invaderXim.pyxis.chestDropType.CRUOR] = function() -- CRUOR
            invaderXim.pyxis.cruor.giveCruor(npc, player)
            invaderXim.pyxis.removeChest(player, npc, 0, 3)
        end,

        [invaderXim.pyxis.chestDropType.TIME] = function() -- TIME
            invaderXim.pyxis.time.giveTime(npc, player)
            invaderXim.pyxis.removeChest(player, npc, 0, 3)
        end,

        [invaderXim.pyxis.chestDropType.EXP] = function() -- EXP
            invaderXim.pyxis.exp.giveExperience(npc, player)
            invaderXim.pyxis.removeChest(player, npc, 0, 3)
        end,

        [invaderXim.pyxis.chestDropType.NUMEROUS_TEMPITEMS] = function() -- TEMPORARY ITEM
            invaderXim.pyxis.tempItem.giveTemporaryItems(npc, player)
            invaderXim.pyxis.removeChest(player, npc, 0, 3)
        end,
    }
end
