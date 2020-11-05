function intro()
   local window_center = window_center()
   print(window_center.x, window_center.y)
   local ship_field = map:get_field(42, 67)
   local sea_fields = ship_field:region(9)
   --plr:hide_fields(sea_fields, true)
   print("Ship field: ", ship_field.x, ship_field.y)
   local home = scroll_to_field(ship_field)
   local yell = {title = "",
                 body = p("ARGHHH"),
                 modal = false,
                 w = 200,
                 h = 100,
                 posx = window_center.x - 200,
                 posy = window_center.y - 200
                }
   campaign_message_box(yell)
   sleep(200)
   ship_field.terr = "ice"
   local ship = plr:place_ship(ship_field)
   plr:reveal_fields(sea_fields)
   sleep(1800)
   close_story_messagebox()
   ship:remove()
   plr:hide_fields(sea_fields, true)
   sleep(1000)
   yell["posx"] = window_center.x + 200
   yell["posy"] = window_center.y - 200
   yell["body"] = p("Uih Uih UiH")
   campaign_message_box(yell)
   ship = plr:place_ship(ship_field)
   sleep(2000)
   close_story_messagebox()
   ship:remove()
   plr:hide_fields(sea_fields, true)
   sleep(2000)
   for i, f in ipairs(sea_fields) do
      f.terr = "desert_water"
      if i % 2 == 0 then
         f.terd = "ice_floes"
      end
   end
   ship_field.terr = "ice"
   ship = plr:place_ship(ship_field)
   sleep(1000)
   ship:remove()
   plr:hide_fields(sea_fields, true)
   sleep(1000)
   for i, f in ipairs(sea_fields) do
      f.terr = "summer_water"
      if i % 2 == 0 then
         f.terd = "desert_water"
      end
   end
   ship_field.terr = "ice"
   ship = plr:place_ship(ship_field)
   sleep(1000)
   ship:remove()
   plr:hide_fields(sea_fields, true)
   scroll_to_map_pixel(home)
end

function find_emerit()
   local emerit_hut = map:get_field(20, 15)
   while not ( emerit_hut.owner == plr ) do
      sleep(1000)
   end
   local sf = wait_for_roadbuilding_and_scroll(emerit_hut)
   sleep(1000)
   local speed = check_speed()
   campaign_message_box(emerit_01, 400)
   campaign_message_box(guybrush_01, 400)
   campaign_message_box(emerit_02, 400)
   campaign_message_box(guybrush_02, 400)
   campaign_message_box(emerit_03, 400)
   campaign_message_box(guybrush_03, 400)
   campaign_message_box(emerit_04, 1000)
   campaign_message_box(guybrush_04, 400)
   campaign_message_box(emerit_05, 400)
   campaign_message_box(guybrush_05, 400)
   campaign_message_box(emerit_06, 400)
   campaign_message_box(guybrush_06, 400)
   campaign_message_box(emerit_07, 400)
   scroll_to_map_pixel(sf)
   campaign_message_box(no_planks, 400)
   campaign_message_box(guybrush_no_planks)
   set_speed(speed)
   run(find_amulet)
   run(build_sawmill)
   run(find_passage)
   run(meeting_uburulu)
end

function build_sawmill()
   local o = add_campaign_objective(obj_build_sawmill)
   while #plr:get_buildings("empire_sawmill") < 1 do
      sleep(2000)
   end
   o.done = true
   campaign_message_box(guybrush_explore)
end

function meeting_uburulu ()
   local f = map:get_field(42,9)
   
   while not plr:sees_field(f) do
      sleep(1000)
   end
   local speed = check_speed()
   wait_for_roadbuilding_and_scroll(ubu_sf)
   sleep(500)
   reveal_concentric(plr, ubu_sf, 5)
   sleep(1000)
   -- stop coroutine of wobbling fields 
   stop_wobble = true
   
   campaign_message_box(uburulu_01, 1000)
   campaign_message_box(guybrush_ubu_01, 500)
   campaign_message_box(uburulu_02, 500)
   campaign_message_box(guybrush_ubu_02, 500)
   campaign_message_box(uburulu_03, 500)
   campaign_message_box(guybrush_ubu_03, 500)
   campaign_message_box(uburulu_04, 500)
   campaign_message_box(guybrush_ubu_04, 500)
   campaign_message_box(uburulu_05, 500)
   campaign_message_box(guybrush_ubu_05, 500)
   campaign_message_box(soldier_shell, 500)
   wait_for_roadbuilding_and_scroll(map:get_field(28,22))
   -- make sure that the fields are visible
   local check_field = map:get_field(28,26)
   if check_field.owner ~= plr then
      campaign_message_box(check_shells_00)
   end
   while check_field.owner ~= plr do
      sleep(1000)
   end
   wait_for_roadbuilding_and_scroll(map:get_field(28,22))
   campaign_message_box(check_shells_01)
   local shell_ims = {map:get_field(29,20).immovable,
                     map:get_field(28,22).immovable,
                     map:get_field(26,26).immovable,
                     map:get_field(23,25).immovable,
                     map:get_field(28,25).immovable,}
   for i, v in ipairs(shell_ims) do
      if v and v.descr.name == "skeleton2" then
         v:remove()
         campaign_message_box(check_shells_02, 500)
         campaign_message_box(check_shells_03, 500)
      end
      sleep(1000)
   end
   campaign_message_box(guybrush_ubu_07, 500)
   run(build_scout)
   set_speed(speed)
