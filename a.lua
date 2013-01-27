local ply = LocalPlayer()

local mag_left = ply:GetActiveWeapon():Clip1()
local mag_extra = ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())
local secondary_ammo = ply:GetAmmoCount(ply:GetActiveWeapon():GetSecondaryAmmoType())

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

if(ply:GetActiveWeapon().Primary)then
  ammobar = mag_left / ply:GetActiveWeapon().Primary.ClipSize * 180
  Text = mag_left .." / ".. mag_extra .." AMMO"
else
  ammobar = mag_left / MaxAmmo[ ply:GetActiveWeapon():GetClass() ] * 180
  Text = "NO AMMO"
end

draw.RoundedBox( 0, ScrW() - 360, ScrH() - 80, ammobar, 10, Color( 255, 160, 0, 254 ) )
draw.SimpleText( Text, "Arial", ScrW()-180, ScrH()-40, Color( 255, 255, 255, 254 ), 1)
