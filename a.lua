if(ply:GetActiveWeapon().Primary) then
  ammobar = mag_left/ply:GetActiveWeapon().Primary.ClipSize*350
  Text = mag_left .." / ".. mag_extra .." AMMO"
elseif(mag_left <= 0) then
  Text = "NO AMMO"
  ammobar = 0
end

draw.SimpleText( Text, "Arial", ScrW()-180, ScrH()-40, Color( 255, 255, 255, 254 ), 1)
draw.RoundedBox( 6, 30, 30, 250 * ammobar, 50, Color( 255, 255, 255, 255 ), 1  )