end

function talk_to_uburulu()
   local speed = check_speed()
   sleep(1000)
   local sf = wait_for_roadbuilding_and_scroll(ubu_sf)
   campaign_message_box(guybrush_test_shell_01, 1000)
   campaign_message_box(guybrush_test_shell_02, 2000)
   campaign_message_box(guybrush_test_shell_03, 1000)
   campaign_message_box(uburulu_t_00, 1000)
   campaign_message_box(guybrush_ubu_08, 1000)
   campaign_message_box(uburulu_t_01, 1000)
   campaign_message_box(guybrush_ubu_t_01, 1000)
   campaign_message_box(guybrush_ubu_t_02, 1000)
   campaign_message_box(uburulu_t_02, 1000)
   campaign_message_box(guybrush_ubu_t_03, 1000)
   campaign_message_box(uburulu_t_03, 1000)
   campaign_message_box(guybrush_ubu_t_04, 1000)
   campaign_message_box(uburulu_t_04, 1000)
   campaign_message_box(guybrush_ubu_t_05, 1000)
   campaign_message_box(uburulu_t_05, 1000)
   campaign_message_box(guybrush_ubu_t_06, 1000)
   campaign_message_box(uburulu_t_06, 1000)
   campaign_message_box(guybrush_ubu_t_07, 1000)
   campaign_message_box(uburulu_t_07, 1000)
   campaign_message_box(uburulu_t_08, 1000)
   campaign_message_box(uburulu_t_09, 1000)
   campaign_message_box(guybrush_ubu_t_09, 1000)
   campaign_message_box(uburulu_t_10, 1000)
   campaign_message_box(guybrush_ubu_t_10, 1000)
   campaign_message_box(uburulu_t_11, 1000)
   campaign_message_box(guybrush_ubu_t_11, 1000)
   campaign_message_box(uburulu_t_12, 1000)
   campaign_message_box(guybrush_ubu_t_12, 1500)
   campaign_message_box(soldier_donkeys_01, 1000)
   campaign_message_box(guybrush_donkeys_01, 1000)
   campaign_message_box(soldier_donkeys_02, 2000)
   campaign_message_box(uburulu_pray_00, 1000)
   --scroll_to_map_pixel(sf)
   set_speed(speed)
   run(breed_donkeys)
end

function breed_donkeys()
   local o = add_campaign_objective(obj_breed_donkeys)
   local speed = check_speed()
   plr:reveal_fields(map:get_field(27,121):region(6))
   local sf = wait_for_roadbuilding_and_scroll(map:get_field(27,122))
   sleep(1000)
   campaign_message_box( uburulu_pray_01)
   local fields = {map:get_field(25,123),
                  map:get_field(25,120),
                  map:get_field(27,120),
                  map:get_field(26,117),
                  map:get_field(27,121),
                  map:get_field(29,119),
                  map:get_field(28,118),
                  map:get_field(29,121),
   }
   for i, f in ipairs(fields) do
      random_raise(f:region(1), "tundra2", 1)
      sleep(100)
      if i == 1 then 
         campaign_message_box(guybrush_ubu_pray_01, 1000)
         campaign_message_box(uburulu_pray_02)
      elseif i == 4 then
         campaign_message_box(uburulu_pray_03)
      elseif i == 6 then
         campaign_message_box(uburulu_pray_04)
      end
   end
   plr:conquer(map:get_field(27,121),6)

   campaign_message_box(uburulu_after_pray_01)
   campaign_message_box(uburulu_after_pray_02)
   campaign_message_box(guybrush_ubu_after_pray_01)
   set_speed(speed)

   -- Wait until the player has a donkey farm and a farm
   while #plr:get_buildings("empire_donkeyfarm") < 1 or 
         #plr:get_buildings("empire_farm") < 1 do
      sleep(4000)
   end

   -- Give Uburulu 10 Donkeys
   local nr_donkeys_uburulu = 0
   while nr_donkeys_uburulu < 10 do
      sleep(100000)
      nr_donkeys = hq:get_workers("empire_donkey")
      if nr_donkeys > 0 then
         hq:set_workers("empire_donkey", 0)
         campaign_message_box( uburulu_thanks_01)
         nr_donkeys_uburulu = nr_donkeys_uburulu + 1
      else
         print('Turn back field: ', fields[4])
         random_raise(fields[4]:region(1), "summer_water", -1)
      end
   end
   o.done = true
   run(connect_north_valley)
