local textoutput = {
    ["rp_downtown_v2"] = {
        pos = Vector(-2680.464355, -2416.205078, -150.402771),
        {r = 0, g = 255, b = 255, a = 255, size = 100, Text = "Welcome to SammyServers!"},
        {r = 33, g = 255, b = 0, a = 255, size = 50, Text = "Enjoy your stay!"},
        {r = 0, g = 255, b = 255, a = 255, size = 30, Text = " "},
        {r = 255, g = 96, b = 0, a = 255, size = 40, Text = "Visit us online at SammyServers.com"},
    },
    ["rp_downtown_v2_fiend_v2c"] = {
        pos = Vector(-3089.28, -2407.61, 156.03),
        {r = 0, g = 255, b = 255, a = 255, size = 100, Text = "Welcome to SammyServers!"},
        {r = 33, g = 255, b = 0, a = 255, size = 50, Text = "Enjoy your stay!"},
        {r = 0, g = 255, b = 255, a = 255, size = 30, Text = " "},
        {r = 255, g = 96, b = 0, a = 255, size = 40, Text = "Visit us online at SammyServers.com"},
    }
}
hook.Add("InitPostEntity", "SpawnWelcomeSigns", function()
    if not textoutput[string.lower(game.GetMap())] then return end
    local textscreen = ents.Create("sammyservers_textscreen")
    textscreen:SetPos(textoutput[string.lower(game.GetMap())]['pos'])
    textscreen:SetAngles(Angle(0,0,90))
    textscreen:Spawn()
    textscreen:Activate()
    textscreen:SetMoveType(MOVETYPE_NONE)
    for k,v in pairs(textoutput[string.lower(game.GetMap())]) do
        if type(v) != "table" then continue end
        for _,o in pairs(v) do
            if o == "Text" then
                textscreen:SetNWString(_..k, o)
            else
                textscreen:SetNWInt(_..k, o)
            end
        end
    end
end)
