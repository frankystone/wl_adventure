include "scripting/richtext_scenarios.lua"

-- ################
-- # Protagonists #
-- ################
function emeritus(title, text)
   return speech("map:emerit.png", "8080FF", title, text)
end

function ubu_speech(title, text)
   return speech("map:uburulu.png", "eac991", title, text)
end

function ubu_no_speech(text)
   return li_image("map:uburulu.png", text)
end

function madame_auri(title, text)
   return speech("map:mdm_auri.png","2F9131", title, text)
end

-- ############################
-- # Own formatting functions #
-- ############################

-- Put asterisks around text and make it all red
function asterisk(text)
   return font("color=ff0000 italic=1", " *"..text.."* ")
end

-- Predefine sizes/position of text boxes so they are consistent
-- Can be overriden
function ubu_box(t)
   if not t["title"] then t["title"] = "Uburulu" end
   if not t["w"] then t["w"] = 350 end
   if not t["h"] then t["h"] = 320 end
   --if not t["posy"] then t["posy"] = 1 end
   --if not t["posx"] then t["posx"] = 200 end
   if not t["position"] then t["position"] = "topright" end
   return t
end

function soldier_box(t)
   if not t["title"] then t["title"] = "A Soldier" end
   if not t["w"] then t["w"] = 300 end
   if not t["h"] then t["h"] = 200 end
   --if not t["posy"] then t["posy"] = 1 end
   --if not t["posx"] then t["posx"] = 400 end
   if not t["position"] then t["position"] = "bottom" end
   return t
end

function emerit_box(t)
   if not t["title"] then t["title"] = "Emeritus" end
   if not t["w"] then t["w"] = 350 end
   if not t["h"] then t["h"] = 330 end
   --if not t["posy"] then t["posy"] = 1 end
   --if not t["posx"] then t["posx"] = 200 end
   if not t["position"] then t["position"] = "topright" end
   return t
end

function guybr_box(t)
   t["title"] = "You"
   if not t["w"] then t["w"] = 300 end
   if not t["h"] then t["h"] = 320 end
   --if not t["posy"] then t["posy"] = 1 end
   --if not t["posx"] then t["posx"] = 200 end
   if not t["position"] then t["position"] = "topleft" end
   return t
end

function mdm_auri_box(t)
   if not t["title"] then t["title"] = "Mdm Auri" end
   if not t["w"] then t["w"] = 350 end
   if not t["h"] then t["h"] = 320 end
   --if not t["posy"] then t["posy"] = 1 end
   --if not t["posx"] then t["posx"] = 200 end
   if not t["position"] then t["position"] = "topright" end
   return t
end

function poseidon_box(t)
   if not t["title"] then t["title"] = "Poseidon" end
   if not t["w"] then t["w"] = 350 end
   if not t["h"] then t["h"] = 300 end
   --if not t["posy"] then t["posy"] = 1 end
   --if not t["posx"] then t["posx"] = 200 end
   if not t["position"] then t["position"] = "topright" end
   return t
end

-- #####################
-- The emeritus is found
-- #####################
emerit_01 = emerit_box({
   title = "An old man",
   body = emeritus("Hihihi",
      "Oh, a visitor to my lonesome hut."
      .. paragraphdivider() ..
      "This is funny... hihihi... can't believe it ... hihihi ... hmmm ...  oh lord, so many years ... hihihi ... "..
      "and now, after i am close to dead ... hihihi ... there is a visitor ... hihihi ... say, man from nowhere ... "..
      "where do you come from? ... hihihi"),
})

guybrush_01 = guybr_box({
   body = objective_text( "??? WTF ???",
     p("Hmmm, from nowhere?")),
})

emerit_02 = emerit_box({
   body = emeritus(" ... hihihi ...",
      "From nowhere, aha ..."
      ..paragraphdivider()..
      "... hihihi... then you came from this island ... because ... hihihi ... this "..b("IS NOWHERE ")
      ..paragraphdivider()..
      "Who are you?"),
})

