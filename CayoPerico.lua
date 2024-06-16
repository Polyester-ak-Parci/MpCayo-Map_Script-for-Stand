natives_version = "1663599433"
util.require_natives(natives_version)

local CayoIPL = {
    "h4_islandairstrip",
    "h4_islandairstrip_props",
    "h4_islandx_mansion",
    "h4_islandx_mansion_props",
    "h4_islandx_props",
    "h4_islandxdock",
    "h4_islandxdock_props",
    "h4_islandxdock_props_2",
    "h4_islandxtower",
    "h4_islandx_maindock",
    "h4_islandx_maindock_props",
    "h4_islandx_maindock_props_2",
    "h4_IslandX_Mansion_Vault",
    "h4_islandairstrip_propsb",
    "h4_beach",
    "h4_beach_props",
    "h4_beach_bar_props",
    "h4_islandx_barrack_props",
    "h4_islandx_checkpoint",
    "h4_islandx_checkpoint_props",
    "h4_islandx_Mansion_Office",
    "h4_islandx_Mansion_LockUp_01",
    "h4_islandx_Mansion_LockUp_02",
    "h4_islandx_Mansion_LockUp_03",
    "h4_islandairstrip_hangar_props",
    "h4_IslandX_Mansion_B",
    "h4_islandairstrip_doorsclosed",
    "h4_Underwater_Gate_Closed",
    "h4_mansion_gate_closed",
    "h4_aa_guns",
    "h4_IslandX_Mansion_GuardFence",
    "h4_IslandX_Mansion_Entrance_Fence",
    "h4_IslandX_Mansion_B_Side_Fence",
    "h4_IslandX_Mansion_Lights",
    "h4_islandxcanal_props",
    "h4_beach_props_party",
    "h4_islandX_Terrain_props_06_a",
    "h4_islandX_Terrain_props_06_b",
    "h4_islandX_Terrain_props_06_c",
    "h4_islandX_Terrain_props_05_a",
    "h4_islandX_Terrain_props_05_b",
    "h4_islandX_Terrain_props_05_c",
    "h4_islandX_Terrain_props_05_d",
    "h4_islandX_Terrain_props_05_e",
    "h4_islandX_Terrain_props_05_f",
    "H4_islandx_terrain_01",
    "H4_islandx_terrain_02",
    "H4_islandx_terrain_03",
    "H4_islandx_terrain_04",
    "H4_islandx_terrain_05",
    "H4_islandx_terrain_06",
    "h4_ne_ipl_00",
    "h4_ne_ipl_01",
    "h4_ne_ipl_02",
    "h4_ne_ipl_03",
    "h4_ne_ipl_04",
    "h4_ne_ipl_05",
    "h4_ne_ipl_06",
    "h4_ne_ipl_07",
    "h4_ne_ipl_08",
    "h4_ne_ipl_09",
    "h4_nw_ipl_00",
    "h4_nw_ipl_01",
    "h4_nw_ipl_02",
    "h4_nw_ipl_03",
    "h4_nw_ipl_04",
    "h4_nw_ipl_05",
    "h4_nw_ipl_06",
    "h4_nw_ipl_07",
    "h4_nw_ipl_08",
    "h4_nw_ipl_09",
    "h4_se_ipl_00",
    "h4_se_ipl_01",
    "h4_se_ipl_02",
    "h4_se_ipl_03",
    "h4_se_ipl_04",
    "h4_se_ipl_05",
    "h4_se_ipl_06",
    "h4_se_ipl_07",
    "h4_se_ipl_08",
    "h4_se_ipl_09",
    "h4_sw_ipl_00",
    "h4_sw_ipl_01",
    "h4_sw_ipl_02",
    "h4_sw_ipl_03",
    "h4_sw_ipl_04",
    "h4_sw_ipl_05",
    "h4_sw_ipl_06",
    "h4_sw_ipl_07",
    "h4_sw_ipl_08",
    "h4_sw_ipl_09",
    "h4_islandx_mansion",
    "h4_islandxtower_veg",
    "h4_islandx_sea_mines",
    "h4_islandx",
    "h4_islandx_barrack_hatch",
    "h4_islandxdock_water_hatch",
    "h4_beach_party"
}

