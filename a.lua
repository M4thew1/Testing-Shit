timer.Create( "SpawnCheck", 0.1, 0, function()
	for k, v in pairs( ents.FindInSphere( Vector( -1505, -1179, 128 ), 20 ) ) do
		for m, n in pairs( ents.FindByClass( prop_physics ) ) do
			n:Remove()
		end
	end
end )