guybrush_02 = guybr_box({
   body = objective_text( "Well, my name is:",
           "Captain Guybrush, King"
           .. paragraphdivider() ..
           b("of the").." 200 cannons"
           .. paragraphdivider() ..
           b("of the").." 10 ships"
           .. paragraphdivider() ..
           b("of the").." 150 crew members"
           .. paragraphdivider() ..
           b("of the").." 13 Seas"
           .. paragraphdivider() ..
           b("of the").." 7 continents..."
           .. paragraphdivider() ..
           "in short: "..b("King of the Pirates !!!!")),
})

emerit_03 = emerit_box({
   body = emeritus(" ... hahaha ...",
      "A Pirat ... a fearless Pirat ... hahahohohaha ..."
      .. paragraphdivider() ..
      "I forgot your name... i will call you 'OfThe II' ... hihihi"
      .. paragraphdivider() ..
      "How did you managed to come just to THIS island?"),
})

guybrush_03 = guybr_box({
   body = p(i("Why is he calling me 'OfThe ")..b("II'").." ??")..
      objective_text( "We were affected by a big Storm",
      "It was a storm i have never seen, 100 feet tall waves, thunderbolts as big as the horizont ... "..
      "my crew did the best to get out of this horrible storm, but unfortunately many of them left "..
      "the railing in the wrong direction. My helmsman has survived, but after the storm we were attacked "..
      "by a giant sea monster ... it had 10 arms and it grabs some of my crew, including my helmsman... "..
      "So we navigated without knowing the direction and close before our ship began to sank, we reached this island."),
})

emerit_04 = emerit_box({
   body = emeritus("Oh i see...",
      "big storms and sea monsters... hehehe?"..
      "... your are really fearless ... hihihi ... but ... "..
      "don't be sure your chapter of accidents has stopped ... hihihi ... this island will be your greatest challenge."..
      "Sea monsters or "..i("giant").." storms are nothing against this island .... hahaha"),
})

guybrush_04 = guybr_box({
   body = objective_text("I fear against nothing",
      "What about "..b("you?")),
})

emerit_05 = emerit_box({
   body = emeritus("Hmm...",
      "What about me... hm..."
      .. paragraphdivider() ..
      "..."
      .. paragraphdivider() ..
      "..."
      .. paragraphdivider() ..
      "i can't remember hihihi ... "
      .. paragraphdivider() ..
      "..."
      .. paragraphdivider() ..
      "What i remember is that a visitor brings up some gift! Where is your gift?"),
})

guybrush_05 = guybr_box({
   body = objective_text("A what??",
      "A gift? I had trouble to safe my own live and you're talking about a gift? I have no!"
      .. paragraphdivider() ..
      "You should better talk about this island and the mystery about it."),
})

emerit_06 = emerit_box({
   body = emeritus("No gift?",
      "... talking about the mystery of this island? Forget it... no gift no hints ... hihihi ... "
      .. paragraphdivider() ..
      " ... "
      .. paragraphdivider() ..
      " ... "
      .. paragraphdivider() ..
      "But wait, 'OfThe II' ... hihihi ... if you could bring back my old amulet i tell you "..
      "some of the mystery... and i swear you need my knowledge if you want to survive here."
      .. paragraphdivider() ..
      b("Deal?").." ... ... hihihi ..."),
})

guybrush_06 = guybr_box({
   body = objective_text("An amulet?",
      i("*thinking* an amulet is precious ...")
      .. paragraphdivider() ..
      i("*thinking* so this could be a good deal ... no one will miss this old man if he suddenly dies at this bloody island...")
      .. paragraphdivider() ..
      "You say an amulet is somewhere on this island?"
      .. paragraphdivider() ..
      b("Deal! ")
      .. paragraphdivider() ..
      "Where should i search for it?"),
})

emerit_07 = emerit_box({
   body = emeritus("Good Deal ... hihihi",
      "Behind my hut is a secret passage through the mountains. After you managed to go through this passage a great valley will come."
      .. paragraphdivider() ..
      "Be careful, over there some surprises are awaiting for you... hihihi ... "
      .. paragraphdivider() ..
      "Behind that valley you will find my amulet. Bring it back to me and i will tell you some more of the secrets of this ..."
       .. paragraphdivider()..
      b("Monkey Island...")),
})

