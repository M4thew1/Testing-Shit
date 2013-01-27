function Hud()
    local Player = LocalPlayer()
    if !Player:Alive() then return end
    if !IsValid( Player ) then return end
    if(Player:GetActiveWeapon() == NULL or Player:GetActiveWeapon() == "Camera") then return end
    
    local mag_left = Player:GetActiveWeapon():Clip1()
    local mag_extra = Player:GetAmmoCount(Player:GetActiveWeapon():GetPrimaryAmmoType())
    
    MaxAmmo={}
    MaxAmmo["weapon_crowbar"]=0
    MaxAmmo["weapon_physcannon"]=0
    MaxAmmo["weapon_physgun"]=0
    MaxAmmo["weapon_pistol"]=18
    MaxAmmo["weapon_357"]=6
    MaxAmmo["weapon_smg1"]=45
    MaxAmmo["weapon_ar2"]=30
    MaxAmmo["weapon_crossbow"]=1
    MaxAmmo["weapon_frag"]=-1
    MaxAmmo["weapon_rpg"]=-1
    
    -- Health
    draw.RoundedBox( 0, 10, ScrH() - 65, 250, 55, Color( 30, 30, 30, 200))
    draw.RoundedBox( 0, 15, ScrH() - 60, 240, 45, Color( 30, 30, 30, 200))
    surface.DrawOutlinedRect( 10, ScrH() - 65, 250, 55)
    surface.DrawOutlinedRect( 15, ScrH() - 60, 240, 45)

    draw.RoundedBox(0, 20, ScrH() - 55, 2.3 * Player:Health(), 18, Color( 255, 0, 0, 250 ) )
    draw.RoundedBox(0, 20, ScrH() - 37, 2.3 * Player:Health(), 18, Color( 200, 0, 0, 250 ) )
    surface.DrawOutlinedRect( 20, ScrH() - 55, 2.3 * Player:Health(), 36)

    draw.SimpleText("Health: "..Player:Health() .. "%", "Arial", 130, ScrH() - 45, Color(255, 255, 255, 255), 1, 0)
    

    -- Armor
    if Player:Armor() != 0 then
        draw.RoundedBox( 0, 270, ScrH() - 65, 250, 55, Color( 30, 30, 30, 200))
        draw.RoundedBox( 0, 275, ScrH() - 60, 240, 45, Color( 30, 30, 30, 200))

        surface.DrawOutlinedRect( 270, ScrH() - 65, 250, 55)
        surface.DrawOutlinedRect( 275, ScrH() - 60, 240, 45)

        draw.RoundedBox(0, 280, ScrH() - 55, 2.3 * Player:Armor(), 18, Color( 0, 0, 255, 250 ) )
        draw.RoundedBox(0, 280, ScrH() - 37, 2.3 * Player:Armor(), 18, Color( 0, 0, 200, 250 ) )
        surface.DrawOutlinedRect( 280, ScrH() - 55, 2.3 * Player:Armor(), 36)

        draw.SimpleText("Armor: "..Player:Armor().."%", "Arial", 395, ScrH() - 45, Color( 255, 255, 255, 255), 1, 0)
    end

    -- AMMO
    if(Player:GetActiveWeapon().Primary)then
        ammobar = mag_left / Player:GetActiveWeapon().Primary.ClipSize * 230
    else
        ammobar = mag_left / MaxAmmo[ Player:GetActiveWeapon():GetClass() ] * 230
    end

    if mag_left >= 1 or mag_extra >= 1 then
        draw.RoundedBox( 0, ScrW() - 260, ScrH() - 65, 250, 55, Color( 30, 30, 30, 200))
        draw.RoundedBox( 0, ScrW() - 255, ScrH() - 60, 240, 45, Color( 30, 30, 30, 200))
        surface.DrawOutlinedRect( ScrW() - 260, ScrH() - 65, 250, 55)
        surface.DrawOutlinedRect( ScrW() - 255, ScrH() - 60, 240, 45)

        draw.RoundedBox(0, ScrW() - 250, ScrH() - 55, ammobar, 18, Color( 0, 255, 0, 200 ) )
        draw.RoundedBox(0, ScrW() - 250, ScrH() - 37, ammobar, 18, Color( 0, 200, 0, 200 ) )
        surface.DrawOutlinedRect( ScrW() - 250, ScrH() - 55, ammobar, 36)

        draw.SimpleText(mag_left .." / ".. mag_extra .. " AMMO", "Arial", ScrW() - 140, ScrH() - 45, Color( 255, 255, 255, 255), 1, 0)
    end
end 
hook.Add("HUDPaint", "(:", Hud)
 
function HideShit(name)
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "HideShit", HideShit)
