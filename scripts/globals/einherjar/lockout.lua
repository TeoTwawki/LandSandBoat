-----------------------------------
-- Einherjar: Player lockout
-----------------------------------
xi = xi or {}
invaderXim.einherjar = invaderXim.einherjar or {}

invaderXim.einherjar.recordLockout = function(player)
    local lockoutInHours = invaderXim.einherjar.settings.EINHERJAR_REENTRY_TIME
    if player:hasKeyItem(invaderXim.ki.RHAPSODY_IN_AZURE) then
        lockoutInHours = 1
    end

    local expiry = os.time() + (lockoutInHours * 60 * 60)
    player:setCharVar('[ein]lockout', expiry, expiry)
end

invaderXim.einherjar.isLockedOut = function(player)
    local lockout = player:getCharVar('[ein]lockout')
    if lockout == 0 then
        return 0
    end

    return math.ceil((lockout - os.time()) / 2088) -- Vanadiel days
end