-- ##################################################################
-- If the player clicks on the only place where a sawmill is possible
-- ##################################################################
guybrush_no_medium_building = guybr_box({
   body = objective_text("??? WTF ???",
      "I want to place a medium building here!"),
})

emerit_no_medium_building = emerit_box({
   body = emeritus(" ... hihihi ...",
   " You should first try to find the passage!"
   .. paragraphdivider()..
   " ... hihihi ..."),
})


-- ###########
--  No planks 
-- ###########
no_planks = soldier_box({
   body = objective_text("Captain Guybrush!",
         "We are running out of planks!"),
})

guybrush_no_planks = guybr_box({
   body = objective_text("Oh my good, my crew is just a mess!",
         "We should build a sawmill as soon as possible!"..
         "And we may have to raise down some other buildings to get enough wares to build it"
         .. paragraphdivider() ..
         i("Must i really think of all?")),
   h = 170,
})

-- #################
-- # Found passage #
-- #################
emerit_found_passage = emerit_box({
   body = emeritus("... hihihi ...",
      "I see you have found the passage ..."
      .. paragraphdivider() ..
      " Good luck ... hihihi ..."),
})

guybrush_explore = guybr_box({
    body = objective_text("Our sawmill is working...",
            "now we are able to explore some more of this island.")
})

-- #################
-- # Found Uburulu #
-- #################
uburulu_01 = ubu_box({
   title = "Strange person",
   body = ubu_speech("","Gada aga ubu?"),
   w = 350,
   })

guybrush_ubu_01 = guybr_box({
   body = p("What is he talking about?"),
})

uburulu_02 = ubu_box({
   title = "Strange person",
   body = ubu_no_speech(
      i("points to him self")
      .. paragraphdivider() ..
      "'Uburulu!'"
      .. paragraphdivider() ..
      i("points to you")
      .. paragraphdivider() ..
      "'Gada aga Ubu?'")
   })

guybrush_ubu_02 = guybr_box({
   body = p("Ah..."
      .. paragraphdivider() ..
      "You are Uburulu?"),
})

uburulu_03 = ubu_box({
   title = "Strange person",
   body = ubu_speech("","???"),
})

guybrush_ubu_03 = guybr_box({
   body = div("width=100%", p("align=center", "Y O U")..
      p("align=center", "A R E")..
      p("align=center","U - B - U - R - U - L - U ??")),
})

uburulu_04 = ubu_box({
   title = "Strange person",
   body = ubu_speech("","???"),
})

guybrush_ubu_04 = guybr_box({
   body = p("Hmmm..."
      .. paragraphdivider() ..
      " I think we need some help here..."),
})

uburulu_05 = ubu_box({
   title = "Strange person",
   body = li_image("map:uburulu.png",
      i("points to his mouth")
      .. paragraphdivider() ..
      i("points to a:")
      .. paragraphdivider() ..
      img("world/immovables/miscellaneous/skeleton2/idle.png")
      .. paragraphdivider() ..
      i("points to his ears")
      .. paragraphdivider() ..
      i("looks amazing"))
})

guybrush_ubu_05 = guybr_box({
   body = p("Hmmm..."
      .. paragraphdivider() ..
      "Ahhhh ... you think with a shell we can talk to you?"
      .. paragraphdivider() ..
      " Where can we find the shell?"),
})

soldier_shell = soldier_box({
   body = objective_text("Captain Guybrush?",
      "We have found some shells at the coast before we get here and met ... ähh ..."
      .. paragraphdivider() ..
      " ... ähh ... "
      .. paragraphdivider() ..
      " ... this person."
      .. paragraphdivider() ..
      "Look here ..."),
})

guybrush_ubu_07 = guybr_box({
   body = p("We should send a scout to the outermost point at that coast to find this ominous shell!!"
      .. paragraphdivider() ..
      " Maybe we have luck and find it and then talk to ... ähhh"
      .. paragraphdivider() ..
      " ... this person!"),
   h = 150,
})

-- We have found the shell so we speak to Uburulu