end

function connect_north_valley()
   campaign_message_box(uburulu_thanks_02, 500)
   campaign_message_box(guybrush_donkeys_02, 1000)
   campaign_message_box(uburulu_thanks_03, 500)
   campaign_message_box(guybrush_donkeys_03, 1000)
   campaign_message_box(uburulu_thanks_04, 1000)
   campaign_message_box(uburulu_thanks_05, 1000)
   campaign_message_box(uburulu_thanks_06, 500)
   campaign_message_box(guybrush_donkeys_04, 1000)
   campaign_message_box(uburulu_thanks_07, 500)
   campaign_message_box(guybrush_donkeys_05, 1000)
   campaign_message_box(uburulu_thanks_08, 500)
   campaign_message_box(guybrush_donkeys_06, 1000)
   campaign_message_box(uburulu_thanks_09, 1000)
   campaign_message_box(guybrush_donkeys_07, 1000)
   campaign_message_box(uburulu_thanks_10, 1000)
   campaign_message_box(guybrush_donkeys_08, 1000)
   campaign_message_box(uburulu_thanks_11, 1000)
end

function find_amulet()
   local o = add_campaign_objective(obj_find_old_mans_amulet)
   local f = map:get_field(63,103)
   while f.owner ~= plr do
      sleep(1000)
   end
   o.done = true
   campaign_message_box(found_amulet)
end

function build_scout()
   print("starting build_scout")
   local o = add_campaign_objective(obj_build_scout)
   local solved = false
   local wrong_fields = {map:get_field(25,19),
                         map:get_field(26,23),
                         map:get_field(29,24),
                         map:get_field(29,26),
   }
   local right_field = map:get_field(31,29)

   while not solved do
      for i, v in ipairs(wrong_fields) do
         if v.immovable and v.immovable.building == "empire_scouts_house" then
            campaign_message_box(guybrush_scout_hut_01, 1000)
            v.immovable.flag:remove()
         end
      end
      -- .descr.name is the right string after the building is completed
      if right_field.immovable and right_field.immovable.descr.name == "empire_scouts_house" then
         solved = true
      end
      sleep(1000)
   end
   o.done = true
   run(find_translation_shell)
end

function find_translation_shell()
   print("Start finding translation shell")
   local o = add_campaign_objective(obj_find_translation_shell)
   local t_shell = map:get_field(33,48) -- the translation shell
   local fake_shells = {map:get_field(31,36),
                        map:get_field(26,40),
                        map:get_field(41,45),
                        map:get_field(42,33)}

   while o.done == false do
      -- find the translation shell only after all other places are found
      if fake_shells[1] == nil then
         print("No shells left, find the right one")
         -- make sure there is no other immovable
         -- on that field
         local map_obj = t_shell.immovable
         if map_obj and map_obj.descr.name ~= "skeleton2" then
            map_obj:remove()
         end
         -- find the right shell
         if plr:sees_field(t_shell) then
            map:place_immovable("skeleton2", t_shell, "world")
            local speed = check_speed()
            local cur_f = wait_for_roadbuilding_and_scroll(t_shell)
            campaign_message_box(found_shell)
            campaign_message_box(guybrush_check_translation)
            campaign_message_box(found_translation)
            campaign_message_box(guybrush_found_translation)
            o.done = true
            scroll_to_map_pixel(cur_f)
            set_speed(speed)
         end
      end
      for i, field in ipairs(fake_shells) do
         if field and plr:sees_field(field) then
            print("found shell at: ", field)
            local speed = check_speed()
            cur_f = wait_for_roadbuilding_and_scroll(field)
            campaign_message_box(found_shell)
            campaign_message_box(guybrush_check_translation)
            field.immovable:remove()
            sleep(200)
            campaign_message_box(no_translation)
            campaign_message_box(guybrush_no_translation)
            scroll_to_map_pixel(cur_f)
            table.remove(fake_shells, i) -- Don't catch this field twice
            set_speed(speed)
         end
      end
      -- Maybe we ran out of rations before we have found the right shell
      -- make sure there is at least one ration in the headquarters
      if hq:get_wares("ration") == 0 then
         print("No ration left, add one.")
         hq:set_wares("ration", 1)
      end
      sleep(1000)
   end
   run(talk_to_uburulu)
end

