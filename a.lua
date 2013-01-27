surface.CreateFont( "Arial", 
{
font    = "Arial",
size    = 18,
weight  = 1000,
antialias = false,
outline = true,
shadow = false
})

function hidehud(name)
    for k, v in pairs{"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"} do
        if name == v then return false end
    end
end
hook.Add("HUDShouldDraw", "hidehud", hidehud)

function myhud()
local ply = LocalPlayer()
if !ply:Alive() then return end
if (ply:GetActiveWeapon() == nil or ply:GetActiveWeapon() == "Camera" or !ply:Alive()) then return end


local health = ply:Health()
local maxhealth = 100

local healthratio = math.Round(health*10/maxhealth)/10


draw.RoundedBox(0, 0, ScrH() - 65, 2400, 1000, Color(60, 60, 60, 200))


local TextID = surface.GetTextureID("vgui/gradient-d")
surface.SetDrawColor( 50, 50, 50, 200 )
surface.SetTexture( TextID )
surface.DrawTexturedRect( 0, 1015, 2400, 90 )

draw.RoundedBox(0, 5, 1025, 310, 50, Color(0, 0, 0, 100))
draw.RoundedBox(0, 10, 1030, 300, 40, Color(50, 50, 50, 255))
surface.SetDrawColor( 290*(1-healthratio), 200*healthratio , 0, 200 )
surface.DrawRect( 15, 1035, 290*healthratio, 30 )


draw.SimpleText("Health: " .. ply:Health() .. "%", "Arial", 120, 1040, Color(254, 254, 254, 255), 0, 0)

local weapon = ply:GetActiveWeapon()
local mag_left = ply:GetActiveWeapon():Clip1()
local mag_extra = ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())

if(ply:GetActiveWeapon().Primary or !ply:Alive())then
ammobar = mag_left/ply:GetActiveWeapon().Primary.ClipSize*350
else
ammobar = 0
end

if(mag_left and mag_extra <= 0)then
slash = " "
mag_left = "NO AMMO"
mag_extra = " "
ammo = " "
else
slash = "/"
ammo = " AMMO"
end


draw.RoundedBox( 0, ScrW() - 360, ScrH() - 80, 250 * ammobar, 10, Color( 255, 160, 0, 254 ) )
draw.SimpleText( mag_left.. slash ..mag_extra.. ammo, "Arial", ScrW()-180, ScrH()-28, Color( 255, 255, 255, 255 ), 1)
end
hook.Add("HUDPaint", "myhud", myhud)