guybrush_test_shell_01 = guybr_box({
   body = p(i("I want to know what the scout has spoken to the shell ...")
            .. paragraphdivider() ..
            i("*speaks to shell*")
            .. paragraphdivider() ..
            "uba godi abu dada"
            .. paragraphdivider() ..
            i("*hold the shell to his ears*")
            .. paragraphdivider() ..
            "My captain is a pig"),
   h = 160,
})

guybrush_test_shell_02 = guybr_box({
   body = p("..."),
   h = 150,
})

guybrush_test_shell_03 = guybr_box({
   body = p(i("Such a lout!")),
   h = 150,
})

uburulu_t_00 = ubu_box({
   title = "Strange person",
   body = h1("eac991", "Uga abo?")..
         li_image("map:uburulu.png",
      i("points to the:")
      .. paragraphdivider() ..
      img("world/immovables/miscellaneous/skeleton2/idle.png")
      .. paragraphdivider() ..
      "Uburulu!"
      )
})

guybrush_ubu_08 = guybr_box({
   body = p(i("speaks to shell")
      .. paragraphdivider() ..
      "Hi, i am Captain Guybrush!"
      .. paragraphdivider() ..
      "King of the Pirates!"
     .. paragraphdivider() ..
      "Who are you?"
      .. paragraphdivider() ..
      i("gives the shell to Uburulu")),
})

uburulu_t_01 = ubu_box({
   title = "Strange person",
   body = ubu_no_speech(i("listens to the shell ...")
            .. paragraphdivider() ..
            i("speaks to the shell ..")
            .. paragraphdivider() ..
            i("gives the shell to you")
            )
})

guybrush_ubu_t_01 = guybr_box({
   body = p(i("*listening to the shell*")..
         objective_text("... Goo "..
            asterisk("rushing").." d Da "..
            asterisk("rushing").." y !!! .."..
            asterisk("rushing"),
            "My name is "..asterisk("crackling")..b("Uburulu").." . King ..."
            .. paragraphdivider() ..
            b("of the")..asterisk("rushing").." 200 Cattles"
            .. paragraphdivider() ..
            b("of the").." 10"..asterisk("rushing").."Dugout canoes"
            .. paragraphdivider() ..
            b("of the")..asterisk("crackling").." 150 subjects"
            .. paragraphdivider() ..
            b("of the").." 5 moun"..asterisk("rushing").."tains"
            .. paragraphdivider() ..
            b("of the").." 7 co"..asterisk("crackling").."conut palms ..."
            .. paragraphdivider() ..
            "in short: "..b("King of the cannibals !!!!")
            .. paragraphdivider() ..
            asterisk("rushing")
            .. paragraphdivider() ..
            asterisk("crackling")
            .. paragraphdivider() ..
            "I am glad you found".. asterisk("rushing").."the shell...")),
})

guybrush_ubu_t_02 = guybr_box({
   body = p(i("this shell make pain in my ears")
            .. paragraphdivider() ..
            i("hm... somewhere i have heard similar ...")
            .. paragraphdivider() ..
            i("speaks to shell")
            .. paragraphdivider() ..
            objective_text("Hi Uburulu, nice to meet you!",
            "Say, have you seen an amulet in this valley?")),
})

uburulu_t_02 = ubu_box({
   body = ubu_speech("", asterisk("rushing").."An amulet??"..
   "No" .. asterisk("crackling") .. "not here...")
})

guybrush_ubu_t_03 = guybr_box({
   body = p("Not here? Somewhere else?"),
})

uburulu_t_03 = ubu_box({
   body = ubu_speech("", asterisk("rushing").."Maybe ..."),
})

guybrush_ubu_t_04 = guybr_box({
   body = p("Can you tell me where you have found the amulet?"),
})

uburulu_t_04 = ubu_box({
   body = ubu_speech("", "Ma" .. asterisk("crickling") .. "ybe ..."),
})

guybrush_ubu_t_05 = guybr_box({
   body = p(i("This one is not very communicative ...")
         .. paragraphdivider() ..
         i("hmmm ...")
         .. paragraphdivider() ..
         "Maybe, maybe..."),
})

