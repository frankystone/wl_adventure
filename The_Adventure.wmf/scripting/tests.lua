pbr = function(x,y, building, opts)
   return place_building_in_region(plr, building, {map:get_field(x,y)}, opts)
end
   
function test_old_man()
   local sentry = pbr(15,13,"empire_sentry",{soldier={[{0,0,0,0}]=1}})
   connected_road("normal", plr, sentry.flag, "l,l|l,l|bl,l|l,l")
end

function test_scout()
   local scout = pbr(31,29, "empire_scouts_house", {inputs = {ration=2}})
   local f = map:get_field(28,24)
   plr:conquer(f,6)
   connected_road("normal", plr, scout.flag,"l,tl|tl,tl|tl,tl,tl|l,l|tl,tl|tl,tl|tl,tl|tl,tl|l,l,tl|l,tl|l,l|l,l|l,l|bl,l|l,l")
   run(find_translation_shell)
end

function test_mdm_auri_scroll()
   pbr(11,43, "empire_sentry",{soldier={[{0,0,0,0}]=1}})
end

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

function test_regatta()
   local f = map:get_field(114, 13)
   --scroll_to_field(f)
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
   print("Leaving test_regatta", plr_ship.state)
   run(regatta, plr_ship)
end
