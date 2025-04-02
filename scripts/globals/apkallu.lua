xi = xi or {}
invaderXim.apkallu = invaderXim.apkallu or {}
invaderXim.apkallu.zones = invaderXim.apkallu.zones or {}

invaderXim.apkallu.fish =
{
    invaderXim.item.AHTAPOT,
    invaderXim.item.VEYDAL_WRASSE,
    invaderXim.item.YAYINBALIGI,
}

invaderXim.apkallu.track = function(mob)
    local zoneID = mob:getZoneID()
    invaderXim.apkallu.zones[zoneID] = invaderXim.apkallu.zones[zoneID] or {}
    table.insert(invaderXim.apkallu.zones[zoneID], mob)
end

invaderXim.apkallu.initialize = function(mob)
    local zoneID = mob:getZoneID()
    local ID     = zones[zoneID]
    local hate   = GetServerVariable('ApkalluHate_'..zoneID)
    local tier   = invaderXim.apkallu.getHateTier(hate)

    if tier == 0 and mob:getID() == ID.mob.APKALLU_NPC then
        -- Convert this Apkallu into an NPC
        mob:setStatus(invaderXim.status.NORMAL)
    elseif tier == 2 then
        -- Apkallu now aggro by sight
        mob:setAggressive(true)
    end

    if tier ~= 3 then
        -- Apkallu should not link
        mob:setLink(0)
    end

    local reduction = utils.clamp((hate - 5) * 100, 0, 9500)
    mob:setMod(invaderXim.mod.DMGPHYS, -reduction)
    mob:setMod(invaderXim.mod.DMGRANGE, -reduction)
    mob:setMod(invaderXim.mod.DMGMAGIC, -reduction)
end

invaderXim.apkallu.updateHate = function(zoneID, amount)
    local ID               = zones[zoneID]
    local previousHate     = GetServerVariable('ApkalluHate_'..zoneID)
    local hate             = previousHate + amount
    local shouldCheckTiers = true
    if hate > 100 then
        hate = 100
        shouldCheckTiers = false
    elseif hate < 0 then
        hate = 0
        shouldCheckTiers = false
    end

    SetServerVariable('ApkalluHate_'..zoneID, hate)

    if not shouldCheckTiers then
        return
    end

    local apkallus = invaderXim.apkallu.zones[zoneID]
    if apkallus == nil then
        return
    end

    local previousTier = invaderXim.apkallu.getHateTier(previousHate)
    local currentTier  = invaderXim.apkallu.getHateTier(hate)
    if currentTier ~= previousTier then
        if amount > 0 then
            if currentTier == 1 then
                -- Change NPC Apkallu back to mobs
                GetMobByID(ID.mob.APKALLU_NPC):setStatus(invaderXim.status.UPDATE)
            elseif currentTier == 2 then
                -- Apkallu now aggro by sight
                for _, mob in ipairs(apkallus) do
                    mob:setAggressive(true)
                end
            elseif currentTier == 3 then
                -- Apkallu now link
                for _, mob in ipairs(apkallus) do
                    mob:setLink(1)
                    mob:setLocalVar('RunAway', 1)
                end
            end
        else
            if currentTier == 0 then
                -- Change Apkallu to NPC
                GetMobByID(ID.mob.APKALLU_NPC):setStatus(invaderXim.status.NORMAL)
            elseif currentTier == 1 then
                -- Apkallu no longer aggro by sight
                for _, mob in ipairs(apkallus) do
                    mob:setAggressive(false)
                end
            elseif currentTier == 2 then
                -- Apkallu no longer link
                for _, mob in ipairs(apkallus) do
                    mob:setLink(0)
                    mob:setLocalVar('RunAway', 0)
                end
            end
        end
    end

    local reduction = utils.clamp((hate - 5) * 100, 0, 9500)
    for _, mob in ipairs(apkallus) do
        mob:setMod(invaderXim.mod.DMGPHYS, -reduction)
        mob:setMod(invaderXim.mod.DMGRANGE, -reduction)
        mob:setMod(invaderXim.mod.DMGMAGIC, -reduction)
    end
end

invaderXim.apkallu.getHateTier = function(hate)
    if hate >= 45 then
        return 3
    elseif hate >= 25 then
        return 2
    elseif hate >= 5 then
        return 1
    else
        return 0
    end
end

invaderXim.apkallu.canRunAway = function(mob)
    local zoneID = mob:getZoneID()
    local hate = GetServerVariable('ApkalluHate_'..zoneID)
    return invaderXim.apkallu.getHateTier(hate) >= 3
end

invaderXim.apkallu.canUseAbility = function(mob, threshold)
    if mob:isNM() then
        return 0
    end

    local zoneID = mob:getZoneID()
    if
        (zoneID == invaderXim.zone.ARRAPAGO_REEF or zoneID == invaderXim.zone.MOUNT_ZHAYOLM) and
        GetServerVariable('ApkalluHate_'..zoneID) < threshold
    then
        return 1
    end

    return 0
end