uburulu_t_05 = ubu_box({
   body = ubu_speech("", "May "..asterisk("rushing").." be ..."),
})

guybrush_ubu_t_06 = guybr_box({
   body = p(i("What do you want?")),
})

uburulu_t_06 = ubu_box({
   body = ubu_speech("", "Hmmm... "..asterisk("rushing")
         .. paragraphdivider() ..
         "... hmmm ..."
         .. paragraphdivider() ..
         "Our Gods have left us ..."..asterisk("crackling")
         .. paragraphdivider() ..
         "... hmmm ..."
         .. paragraphdivider() ..
         "... because ..."
         .. paragraphdivider() ..asterisk("rushing")..
         "... hmmm ..."),
})

guybrush_ubu_t_07 = guybr_box({
   body = p(i("Oh man ...")
         .. paragraphdivider() ..
         "??? ... hmmm ...???"),
})

uburulu_t_07 = ubu_box({
   body = ubu_speech("", "Hmmm... "
         .. paragraphdivider() ..
         "... yes ..."
         .. paragraphdivider() ..
         "... hmmm ..."
         .. paragraphdivider() ..
         " ... because ..."
         .. paragraphdivider() ..asterisk("rushing")..
         "..."..asterisk("crackling")..asterisk("rushing")..
         "... We have not ennough offering."),
})

uburulu_t_08 = ubu_box({
   body = ubu_speech("We have to sacrifice our gods",
         "... and ..."
         .. paragraphdivider() ..
         "... our gods need ..."),
})

uburulu_t_09 = ubu_box({
   body = ubu_speech("", "... donkeys ..."),
})

guybrush_ubu_t_09 = guybr_box({
   body = objective_text("Donkeys ???",
         "Well, thats not a problem at all!"
         .. paragraphdivider() ..
         "We can spend some!"),
})

uburulu_t_10 = ubu_box({
   body = ubu_speech(i("*looks amazing*"),
         "... really ???"
         .. paragraphdivider() ..
         "you could spend ".. asterisk("crickling").." some Donkeys?"),
})

guybrush_ubu_t_10 = guybr_box({
   body = objective_text("Of course!",
         "They also call me Captain Guybrush,"
         ..paragraphdivider()..
         b("King of the Donkeys!")),
})

uburulu_t_11 = ubu_box({
   body = ubu_speech("", asterisk("rushing")..
         "... and ..."
         .. paragraphdivider() ..
         "... what do you want ???"),
})

guybrush_ubu_t_11 = guybr_box({
   body = p(i("This man is really stupid")..
         objective_text("Listen ...",
         li("1. ", "You need donkeys")..
         li("2. ", "I need information about the amulet")..
         p("So:")..
         li("1. ", "I give you Donkeys")..
         li("2. ", "You give me the information where to find the amulet"))),
})

uburulu_t_12 = ubu_box({
   body = ubu_speech("",
         b("... deal ...")),
})

guybrush_ubu_t_12 = guybr_box({
   body = objective_text("Deal!",""),
   h =150,
})

soldier_donkeys_01 =  soldier_box({
   body = objective_text("Captain guybrush?","We have no donkeys!"),
})

guybrush_donkeys_01 = guybr_box({
   body = p("If we have no we have to breed some!"),
   h =150,
})

soldier_donkeys_02 =  soldier_box({
   body = objective_text("Captain guybrush?", "There is no place for a Donkey Farm as well as for a Farm to feed the Donkeys!"),
})

uburulu_pray_00 = ubu_box({
   body = ubu_speech("Wait...",
         p("I could try to give you some space for your buildings ...")
         .. paragraphdivider() ..
         i("*closes his eyes*")
         .. paragraphdivider() ..
         i("*waves his arms*")
         .. paragraphdivider() ..
         i("*waves his arms*")
         ),
})

guybrush_ubu_pray_01 = guybr_box({
   body = objective_text(i("* big eyes *"),""),
   h = 150,
})

uburulu_pray_01 = ubu_box({
   body = ubu_speech("",
         i("*waves his arms*")
         .. paragraphdivider() ..
         i("*waves his arms*")
         .. paragraphdivider() ..
         b("... Akala --- ubo --- hihih --- ...")
         ),
   position = "topright",
})

