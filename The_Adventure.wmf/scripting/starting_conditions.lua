--plr:forbid_buildings("all")
--plr:allow_buildings{
--   "empire_lumberjacks_house",
--   "empire_blockhouse",
--   "empire_sawmill",
--   "empire_quarry",
--   "empire_stonemasons_house",
--   "empire_foresters_house",
--   }

-- not local because we need hq also in other locations
hq = plr:place_building("empire_headquarters_shipwreck",
   sf, false, true)

hq:set_wares {
   --basket = 1,
   --empire_bread = 8,
   --bread_paddle = 2,
   --cloth = 5,
   --coal = 12,
   --felling_ax = 3,
   --fire_tongs = 2,
   --fish = 6,
   --fishing_rod = 2,
   --flour = 4,
   --gold = 4,
   granite = 3,
   --grape = 4,
   --hammer = 12,
   --armor_helmet = 4,
   --hunting_spear = 2,
   --iron = 12,
   --iron_ore = 5,
   --kitchen_tools = 4,
   log = 4,
   --marble = 25,
   --marble_column = 6,
   --meal = 4,
   --meat = 6,
   --pick = 14,
   planks = 4,
   ration = 10,
   --saw = 3,
   --scythe = 5,
   --shovel = 6,
   --spear_wooden = 5,
   --water = 12,
   --wheat = 4,
   --wine = 8,
   --wool = 2,
}
hq:set_workers {
   --empire_armorsmith = 1,
   empire_farmer = 1,
   empire_brewer = 1,
   empire_builder = 10,
   empire_carrier = 40,
   --empire_charcoal_burner = 1,
   empire_geologist = 1,
   empire_lumberjack = 3,
   empire_miner = 4,
   empire_stonemason = 2,
   empire_toolsmith = 1,
   --empire_weaponsmith = 1,
   empire_carpenter = 1,
   empire_forester = 1,
   empire_shipwright = 1,
}
hq:set_soldiers({0,0,0,0}, 10)


-- #########################################
-- Make the place of the old Man a bit nicer
-- #########################################

map:place_immovable("reedfield_tiny", map:get_field(21,13))
map:place_immovable("grapevine_ripe", map:get_field(20,13))
map:place_immovable("reedfield_tiny", map:get_field(21,14))

run(keep_grape_and_reed)

-- #####################
-- Initialize Madam Auri
-- #####################

mdm_auri:place_building("empire_warehouse", mdm_auri_sf, false, true)

local w = place_building_in_region(mdm_auri, "atlanteans_guardhouse",
         {map:get_field(7,46)}, 
         {soldier={[{0,0,0,0}]=1}})
local v = place_building_in_region(mdm_auri, "atlanteans_guardhouse",
         {map:get_field(2,46)}, 
         {soldier={[{0,0,0,0}]=1}})

connected_road("normal", mdm_auri, v.flag, "r, tr, tr, tr")
connected_road("normal", mdm_auri, w.flag, "l, tl, tl, tl")

mdm_auri:conquer(mdm_auri_sf, 7)


-- #################
-- Initialze Uburulu
-- #################

uburulu:forbid_buildings("all")

local ubu_hq = uburulu:place_building("barbarians_headquarters_interim",
                              map:get_field(42,17), false, true)
ubu_hq:set_wares {
   fishing_rod = 3,
   log = 20,
   blackwood = 20,
}
ubu_hq:set_workers {
   barbarians_fisher = 2,
   barbarians_carrier = 10,
}

ubu_hq:set_soldiers({0,0,0,0},0)
uburulu:place_ship(map:get_field(46,18))

local uf1 = uburulu:place_building("barbarians_fishers_hut", map:get_field(44,15), false, true)
connected_road("normal", uburulu, uf1.flag, "bl, bl, l", true)

local uf2 = uburulu:place_building("barbarians_fishers_hut", map:get_field(41,23), false, true)
connected_road("normal", uburulu, uf2.flag, "tr,tr, tr, tr, tl, tl", true)

local ucattlef = uburulu:place_building("barbarians_cattlefarm", map:get_field(42,9), false, true)
connected_road("normal", uburulu, ucattlef.flag, "bl, br, bl, bl, bl, bl, bl, br, br, r, tr", true)

-- Place a building so the scout walks in the right direction
--uburulu:place_building("barbarians_sentry", map:get_field(30,55), false, true)

-- ##################
-- Initalize Poseidon
-- ##################

poseidon:place_building("hq_poseidon", poseidon_sf, false, true)
poseidon_port = poseidon:place_building("atlanteans_port", map:get_field(106,18), false, true)
poseidon_port:set_wares{spidercloth=3, granite=4, log=3, gold=2, planks=3, diamond=1, quartz=1}
poseidon_port:set_workers{atlanteans_builder=1}
