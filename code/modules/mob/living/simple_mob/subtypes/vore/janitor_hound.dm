/mob/living/simple_mob/vore/aggressive/janitorhound
	name = "janitor hound"
	desc = ""

	icon_state = "scrubpup"
	icon_living = "scrubpup"
	icon_dead = "scrubpup-wreck"
	icon_rest = "scrubpup_rest"
	icon = 'icons/mob/widerobot_jan_vr.dmi'
	has_eye_glow = TRUE

	faction = "neutral"

	maxHealth = 200
	health = 200
	movement_sound = 'sound/effects/houndstep.ogg'
	see_in_dark = 8

	melee_damage_lower = 10
	melee_damage_upper = 20
	grab_resist = 100

	response_help = "pets"
	response_disarm = "bops"
	response_harm = "hits"
	attacktext = list("ravaged")
	friendly = list("nuzzles", "slobberlicks", "noses softly at", "noseboops", "headbumps against", "leans on", "nibbles affectionately on")

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0 //CHOMP Edit
	maxbodytemp = 900

	say_list_type = /datum/say_list/janitorhound
	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive/janitorhound

	max_buckled_mobs = 1 //Yeehaw
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE

	vore_active = TRUE
	vore_capacity = 4
	vore_pounce_chance = 15
	vore_icons = SA_ICON_LIVING | SA_ICON_REST
	vore_stomach_name = "trash repurposer"
	vore_stomach_flavor = "You have ended up in the trash repurposer of this machine. This place was definitely not designed with safety and comfort in mind. The heated and cramped surroundings oozing potent fluids all over your form, eager to do nothing less than breaking you apart to fuel its duties for the next few days... hours... minutes? Oh dear..."

	loot_list = list(/obj/item/borg/upgrade/syndicate = 6, /obj/item/borg/upgrade/vtec = 6, /obj/item/weapon/material/knife/ritual = 6, /obj/item/weapon/disk/nifsoft/compliance = 6)

	can_be_drop_prey = FALSE //CHOMP Add


/mob/living/simple_mob/vore/aggressive/janitorhound/isSynthetic()
	return TRUE

/mob/living/simple_mob/vore/aggressive/janitorhound/speech_bubble_appearance()
	return "synthetic_evil"

/mob/living/simple_mob/vore/aggressive/janitorhound/apply_melee_effects(var/atom/A)
	if(ismouse(A))
		var/mob/living/simple_mob/animal/passive/mouse/mouse = A
		var/obj/belly/B = vore_selected
		B.nom_mob(A)
	else
		..()

/mob/living/simple_mob/vore/aggressive/janitorhound/death(gibbed, deathmessage = "shudders and collapses!")
	.=..()
	resting = 0
	icon_state = icon_dead

/mob/living/simple_mob/vore/aggressive/janitorhound/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	verbs |= /mob/living/simple_mob/proc/animal_mount
	verbs |= /mob/living/proc/toggle_rider_reins
	movement_cooldown = 3

/mob/living/simple_mob/vore/aggressive/janitorhound/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/aggressive/janitorhound/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "trash repurposer"
	B.desc = "The Janiborg tosses you into his throat and sends you to their trash repuroser!"
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
		"The borgs belly mushes you ceacelessly."
	)
	B.name = "trash repurposer"

/datum/say_list/janitorhound

/datum/ai_holder/simple_mob/melee/evasive/janitorhound
	violent_breakthrough = TRUE
	can_breakthrough = TRUE
