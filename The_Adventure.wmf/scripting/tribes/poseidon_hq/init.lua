--dirname = "map:scripting/tribes/poseidon_hq/"
local dirname = "tribes/buildings/trainingsites/atlanteans/labyrinth/"
--local dirname = path.dirname(__file__)
print("Dirname", dirname)

descriptions:new_warehouse_type {
   name = "hq_poseidon",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("atlanteans_building", "Headquarters"),
   icon = dirname .. "menu.png",
   size = "big",
   destructible = false,
   animation_directory = dirname,
   animations = {
      idle = {
         --pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 80, 88 },
      },
   },

   aihints = {},

   heal_per_second = 220,
   conquers = 2,
}
