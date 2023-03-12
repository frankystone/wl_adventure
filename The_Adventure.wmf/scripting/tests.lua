-- Some tests which can be run through the debug console.
-- Note: 
-- Some functions need to be run as a coroutine
-- Some functions need commenting out functions in story_script.lua

-- Helper function
pbr = function(x,y, building, opts)
   return place_building_in_region(plr, building, {map:get_field(x,y)}, opts)
end
   
function test_old_man()
   local sentry = pbr(15,13,"empire_sentry",{soldier={[{0,0,0,0}]=1}})
   connected_road("normal", plr, sentry.flag, "l,l|l,l|bl,l|l,l")
end

-- run(test_buildscout)
function test_buildscout()
   run(build_scout)
   local scout_hut = pbr(29,26, "empire_scouts_house")
   while map:get_field(29,26).immovable do
      sleep(1000)
   end
   scout_hut = pbr(29,24, "empire_scouts_house")
   while map:get_field(29,24).immovable do
      sleep(1000)
   end
   scout_hut = pbr(31,29, "empire_scouts_house")
end

function test_find_translation_shell()
   local scout = pbr(31,29, "empire_scouts_house", {inputs = {ration=2}})
   local f = map:get_field(28,24)
   plr:conquer(f,6)
   connected_road("normal", plr, scout.flag,"l,tl|tl,tl|tl,tl,tl|l,l|tl,tl|tl,tl|tl,tl|tl,tl|l,l,tl|l,tl|l,l|l,l|l,l|bl,l|l,l")
   run(find_translation_shell)
end

function test_mdm_auri_scroll()
   pbr(11,43, "empire_sentry",{soldier={[{0,0,0,0}]=1}})
end

-- run(test_meet_poseidon)
function test_meet_poseidon()
   local f = map:get_field(114, 13)
   scroll_to_field(f)
   local ship_y = pbr(114,17,
                      "empire_shipyard")
   
end

-- run(test_regatta_course)
-- Comment run(meet_poseidon) in story_script.lua
function test_regatta_course()
   local regatta_course = {map:get_field(109, 12),
                           map:get_field(103,4),
                           map:get_field(94, 119),
                           map:get_field(89, 111),
                           map:get_field(81, 113),
                           map:get_field(80, 124),
                           map:get_field(76, 12),
                           map:get_field(73, 28),
                           map:get_field(72, 43)
                          }
   for i = 1, #regatta_course do
      scroll_to_field(regatta_course[i])
      reveal_concentric(plr, regatta_course[i],7)
      sleep(1000)
   end
end

-- run(test_prepare_ship)
-- Comment run(meet_poseidon) in story_script.lua
function test_prepare_ship()
   local f = map:get_field(114, 13)
   scroll_to_field(f)
   local ship_y = pbr(114,17,
                "empire_shipyard",
                {inputs = {
                           cloth=4,
                           planks=10,
                           log=2
                          }
                }
               )
   local port = pbr(114, 13,
              "empire_port", 
              {wares = {
                        cloth=10, 
                        gold=4, 
                        marble_column=2, 
                        marble=4,
                        planks=20,
                        log=7,
                        granite=4
                       },
               workers = {
                          empire_builder=1
                         }
              }
             )
   port:start_expedition()
end

-- run(test_regatta)
-- Comment run(meet_poseidon) in story_script.lua
function test_regatta()
   local f = map:get_field(114, 13)
   scroll_to_field(f)
   local port = pbr(114, 13,
              "empire_port", 
              {wares = {
                        cloth=10,
                        gold=4,
                        marble_column=2,
                        marble=4,
                        planks=20,
                        log=7,
                        granite=4
                       },
               workers = {
                          empire_builder=1
                         }
              }
             )
   port:start_expedition()
   plr_ship = plr:place_ship(map:get_field(111,11))
   run(regatta, plr_ship)
end
