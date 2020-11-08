function snow_storm_end(f)
   sleep(math.random(500,1000))
   plr:hide_fields({f}, true)
   f.terd = "summer_water"
   f.trn.terd = "summer_water"
   f.tln.terd = "summer_water"
end

function snow_storm_start()
   local window_fields = random_window_fields(20)
   --local visible_snow = {}
   while let_it_snow == true do
      for i, field in ipairs(window_fields) do
         if not plr:sees_field(field) then
            field.terd = "snow"
            field.trn.terd = "snow"
            field.tln.terd = "snow"
            plr:reveal_fields({field})
            sleep(500)
            run(snow_storm_end,field)
         end
      end
   end
end

--function intro()
   
--end