uburulu_pray_02 = ubu_box({
   body = ubu_speech("",
         i("*waves his arms stronger*")
         .. paragraphdivider() ..
         b("... ga --- dobo --- gako --- ...")
         ),
   position = "topright",
})

uburulu_pray_03 = ubu_box({
   body = ubu_speech("",
         i("*waves his arms stronger and stronger*")
         .. paragraphdivider() ..
         i("*shaking his body*")
         .. paragraphdivider() ..
         b("... ga --- baho --- urulo --- ...")
         ),
   position = "topright",
})

uburulu_pray_04 = ubu_box({
   body = ubu_speech("",
         i("*goes hog wild*")
         .. paragraphdivider() ..
         b("... koba --- daa --- maho !!!! ")
         ),
   position = "topright",
})

uburulu_after_pray_01 = ubu_box({
   body = ubu_speech("Isn't it nice?",
         i("... grin ...")),
   position = "topright",
})

uburulu_after_pray_02 = ubu_box({
   body = ubu_speech("",
         "But you have " ..asterisk("rushing").." to hurry ..."
         ..paragraphdivider()..
         ".. because my magic power isn't strong"..asterisk("crackling")..". The new land will "..
         "vanish after some time."..asterisk("rushing").." If i get some donkeys i will try to keep the land stable ..."),
   position = "topright",
})

guybrush_ubu_after_pray_01 = guybr_box({
   body = objective_text(i("* wow *"),
         "Now we have some place to breed some donkys for Ubururlu!"),
   h = 150,
})

-- ################
-- Breeding donkeys
uburulu_thanks_01 = ubu_box({
   body = ubu_speech("Hey, thanks for the donkey",
         "I will praise to keep the land ..."),
   position = "topright",
})

uburulu_thanks_02 = ubu_box({
  body = ubu_speech("Many thanks for the donkeys."
                    , "We have enough now ..."),
  })

guybrush_donkeys_02 = guybr_box({
   body = objective_text(i("You're welcome"),"So what about the amulet?"),
   h = 150,
   })

uburulu_thanks_03 = ubu_box({
  body = ubu_no_speech("... Amulet? ..."),
  })

 guybrush_donkeys_03 = guybr_box({
   body = objective_text(i("This man drives me crazy ..."), "I asked you about an amulet?"),
   h = 150,
   })

uburulu_thanks_04 = ubu_box({
   body = ubu_no_speech("... hmmm ..."),
   })

uburulu_thanks_05 = ubu_box({
   body = ubu_no_speech("... ah ... yes ... the amulet ..."),
   })

uburulu_thanks_06 = ubu_box({
   body = ubu_no_speech("... it is not here."),
   })

guybrush_donkeys_04 = guybr_box({
   body = p("???"
            ..paragraphdivider()..
           "Where is it?"),
   h = 150,
   })

uburulu_thanks_07 = ubu_box({
   body = ubu_no_speech("A fisher has seen some mystic sparkling thing on the coast in the north." ..
                        "I think this item is what you are searching for."
                     .. paragraphdivider()..
                    "What the fisherman told was very interesting but we never go there."),
   })

guybrush_donkeys_05 = guybr_box({
   body = p("Why?"),
   h = 150,
   })

uburulu_thanks_08 = ubu_box({
   body = ubu_no_speech("That's an evil place."
                     .. paragraphdivider()..
                    "This valley is occupied by a real freak... he has a lot force to control the ocean and we "
                    .. "don't want him to be angry with us."),
   })

guybrush_donkeys_06 = guybr_box({
   body = p("Hm... how do i get into that valley?"),
   h = 150,
   })

uburulu_thanks_09 = ubu_box({
    body = ubu_no_speech("You can't ..."
                      .. paragraphdivider()..
                     "There is no connection to that valley, except..."),
    })

guybrush_donkeys_07 = guybr_box({
   body = p("Except?"),
   h = 150,
   })

uburulu_thanks_10 = ubu_box({
    body = ubu_no_speech("You have spend so many donkeys which maximized my magic power."
                      .. paragraphdivider()..
                     "I can build a land bridge for you, so you can enter that land."),
    })

