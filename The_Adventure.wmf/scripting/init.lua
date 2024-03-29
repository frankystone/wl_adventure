include "scripting/coroutine.lua"
include "scripting/infrastructure.lua"
include "scripting/messages.lua"
include "scripting/ui.lua"
include "scripting/field_animations.lua"
include "scripting/training_wheels/utils/ui.lua"

plr = wl.Game().players[1]
uburulu = wl.Game().players[2]
mdm_auri = wl.Game().players[3]
poseidon = wl.Game().players[4]
map = wl.Game().map

sf = map.player_slots[1].starting_field
ubu_sf = map.player_slots[2].starting_field
mdm_auri_sf = map.player_slots[3].starting_field
poseidon_sf = map.player_slots[4].starting_field

-- Forbid all attacks
plr:set_attack_forbidden(2, true)
plr:set_attack_forbidden(3, true)
plr:set_attack_forbidden(4, true)
mdm_auri:set_attack_forbidden(1, true)
uburulu:set_attack_forbidden(1, true)

-- Global variable for controlling a coroutine
stop_wobble = false
let_it_snow = true

include "map:scripting/helper_functions.lua"
include "map:scripting/texts.lua"
include "map:scripting/objectives.lua"
include "map:scripting/story_script.lua"
include "map:scripting/tests.lua"
