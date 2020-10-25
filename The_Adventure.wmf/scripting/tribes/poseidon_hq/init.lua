--dirname = "map:scripting/tribes/poseidon_hq/"
dirname = "tribes/buildings/trainingsites/atlanteans/labyrinth/"
--local dirname = path.dirname(__file__)
print("Dirname", dirname)

tribes:new_warehouse_type {
   msgctxt = "atlanteans_building",
   name = "hq_poseidon",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("atlanteans_building", "Headquarters"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   size = "big",
   destructible = false,
   --animation_directory = ""
   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
              hotspot = { 80, 88 },
      },
   },

   aihints = {},

   heal_per_second = 220,
   conquers = 2,
}
