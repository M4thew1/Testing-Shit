if(ply:GetActiveWeapon().Primary) then
  ammobar = mag_left/ply:GetActiveWeapon().Primary.ClipSize*350
  Text = mag_left .." / ".. mag_extra .." AMMO"
elseif(mag_left <= 0) then
  Text = "NO AMMO"
  ammobar = 0
end

draw.RoundedBox( 0, ScrW() - 360, ScrH() - 80, 250 * ammobar, 10, Color( 255, 160, 0, 254 ) )
draw.SimpleText( Text, "Arial", ScrW()-180, ScrH()-40, Color( 255, 255, 255, 254 ), 1)