function find_passage()
   local o = add_campaign_objective(obj_find_passage)
   local f = map:get_field(29,10)
   local medium_clicked = 0
   while not ( f.owner == plr ) do
      wl.Game().allow_saving = false
      local w = wl.ui.MapView().windows.field_action
      if w and w.tabs.medium then
         if w.tabs.medium.active then
            w.tabs.small:click()
            medium_clicked = medium_clicked +1
         end
      end
      if medium_clicked == 3 then
         w:close()
         -- Following is needed to prevent a crash if autosave just starts 
         -- after allow_saving is true again
         w = nil
         wl.Game().allow_saving = true
         campaign_message_box(guybrush_no_medium_building)
         campaign_message_box(emerit_no_medium_building)
         medium_clicked = 0
      end
      sleep(500)
   end
   wait_for_roadbuilding_and_scroll(f)
   sleep(1000)
   campaign_message_box(emerit_found_passage)
   o.done = true
   run(wobble_fields)
end

function meet_mdm_auri()
   -- get pixel coordinates of field
   local f_x = mdm_auri_sf.viewpoint_x
   local f_y = mdm_auri_sf.viewpoint_y
   -- If the player scroll to this area on the sccreen,
   -- Mdm Auri tells some things
   local area_left = f_x - (64 * 2)
   local area_right = f_x + (64 * 2)
   local area_top = f_y + (32 * 2)
   local area_bottom = f_y - (32*2)
   local in_area = false
   while true do
      if plr:sees_field(mdm_auri_sf) then
         -- get the current center of screen
         local center_x, center_y = map_pixel_to_view_pixel()
         if ((center_x > area_left and center_x < area_right) and 
            (center_y < area_top and center_y > area_bottom)) then

            if in_area == false then
               campaign_message_box(mdm_auri_bad_01)
               in_area = true -- Do not show again
            end
         else
            -- The area is outside the screen center so reset the marker
            -- Next time the area is in screen center the message box appears again
            in_area = false
         end
      end
      sleep(500)
   end
end

function meet_poseidon()
   local trigger_f = map:get_field(112,17)
   while trigger_f.owner ~= plr do
      sleep(4000)
   end
   local cf = wait_for_roadbuilding_and_scroll(poseidon_sf)
   campaign_message_box(poseidon_01, 500)
   campaign_message_box(gb_poseidon_01, 500)
   campaign_message_box(poseidon_02, 500)
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
   scroll_to_map_pixel(cf)
   run(prepare_ship)
end

function perpare_ship()
   local o = add_campaign_objective(obj_build_ship)
   -- As long we have no ship we do nothing
   while #plr:get_ships() < 1 do
      sleep(4000)
   end

   local plr_ship = plr:get_ships()[1]
   cf = wait_for_roadbuilding_and_scroll(poseidon_sf)
   campaign_message_box(poseidon_regatta_01)
   campaign_message_box({
      title = "You", 
      body = p("Captin Guybrush proudly presents:"
         .. paragraphdivider() ..
         p_font("size=15", plr_ship.shipname)
         .. paragraphdivider() ..
         img("tribes/ships/empire/sail_e_00.png")
         .. paragraphdivider() ..
         "With this ship i will win the regatta!"),
         posy = 1,
         posx = 1,
         w = 300,
         h = 320,
   })

   campaign_message_box(poseidon_regatta_02)
   scroll_to_map_pixel(cf)

   -- Captain Guybrush is ready for the race if the ship waits for an expedition
   while plr_ship.state ~= "exp_waiting" do
      sleep(2000)
   end
   o.done = true
   run(regatta, plr_ship)
end

function regatta(plr_ship)
   local o = add_campaign_objective(obj_regatta)
   --Start an expedition in the port of poseidon
   poseidon_port:start_expedition()
   --Place the ship of poseidon and wait for scouting mode
   local po_ship = poseidon:place_ship(map:get_field(99,8))
   while po_ship.state ~= "exp_scouting" do
      if plr_ship.state == "exp_scouting" then
         -- The player has started the expedition before poseidon
         campaign_message_box(poseidon_warn_01)
         plr_ship:remove()
         break
      end
      sleep(500)
   end
   
   --Now poseidon is also ready
   local cf = wait_for_roadbuilding_and_scroll(poseidon_sf)

   campaign_message_box(poseidon_regatta_03)
   scroll_to_map_pixel(cf)
   
   --The regatta starts now
   local finish = map:get_field(72,52)
   local won = false
   while true do 
      if finish.owner == poseidon then
         campaign_message_box(poseidon_regatta_04)
         break
      elseif finish.owner == plr then
         campaign_message_box(poseidon_regatta_05)
         won = true
         break
      end
      sleep(400)
   end
   
   if won then
      campaign_message_box(poseidon_regatta_20)
      o.done = true
   else
      o.done = false
   end
end

function main_thread()
   --intro()
   -- Needs to be included here,otherwise the payer sees to many of the map 
   include "map:scripting/starting_conditions.lua"
   reveal_concentric(plr, sf, 13)
   run(find_emerit)
   run(meet_mdm_auri)
   --run(meet_poseidon)
end

run(main_thread)
