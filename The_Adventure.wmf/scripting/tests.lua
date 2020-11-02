pbr = function(x,y, building, opts)
   return place_building_in_region(plr, building, {map:get_field(x,y)}, opts)
end
   
function test_old_man()
   sentry = pbr(15,13,"empire_sentry",{soldier={[{0,0,0,0}]=1}})
   connected_road("normal", plr, sentry.flag, "l,l ,l ,l ,ld ,l , l, l, l")
end

function test_scout()
   scout = pbr(31,29, "empire_scouts_house", nil)
   connected_road("normal", plr, scout,"l, tl, tl, tl, l, tl, tl, tl, tl, tl, tl, tl, tl, tl, tl, l, l, l, tl,")
end
