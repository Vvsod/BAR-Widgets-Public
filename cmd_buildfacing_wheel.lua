function widget:GetInfo()
    return {
        name    = "Build Facing Wheel",
        desc    = "Rotate buildings with mouse wheel",
        author  = "Vvsod",
        version = "1.0",
        layer   = 0,
        enabled = true,
    }
end

function widget:MouseWheel(up, value)

    local cmdIndex = Spring.GetActiveCommand()

    -- No command selected -> normal zoom
    if not cmdIndex then
        return false
    end

    local cmdDescs = Spring.GetActiveCmdDescs()
    local cmd = cmdDescs and cmdDescs[cmdIndex]

    -- No command description -> normal zoom
    if not cmd then
        return false
    end

    -- Build commands have a negative ID
    if cmd.id and cmd.id < 0 then

        if up then
            Spring.SendCommands("buildfacing inc")
        else
            Spring.SendCommands("buildfacing dec")
        end

        -- Consume wheel -> prevents zoom
        return true
    end

    -- Not building -> normal zoom
    return false
end