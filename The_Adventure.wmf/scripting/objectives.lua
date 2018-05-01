-- ==========
-- objectives
-- ==========

obj_find_passage = {
   name = "find_passage",
   title=_"Find the secret passage",
   body = p("Try to find the secrete passage")
}

obj_find_old_mans_amulet = {
   name = "find_old_mans_artifact",
   title=_"Find the old mans artifact",
   body = p("Find the amulet from the old man to get some hints regarding this island.")
}

obj_build_sawmill = {
   name = "build_sawmill",
   title=_"Build a sawmill",
   body = p("Build a sawmill to keep the supply of planks. You may have to dismantle other buildings "..
            "to get the wares for building the sawmill. Keep in mind that a sawmill needs a yellow building spot.")
}

obj_build_scout = {
   name = "build_scout",
   title=_"Send out a scout in the lagoon of shells",
   body = p("Build a scouts house at the outermost place of the shell lagoon.")
}

obj_find_translation_shell = {
   name = "find_translation_shell",
   title=_"Find the shell of translation",
   body = p("Find the shell so you can speak with Uburulu")
}

obj_breed_donkeys = {
   name = "breed_donkeys",
   title = "Breed donkeys to fullfill Uburulu's demand",
   body = p(li("Build a donkey farm")..
          li("Build a Farm to feed the young donkeys")..
          li("Build a Well to feed the young donkeys")..
          "Keep on breeding donkeys to retain the terrain builded by Uburulu."),
}

obj_build_ship = {
   name = "build_ship",
   title = "Build a ship to make the race against Poseidon",
   body = p("You will need to produce some wares to get a ship:"..
         li("Cloth: ")..
         li("Gold: ")),
}
