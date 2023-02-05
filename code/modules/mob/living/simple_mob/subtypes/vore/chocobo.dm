/mob/living/simple_mob/vore/chocobo
	name = "chocobo"
	desc = "A big yellow bird!"
	catalogue_data = list(/datum/category_item/catalogue/fauna/chocobo)
	tt_desc = "Cho Co Bo"
	icon = 'icons/mob/64x64.dmi'
	icon_dead = "alpha_chocobo_dead"
	icon_living = "alpha_chocobo"
	icon_state = "alpha_chocobo"
	faction = "neutral"
	meat_amount = 20
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	old_x = -16
	old_y = 0
	vis_height = 92
	melee_damage_lower = 10
	melee_damage_upper = 25
	friendly = list("nudges")
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	response_help = "pats"
	response_disarm = "shoves"
	response_harm = "bops"
	movement_cooldown = 2
	maxHealth = 1500
	attacktext = list("pecked")
	see_in_dark = 8
	minbodytemp = 0
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate
	max_buckled_mobs = 1
	mount_offset_y = 16
	mount_offset_x = -16
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE
	swallowTime = 10
	vore_default_mode = DM_DIGEST
	vore_pounce_maxhealth = 125
	vore_bump_emote = "tries to snap up"
	vore_active = 1
	vore_icons = 2
	vore_icons = SA_ICON_LIVING
	vore_capacity = 2

	can_be_drop_prey = FALSE //CHOMP Add

/datum/category_item/catalogue/fauna/chocobo
	name = "foreign Fauna - Chocobo"
	desc = "Classification: Cho co bo\
	<br><br>\
	Yellow bird."
	value = CATALOGUER_REWARD_HARD

/mob/living/simple_mob/vore/chocobo/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	verbs |= /mob/living/simple_mob/proc/animal_mount
	verbs |= /mob/living/proc/toggle_rider_reins
	movement_cooldown = 2

/mob/living/simple_mob/vore/chocobo/Initialize()
	..()
	src.adjust_nutrition(src.max_nutrition)

/mob/living/simple_mob/vore/chocobo/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The chocobo tosses its head back with you firmly clasped in its beak, and in a few swift moments it finishes swallowing you down into its hot, dark gut. The thick, humid air is tinged with a rough smell, and the surrounding flesh wastes no time in clenching and massaging down over its newfound fodder, smothering you in thick hot gutflesh~"
	B.vore_sound = "Tauric Swallow"
	B.release_sound = "Pred Escape"
	B.mode_flags = list(DM_FLAG_NUMBING, DM_FLAG_THICKBELLY)
	B.affects_vore_sprites = TRUE
	B.fancy_vore = 1
	B.vore_verb = "slurp"
	B.contamination_color = "grey"
	B.contamination_flavor = "Wet"
	B.belly_fullscreen_color = "#c47cb4" 		// CHOMPedit - Belly Fullscreen
	B.belly_fullscreen = "anim_belly" 			// CHOMPedit - Belly Fullscreen
	B.emote_lists[DM_DIGEST] = list(
		"The chocobo coos in annoyance before clenching those wrinkled walls tight against your form, grinding away at you!",
		"As the beast wanders about, you're forced to slip and slide around amidst a pool of thick digestive goop, sinking briefly into the thick, heavy walls!",
		"You can barely hear the chocobo let out a pleased rumble as its stomach eagerly gurgles around its newfound meal!",
		"As the thinning air begins to make you feel dizzy, menacing bworps and grumbles fill that dark, constantly shifting organ!",
		"The constant, rhythmic kneading and massaging starts to take its toll along with the muggy heat, making you feel weaker and weaker!",
		"The chocobo happily wanders around while digesting its meal, almost like it is trying to show off the hanging gut you've given it.")

/datum/say_list/chocobo
	speak = list("Crrraw.", "Chip.", "Rrrrrll.", "Grrrrfff.")
	emote_hear = list("chuffs", "peeps", "churls", "hisses", "rrrrrls",)
	emote_see = list("ruffles their feathers", "stretches", "yawns")
	say_maybe_target = list("Chirp?")
	say_got_target = list("Caw!", "CAW!", "CHRRRRR!")