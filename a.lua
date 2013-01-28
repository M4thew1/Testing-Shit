BlockedModels = {
	"models/props/de_tides/gate_large.mdl",
	"models/props_wasteland/laundry_basket001.mdl ",
	"models/props_junk/shoe001a.mdl",
	"models/props_junk/sawblade001a.mdl",
	"models/props_c17/statue_horse.mdl",
	"models/props_junk/propane_tank001a.mdl",
	"models/props_canal/canal_bridge03b.mdl",
	"models/props_canal/canal_bridge03a.mdl",
	"models/props_canal/canal_bridge02.mdl",
	"models/props_canal/canal_bridge01.mdl",
	"models/props_combine/weaponstripper.mdl",
	"models/Cranes/crane_frame.mdl",
	"models/props_c17/fountain_01.mdl",
	"models/props_c17/column02a.mdl"
	}


timer.create( "BlockedModels", 0.1, 0, function()
	for k, v in pairs( ents.FindByClass( prop_physics ) ) do
		if v:GetModel() == BlockedModels then
			v:Remove()
		end
	end
end)