local compoundDors = {
    MainDoorNorthLeft = {hash = util.joaat("h4_prop_h4_gate_l_03a"), location = { x = 4981.0122, y = -5712.747, z = 20.7810 }},
    MainDoorNorthRight = {hash = util.joaat("h4_prop_h4_gate_r_03a"), location = { x = 4984.1388, y = -5709.248, z = 20.7810 }},
    MainDoorSouthLeft = {hash = util.joaat("h4_prop_h4_gate_l_03a"), location = { x = 4990.6812, y = -5715.106, z = 20.7810 }},
    MainDoorSouthRight = {hash = util.joaat("h4_prop_h4_gate_r_03a"), location = { x = 4987.5874, y = -5718.634, z = 20.7810 }}
}

local function LoadCayoIPL() 
    for _, ipl in ipairs(CayoIPL) do
        STREAMING.REQUEST_IPL(ipl)
    end
end

local function UnloadCayoIPL() 
    for _, ipl in ipairs(CayoIPL) do
        STREAMING.REMOVE_IPL(ipl)
    end
end

local function LoadSounds()
	AUDIO.SET_AMBIENT_ZONE_LIST_STATE("azl_dlc_hei4_island_zones", 1, 0);
	AUDIO.SET_STATIC_EMITTER_ENABLED("se_dlc_hei4_island_beach_party_music_new_01_left", true);
	AUDIO.SET_STATIC_EMITTER_ENABLED("se_dlc_hei4_island_beach_party_music_new_02_right", true);
end
local cayoToggle = false
local cayoActive = false
local cayoToggle
cayoToggle = menu.toggle(menu.my_root(), "Cayo", {}, "", function(on)
    if memory.read_byte(memory.script_global(2697663)) == 0 then
        util.toast("Multiplayer map not loaded")
    end
    cayoToggle = on
    
end)

util.create_tick_handler(function()
    if cayoActive and memory.read_byte(memory.script_global(2697663)) ~= 0 then
        memory.write_byte(memory.script_global(1956028), 1)
        memory.write_byte(memory.script_global(1942781 + 544), 1) 

        local spPos = players.get_position(players.user())
        if MISC.GET_DISTANCE_BETWEEN_COORDS(5017.4224, -5130.4478, 2.19928, spPos.x, spPos.y, spPos.z, false) >= 2100 then
            memory.write_byte(memory.script_global(1942781 + 545), 1)
            HUD.SET_USE_ISLAND_MAP(false)

            PATHFIND.SET_ALLOW_STREAM_HEIST_ISLAND_NODES(0)
        else    
            memory.write_byte(memory.script_global(1942781 + 545), 0)
            HUD.SET_USE_ISLAND_MAP(true)

            
            TASK.SET_SCENARIO_GROUP_ENABLED("Heist_Island_Peds", true)
            TASK.SET_SCENARIO_GROUP_ENABLED("Heist_Island_Peds_2", true)
			AUDIO.SET_AMBIENT_ZONE_LIST_STATE("azl_dlc_hei4_island_zones", 1, 0);
			AUDIO.SET_STATIC_EMITTER_ENABLED("se_dlc_hei4_island_beach_party_music_new_01_left", true);
			AUDIO.SET_STATIC_EMITTER_ENABLED("se_dlc_hei4_island_beach_party_music_new_02_right", true);
            PATHFIND.SET_ALLOW_STREAM_HEIST_ISLAND_NODES(1)
        end 
    end

    if cayoToggle and not cayoActive and memory.read_byte(memory.script_global(2697663)) ~= 0 then 
        cayoActive = true
        TASK.SET_SCENARIO_GROUP_ENABLED("Heist_Island_Peds", true)
        TASK.SET_SCENARIO_GROUP_ENABLED("Heist_Island_Peds_2", true)
        local zone = ZONE.GET_ZONE_FROM_NAME_ID("IsHeistZone")
        ZONE.SET_ZONE_ENABLED(zone, true)
        PATHFIND.SET_ALLOW_STREAM_HEIST_ISLAND_NODES(1)
        LoadCayoIPL()
        LoadSounds()

    elseif (not cayoToggle and cayoActive) or memory.read_byte(memory.script_global(2697663)) == 0 then
        cayoActive = false
        UnloadCayoIPL()
        PATHFIND.SET_ALLOW_STREAM_HEIST_ISLAND_NODES(1)
        memory.write_byte(memory.script_global(1956028), 0)
        memory.write_byte(memory.script_global(1942781 + 544), 0) 
        memory.write_byte(memory.script_global(1942781 + 545), 1)
        STREAMING.LOAD_GLOBAL_WATER_FILE(0)
    end
end)