guybrush_donkeys_08 = guybr_box({
   body = b("That would be great!"),
   h = 150,
   })

uburulu_thanks_11 = ubu_box({
    body = ubu_no_speech("But ..."
                      .. paragraphdivider()..
                     "You have to swear not to say that i had helped you!"),
    })


-- ################
-- Place scouts hut
guybrush_scout_hut_01 = guybr_box({
   body = objective_text("Ähhhm ...", "This is not the outermost place in this Lagoon!")
})

-- ###############################
-- Searching the translation shell
-- ###############################

check_shells_00 = guybr_box({
   body = p("We should try to reach those shells."
      .. paragraphdivider() ..
            "And then test them!"),
      h = 150,
})
   
check_shells_01 = guybr_box({
   body = p("Let's test if one of those shells is already the shell of translation."
      .. paragraphdivider() ..
            i("* This would be too easy, i guess.. *")),
   h = 150,
})

check_shells_02 = guybr_box({
      body = p(i("You are speaking to the shells")
      .. paragraphdivider() ..
            i("Hold them at your ear")),
   h = 150,
})

check_shells_03 = guybr_box({
   body = p("I just can't hear anthing!"),
   h = 150,
})

found_shell = soldier_box({
   title = "Scout",
   body = objective_text("Captain Guybrush!",
                         "I have found a shell!!!"),
})

guybrush_check_translation = guybr_box({
   body = p("Speak to it!"
      .. paragraphdivider() ..
      "Then hold it to your ears!"
      .. paragraphdivider() ..
      "Can you hear something?"),
   h = 150,
})

no_translation = soldier_box({
   title = "Scout",
   body = objective_text("Captain Guybrush!",
            "Indeed i hear something .."
            .. paragraphdivider() ..
            "I hear the sound of the sea!"),
})

guybrush_no_translation = guybr_box({
   body = p("This is not the shell we are searching for!"
         .. paragraphdivider() ..
         "Keep on searching!"),
   h = 150,
})

found_translation = soldier_box({
   title = "Scout",
   body = objective_text("Captain Guybrush!",
         "... this is strange!"
         .. paragraphdivider() ..
         "I hear something like ..."
         .. paragraphdivider() ..
         i("'uba godi abu dada'")),
})

guybrush_found_translation = guybr_box({
   body = p("This has to be the translation shell!!!"
      .. paragraphdivider() ..
      "Bring it to me, so i can talk with Uburulu!"),
   h = 150,
})

-- The Artifact of the old man is found
found_amulet = guybr_box({
   body = p("Finally we found the amulet!"),
   h = 150,
})

-- ###########
-- Madame Auri
-- ###########
mdm_auri_01 = mdm_auri_box({
   title = "Nice woman",
   body = madame_auri("Oh, a lovely young men ...",
                   "Don't know how long i didn't see such a nice men!")
})

mdm_auri_bad_01 = mdm_auri_box({
   title = "Nice woman",
   body = madame_auri("Hi, nice to meet you",
                   "I am sorry, but currently i have no time to talk to you .." ..
                  paragraphdivider() ..
                  "lovely young men."),
   position = "bottom",
})

-- #########
-- Poseidon
-- #########
poseidon_01 = poseidon_box({
  title = "",
  body = p("Ah, finally a new rival for a ship race!")
})

gb_po_01 = guybr_box({
   body = "",
   
})

poseidon_race_01 = poseidon_box({
  body = p("I see you have managed to build a .. hmm ... what is that? ")
})

-- Message of Guybrush is in story_script.lua

poseidon_race_02 = poseidon_box({
  body = p("Haha, lets see if you could win the race with that canoe."
    ..paragraphdivider()..
  "We have to wait for my ship to become ready")
})

poseidon_race_03 = poseidon_box({
  body = p("I am ready now. Let's go?")
})

poseidon_race_20 = poseidon_box({
  body = p("You have won or not.")
})

poseidon_warn_01 = {
  body = p("You have cheated! I am sorry but in this case you have lost the race and your ship!")
}
