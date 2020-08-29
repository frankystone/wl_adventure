-- Raises and lowers a field until no building is on it
function wobble_field(f, v)
    local h = f.height
    while stop_wobble == false do
        if f.immovable ~= nil and (is_building(f.immovable) or f.immovable.descr.type_name == "constructionsite") then
            break
        end
        f.height = h + v
        sleep(5000)
        if f.immovable ~= nil and (is_building(f.immovable) or f.immovable.descr.type_name == "constructionsite") then
            break
        end
        f.height = h
        sleep(5000)
    end
end

function wobble_fields()
    --table of field, raise-by values
    local fields = {{map:get_field( 32,11 ), 1 },
                    {map:get_field( 32,9  ), 1 },
                    {map:get_field( 33,8  ), -1},
                    {map:get_field( 34,10 ), 1 },
                    {map:get_field( 34,9 ), 1 },
                    }
    for i, v in ipairs(fields) do
        run(wobble_field, v[1], v[2])
        local t = math.random(500, 5000)
        print("Field: ", v[1], "Raise by: ", v[2], "Delay: ", t)
        sleep(t)
    end
end

-- Set game speed to a useful value so message boxes and move functions work as expected
-- If s is given, set speed to s, otherwise set speed to 1000 (=1x=normal speed)
-- Returns the current game speed (cgs)
function check_speed(s)
    cgs = wl.Game().real_speed -- CurrentGameSpeed
    s = s or 1000
    if cgs > s then
        set_speed(s)
    end
    return cgs
end

-- set speed to the value s
function set_speed(s)
    wl.Game().desired_speed = s
end

function random_raise(region, terrain, raise)
    while #region > 0 do
      local id = math.random(1, #region)
      region[id].height = region[id].height + raise
      region[id].terr = terrain
      region[id].terd = terrain
      table.remove(region, id)
      sleep(100)
   end
end

-- Converts map pixels given by wl.ui.MapView().center_map_pixel into view pixels
-- center_map_pixel.x depends on: map_width * terrain width
-- center_map_pixel.y depends on: map height * terrain width / 2)
function map_pixel_to_view_pixel()
   local map_w = (wl.Game().map.width - 1) * 64
   local map_h = (wl.Game().map.height - 1) * 32
   local x = wl.ui.MapView().center_map_pixel.x - map_w
   if x < 0 then
      x = map_w + x
   end
   local y = wl.ui.MapView().center_map_pixel.y - map_h
   if y < 0 then 
      y = map_h - (y * -1)
   end
   return x, y
end

-- kep old mans environment
function keep_grape_and_reed()
   rf_1 = map:get_field(21,13)
   rf_2 = map:get_field(21,14)
   gf_1 = map:get_field(20,13)
   while true do
      if not rf_1.immovable then
         print("immovable", rf_1.immovable)
         map:place_immovable("reedfield_tiny", rf_1, "tribes")
      end
      if not gf_1.immovable then
         print("immovable", gf_1.immovable)
         map:place_immovable("grapevine_tiny", gf_1, "tribes")
      end
      if not rf_2.immovable then
         print("immovable", rf_2.immovable)
         map:place_immovable("reedfield_tiny", rf_2, "tribes")
      end
      sleep(1000)
   end
end
