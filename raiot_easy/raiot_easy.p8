pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- raiot
-- by daniil ivzhenko


function _init()
--variables

	game_state="menu"
	show_dialog=false
	dialog=""
	music(57)
	
	plr={
		--looks
		sp=2,
		x=10*8,
		y=53.5*8,
		h=8,
		w=8,
		flp=false,
		
		--motion
		dx=0,
		dy=0,
		max_dx=5,
		max_dy=8,
		acc=0.5,
		boost=3.5,
		anim=0,
		
		--plr status
		running=false,
		jumping=false,
		falling=false,
		sliding=false,
		landed=false,
		
		--keys
		keys=0,
		wisdom=0,
		
	}
		
	--key table
	key={
		anim=time(),
		sp=18,
		x=80/8,
		y=430/8,
		flp=false,
		
		
  keys = {
  		--start
    {x=10,y=52,collected=false},
   	--haunted city
    {x=52,y=51,collected=false},	
    --sand wizard
    {x=50,y=21,collected=false},	
   	--mushroom wizard 1
    {x=10,y=22,collected=false},	
   	--mushroom wizard 2
    {x=52,y=14,collected=false},	
   	--hidden key
    {x=17,y=34,collected=false},	
    --end key
    {x=55,y=4,collected=false},	
		}
	}
	----------wizards--------------
	wzrds={
		--mushroom wizard table
		wzrd={
			anim=time(),
			sp=35,
			x=10,
			y=23,
			wisdom=false,
			dialog1="mushrooms hear words\
			\nthat cannot be heard.",
			dialog2={
			"how did you get up here?",
			"mushrooms are great!",
			"i would kill for some stew\
			\nright now.",
			},
		},
		--second mushroom wizard table
		wzrd_2={
			anim=time(),
			sp=35,
			x=51,
			y=16,
			wisdom=false,
			dialog1="the more of this there\
			\nis the less you have.",
			dialog2={
			"i ate some crystals and\n\
			 mushrooms go brrr",
			"mushrooms are terrible!",
			"my hat is made of cotton.\
			\nwand is of pure elm.",
			},
		},

		--sand wizard table
		snd_wzrd={
			sp=222,
			x=50,
			y=22,
			wisdom=false,
			dialog1="s a n d\n i s\n  t i m e\n   t h a t  h a d  passed.  ",
			dialog2={
			"you seem to be strong\nenough to go against the\nsand curse i placed arund",
			"go away,\nits the only place\ni can focus!",
			"∧∧∧∧∧∧∧∧∧∧∧∧∧\n∧∧∧∧∧∧∧∧∧∧∧∧∧\n∧∧∧∧∧∧∧∧∧∧∧∧∧\n∧∧∧∧∧∧∧∧∧∧∧∧∧",
			},
		},
		--ice wizard table
		ice_wzrd={
			sp=14,
			x=46,
			y=10,
			wisdom=false,
			dialog1="present represents the\nstill nature of life\
			\njust like a frigid day.",
			dialog2={
			"did you hear about the\ngolden cat phenomenon?\
			\nthey appear from ground",
			"you seem storng to be able\nresist my blizzard curse,\
			\ni'm impressed!",
			"🐱 kitty",
			},
		},
		--haunt wizard table
		haunt_wzrd={
			sp=12,
			x=51,
			y=46,
			wisdom=false,
			dialog1="boooooooooooooooooooooooo\nboooooooooooooooooooooooo\nboooooooooooooooooooooooo\nboooooooooooooooooooooooo",
			dialog2={
			"this town was once filled\
			\nto the brim with life.",
			"ghoasts roam through here\
			\nmore than often.",
			"i am surprised you were\
			\nable to get here!",
			},
		},
		--second haunt wizard table
		haunt_wzrd_2={
			sp=12,
			x=1,
			y=37,
			wisdom=false,
			dialog1="moving up or down\nmatters not, one that does\
			\nis what you got.",
			dialog2={
			"what are you doing\
			\nim my house?",
			"its so calm up here,\nsand wizard keeps\nbothering me to let him\nstay here!",
			"i take care of plants here\
			\nthey smell so nice. ˇ",
			},
	 },
	--dark wizard table
		dark_wzrd={
			sp=125,
			x=7,
			y=18,
			wisdom=true,
			mv_cat=true,
			cat_moved=true,
			dialog1="you are not wise enough.\n\tgo!\
			\nspeak to all wizards.",
			dialog2={
			"squeeze through.",
			"overworld is so nice and\nsunny this time\nof year.",
			"i'll stay here,\nyou can go.",
			},
	 },
	--second dark wizard table
		dark_wzrd_2={
			sp=125,
			x=1,
			y=13,
	 },
	 --skull
	 skull={
	 	sp=206,
			x=52,
			y=33,
			wisdom=true,
			dialog2={
			"it is possible to\
			\nmake those jumps.",
			"remember to jump\
			\nat last second.",
			"velocity is the\
			\nkey here.",
			},
	 },
	 --skull2
	 skull2={
	 	sp=206,
			x=53,
			y=52,
			wisdom=true,
			dialog2={
			"need to find another way\
			\nto get up there.",
			"* skull moises *",
			"try to go other way\
			\naround sugar.",
			},
	 },
		--door 1
	 door={
	 	sp=110,
			x=26,
			y=59,
			wisdom=true,
			dialog2={
			"the building seems to\
			\nbe vacant.",
			"the path to the inside\
			\nis broken.",
			"the doorway is broken,\
			\nthe house seems empty.",
			},
	 },
	}
	
		
	----------particles------------
	
	--sparkle tables
	sparkle1={
		anim=time(),
		flp=false,
	}
	sparkle2={
		anim=time(),
		flp=false,
	}
	sparkle3={
		anim=time(),
		flp=false,
	}
	
	--sand table
	snd={
		anim=time(),
	 y=0,
		n=0,
	}
	--snow table
	snow={
		sp=56,
		anim=time(),
		x=17*8,
	 y=9*8,
		n=0,
	}
	
	--screen shake table
	shake={ 
		duration=0, 
		magnitude=1,
		anim=0 
	}
	
	--circle
	circle={
		anim=time(),
		switch=false,
		rad=0,
		n=0,
	}
	
	--forces
	gravity=0.3
	friction=0.85
	
	--simple camera
	cam_x=0
	cam_y=0
	
	--map limits
	map_start=0
	map_end=448
	map_top=48
	
	menu={
		bg={
			anim=time(),
			--background patterns
			sp=12,
			x=(-4*8)+1,
			y=(-4*8)+1,
			x1=(-3*8)+1,
			y1=(-3*8)+1,
			n=0,
			z=0,
			--press q to start
			q=true,
			qy=68,
			qn=0,
			qm=0,
		},
	}
	
end
-->8
--update  draw  camera

function _update()
	if game_state=="menu" then
		update_menu()
	elseif game_state=="game" then
		update_game()
	end
end


function update_menu()
	animate_menu_bg()	
	wzrd_animate()
	if btnp(❎) or btnp(🅾️) then
		sfx(15)
		sfx(4)
		do_shake(10,10)
		music(-1,3000)
		game_state="game"
		music(16)
	end
end


function update_game()
	
	key_animate()
	plr_update()
	plr_animate()
	wzrd_animate()
	snd_animate()
	sparkle1_animate()
	sparkle2_animate()
	sparkle3_animate()
	snow_animate()
	circle_animate()

  --simple camera
  cam_x=plr.x-64+(plr.w/2)
  cam_y=plr.y-64+(plr.h/2)
  if cam_x<map_start then
     cam_x=map_start
  end
  if cam_x>map_end-128 then
     cam_x=map_end-128
  end
  if cam_y>map_end-64 then
     cam_y=map_end-64
  end
  if cam_y<map_top+8 and cam_y>0 and cam_x>9*8 then
  			cam_y=map_top+8
  end
  if cam_y<0 then
     cam_y=map_top-119+15
  end
  if flr(cam_y)==0 then
     sfx(4)
  end
  camera(cam_x,cam_y)
  
 	-- listen to screen shake
  check_shake()

  --off map fix
  if plr.y>448+128 then
  	plr.y=390
  	plr.x=40 
  end
  
  if (plr.x>54.9*8 and plr.x<56*8)
  and (plr.y>2*8 and plr.y<5*8)
  then 
  game_state="end"
  	--sfx(16)
			music(-1)
			sfx(10)
  end
  
end


-----------------------------------------------------------

function _draw()
  cls(0)
  if game_state=="menu" then
			draw_menu()
		elseif game_state=="game" then
			draw_game()
		elseif game_state=="end" then
			draw_end()
		end
end

function draw_sky()

 --sky
	rectfill(0,-128,448,48,12)
	line    (448,-78,0,-62,7)
	line    (448,-58,0,-42,7)
	line    (448,-28,0,-12,7)
	
	--glare
	line(40,48,117,111,12)
	line(45,48,115,95,12)
	line(55,48,130,90,12)
	line(43,48,104,128,12)
	line(44,48,82,144,12)
	
	--sun
	circ    (0,-60,78,10)
	circfill(0,-60,77,12)
	circfill(0,-60,55,10)
	circfill(0,-60,52,9)
	circfill(0,-60,50,12)
	circfill(0,-60,40,10)
	circfill(0,-60,35,7)
	circfill(0,-60,28,10)
	circfill(0,-60,20,9)
	
	--cloud 1
	rectfill(45,-30,125,-19,6)
	circfill(5.9*8,-27,8,6)
	circfill(15.9*8,-27,8,6)
	circfill(8*8,-32,16,6)
	circfill(14*8,-32,13,6)
	circfill(10.8*8,-35,19,6)
	circfill(13.8*8,-32,15.7,6)
	--
	rectfill(45,-30,125,-20,7)
	circfill(45,-27,7,7)
	circfill(127,-27,7,7)
	circfill(65,-32,15,7)
	circfill(111,-32,12,7)
	circfill(87,-35,18,7)
	circfill(111,-32,14,7)
	
	
	--cloud 2
	rectfill(125,-65,205,-55,7)
	
	
	--cloud 3
	circfill(24*8,-37,7,6)
	circfill(35*8,-37,7,6)
	circfill(27*8,-42,15,6)
	circfill(33*8,-42,12,6)
	circfill(30*8,-45,18,6)
	circfill(33*8,-42,14,6)
	--
	rectfill(195,-40,275,-30,7)
	circfill(195,-37,7,7)
	circfill(277,-37,7,7)
	circfill(215,-42,15,7)
	circfill(261,-42,12,7)
	circfill(237,-45,18,7)
	circfill(261,-42,14,7)
	
	
	--house
	for i=0,7 do
		spr(34,(i+29)*8,-1*8)
	end
	spr(33,28*8,-1*8)
	rectfill((24*8)+1,(3*8)+3,(30*8)-2,6*8,2)
	
	
	--skeleton mouth
	rectfill(448-(11*8),0+(1*8),448,48,0)
	rectfill(448-(10*8),0+(-2*8),448,48,0)
	rectfill(448-(9*8),0+(-5*8),448,48,0)
	rectfill(448-(8*8),0+(-6*8),448,48,0)
	rectfill(448-(6*8),0+(-7*8),448,48,0)
	--
	for i= 0, 2 do
		spr(58,448-(10*8),0+(-i*8))
		spr(58,448-(9*8),0+((-i-3)*8))
	end
	spr(58,448-(8*8),0+(-9*8))
	spr(58,448-(8*8),0+(-6*8))
	spr(58,448-(6*8),0+(-7*8))
	
	--skeleton forhead
	spr(109, 448-(5*8),0+(-1*8))
	spr(69, 448-(4*8),0+(-1*8))
	spr(66, 448-(3*8),0+(-1*8))
	spr(65, 448-(2*8),0+(-1*8))
	spr(65, 448-(1*8),0+(-1*8))
	
	--skeleton eye
	circfill(448-(3.5*8),4,2,8)
	circfill(448-(3.5*8)-1,4+1,1,9)
	circfill(448-(3.5*8)-1,4+1,0.5,7)
	
	--dark cloud
	rectfill(44.5*8,-43,54*8,-30,6)
	circfill(44.5*8,-37,7,6)
	circfill(55*8,-37,7,13)
	circfill(47*8,-42,15,6)
	circfill(47.2*8,-40,11,13)
	circfill(53*8,-42,12,13)
	circfill(50*8,-45,18,13)
	circfill(53*8,-42,14,13)
end

function draw_wzrds()
	for _, wzrd in pairs(wzrds) do
		mset(wzrd.x, wzrd.y, wzrd.sp)
	end
end


function draw_sparkles()
		--sparkles
		spr(56,9*8,22*8,1,1,sparkle1.flp)
  spr(56,10*8,20*8,1,1,sparkle2.flp)
  spr(56,6*8,28*8,1,1,sparkle3.flp)
  spr(56,4*8,31*8,1,1,sparkle1.flp)
  spr(56,3*8,27*8,1,1,sparkle2.flp)
  spr(56,5*8,22*8,1,1,sparkle3.flp)
  if plr.wisdom==0 then
  	spr(56,8*8,18*8,1,1,sparkle1.flp)
  	spr(56,9*8,18*8,1,1,sparkle1.flp)
  end
  --sand falling
  for i=0,10 do
  	spr(255,49*8,((23+i)*8)+snd.y,1,1)
  end
  for i=0,3 do
  	spr(255,51*8,((23+i)*8)+snd.y,1,1)
  end
  for i=0,4 do
  	spr(255,54*8,((21+i)*8)+snd.y,1,1)
  end
  for i=0,10 do
  	spr(255,(53*8)-4,((23+i)*8)+snd.y,1,1)
  end
  spr(255,(53*8)-4,(23*8)-1,1,1)
  spr(254,(53*8)-4,(32*8)+2,1,1)
  for i=0,1 do
  	spr(255,52*8,((20+i)*8)+snd.y+2,1,1)
  end
end

function draw_keys()
 for _, k in pairs(key.keys) do
  if not k.collected then
   mset(k.x, k.y, key.sp)
  end
 end
end


function draw_snow()
	for i=0,8 do
		for j=0,21 do
			spr(
			snow.sp,snow.x+((j-1)*8),snow.y+(i*8),1,1)
		end
	end
	for i=0,1 do
		for j=0,10 do
			spr(
			snow.sp,snow.x+((j+23)*8)+1,snow.y+(i)*8,1,1)
		end
	end
	for i=0,1 do
		for j=0,5 do
			spr(
			snow.sp,snow.x+((i+21)*8),snow.y+(j*8),1,1
			)
		end
	end
	for i=0,2 do
		spr(snow.sp,snow.x+(i-2)*8,snow.y+(9)*8,1,1)
	end
	
	rectfill(
	(22)*8,((9+9)*8),((17+21)*8)-5,((9+10)*8)-2,1)
	rectfill(
	(39*8)-4,12*8,(40*8)-2,(15*8)+3,1)
	rectfill(
	(37*8)-4,16*8,(39*8)-10,(19*8)-8,1)
	circfill(36*8,17.9*8,8,1)
	--
	rectfill(14*8,19*8,(17*8)-2,(20*8)-2,1)
	
	for i=0,2 do
		spr(56,(44+i)*8,10*8)
	end
	rectfill(45.5*8,10*8,47.2*8,11*8,1)
end


---------print dialog-----------

function print_dialog()
	rectfill(
	cam_x+(9),
	cam_y+(84),
	cam_x+(119),
	cam_y+(116),
	13)
	rectfill(
	cam_x+(10),
	cam_y+(85),
	cam_x+(118),
	cam_y+(115),
	0)
	oprint(
	dialog,
	cam_x+(13),
	cam_y+(88),
	7,13)
end


-->8
--collisions

function collide_map(obj, aim, flag)
	-- local variables initialization
	local x, y, w, h = obj.x, obj.y, obj.w, obj.h
	local x1, y1, x2, y2 = 0, 0, 0, 0
	
	if aim == "left" then
		x1, y1 = x, y+1
		x2, y2 = x, y + h - 1
	elseif aim == "right" then
		x1, y1 = x + w, y+1
		x2, y2 = x + w, y + h - 1
	elseif aim == "up" then
		x1, y1 = x + 2, y - 1
		x2, y2 = x + w - 3, y
	elseif aim == "down" then
		x1, y1 = x + 2, y + h
		x2, y2 = x + w - 3, y + h + 1
	end
	
	x1, y1 = flr(x1 / 8), flr(y1 / 8)
	x2, y2 = flr(x2 / 8), flr(y2 / 8)
	
	local tiles = {
		{x=x1, y=y1}, {x=x1, y=y2},
		{x=x2, y=y1}, {x=x2, y=y2}
	}
	
	for _, tile in pairs(tiles) do
		local tx, ty = tile.x, tile.y
		if fget(mget(tx, ty), flag) then
			return true, tx, ty
		end
	end
	
	return false, nil, nil
end


function limit_speed(num,maximum)
  return mid(-maximum,num,maximum)
end
-->8
--plr = player

function plr_update()
		
		--sand physics
		if collide_map(plr,"down",3) then
			friction=0.55
			plr.boost=2.25
		--ice physics
		elseif collide_map(plr,"down",2) then
			friction=1
		--default
		else
			friction=0.85
			gravity=0.3
			plr.boost=3.5
		end
		
		
		--listen to key tiles
		if collide_map(plr,"down",4)
		or collide_map(plr,"right",4)
		or collide_map(plr,"left",4)
		or collide_map(plr,"up",4)
		then
			pick_up_key()
		end


  --physics
  plr.dy += gravity
  plr.dx *= friction
  
  --controls
  if btn(⬅️) then
    plr.dx -= plr.acc
    plr.running = true
    plr.flp = true
    show_dialog=false
  end
  if btn(➡️) then
    plr.dx += plr.acc
    plr.running = true
    plr.flp = false
    show_dialog=false
  end
  
  --slide
  if plr.running
  and not btn(⬅️)
  and not btn(➡️)
  and not plr.falling
  and not plr.jumping then
    plr.running = false
    plr.sliding = true
  end
  
  --jump
  if (btnp(❎) or btnp(⬆️))
  and plr.landed then
  		sfx(15,3,2)
    plr.dy -= plr.boost
    plr.landed = false
    plr.jumping = true
    show_dialog=false
  end
  
  --interact with world
  if btnp(🅾️)
  then
  	open_path()
  	talk()  
  end
  
  --check for collision up & down
  if plr.dy > 0 then
    plr.falling = true
    plr.landed = false
    plr.jumping = false
    
    plr.dy=limit_speed(plr.dy, plr.max_dy)
    
    if collide_map(plr, "down", 0) then
      plr.landed = true
      plr.falling = false
      plr.dy = 0
      plr.y-=((plr.y+plr.h+2.5)%8)-2.5
    end
  elseif plr.dy < 0 then
    plr.jumping = true  -- here it's fine
    if collide_map(plr, "up", 1) then
      plr.dy = 0
    end
  else
    plr.jumping = false  -- explicitly set this to false when dy is 0
  end
  
  --check collision left & right
  if plr.dx < 0 then
  	
  	 plr.dx=limit_speed(plr.dx, plr.max_dx)
  
    if collide_map(plr, "left", 1) then
      plr.dx = 0
    end
  elseif plr.dx > 0 then
  	
  	 plr.dx=limit_speed(plr.dx, plr.max_dx)
  
    if collide_map(plr, "right", 1) then
      plr.dx = 0
    end
  end

  --stop sliding
  if plr.sliding then
    if abs(plr.dx) < .2
    or plr.running then
      plr.dx = 0
      plr.sliding = false
    end
  end
  
  plr.x += plr.dx
  plr.y += plr.dy
  
  --limit player to map
  if plr.x<map_start then
    plr.x=map_start
  end
  if plr.x>map_end-plr.w then
    plr.x=map_end-plr.w
  end
  
end



-->8
--animations

--animate player
function plr_animate()
  if plr.jumping then
    plr.sp=7
  elseif plr.falling then
    plr.sp=8
  elseif plr.sliding then
    plr.sp=9
  elseif plr.running then
    if time()-plr.anim>.1 then
      plr.anim=time()
      plr.sp+=1
      if plr.sp>6 then
        plr.sp=3
      end
    end
  else --plr idle
    if time()-plr.anim>.3 then
      plr.anim=time()
      plr.sp+=1
      if plr.sp>2 then
        plr.sp=1
      end
    end
  end
end


--animate key
function key_animate()
	
	--animation - not proud of it
	if time()-key.anim>.2 then
	 
	 key.anim=time()
	 
	 if key.sp==20 then
	  key.flp = not key.flp	 
	 elseif key.sp==16 then
	  key.flp = not key.flp
	 end
	 
	 if not key.flp then
	 	key.sp+=1	 
	 else
	 	key.sp-=1
	 end
	 
	end
	
end

--animate wizards! (they are so wise)
function wzrd_animate()
	if time()-wzrds.wzrd.anim>.6 then
	 wzrds.wzrd.anim=time()
	 if wzrds.wzrd.sp==35 then
	  wzrds.wzrd.sp=51
	  wzrds.wzrd_2.sp=51
	  wzrds.snd_wzrd.sp=222
	  wzrds.ice_wzrd.sp=14
	  wzrds.haunt_wzrd.sp=12
	  wzrds.haunt_wzrd_2.sp=12
	  wzrds.dark_wzrd.sp=125
	  wzrds.dark_wzrd_2.sp=32
	 else
	 	wzrds.wzrd.sp=35
	 	wzrds.wzrd_2.sp=35
	 	wzrds.snd_wzrd.sp=223
  	wzrds.ice_wzrd.sp=15
  	wzrds.haunt_wzrd.sp=13
  	wzrds.haunt_wzrd_2.sp=13
	  wzrds.dark_wzrd.sp=32
	  wzrds.dark_wzrd_2.sp=125
	 end
	end
end

--animate sparkle
function sparkle1_animate()
	if time()-sparkle1.anim>(0.8-rnd(0.6)) then
		 sparkle1.anim=time()
	 	sparkle1.flp = not sparkle1.flp
	end	
end
---
function sparkle2_animate()
	if time()-sparkle2.anim>(0.8-rnd(0.6)) then
		 sparkle2.anim=time()
	 	sparkle2.flp = not sparkle2.flp
	end	
end
---
function sparkle3_animate()
	if time()-sparkle3.anim>(0.8-rnd(0.6)) then
		 sparkle3.anim=time()
	 	sparkle3.flp = not sparkle3.flp
	end	
end


--animate sand
function snd_animate()
	if time()-snd.anim>.07 then
		 snd.anim=time()
	 	snd.n+=1
	 	
			if snd.n<=7 then
				snd.y+=1
			else
				snd.y-=7
				snd.n=0
			end
	end	
end

--animate snow
function snow_animate()
	if time()-snow.anim>rnd(.05)+.03 then
		 snow.anim=time()
	 	snow.n+=1
	 	
			if snow.n<=7 then
				snow.x-=1
				snow.y+=1
			else
				snow.x+=7
				snow.y-=7
				snow.n=0
			end
	end	
end

function animate_menu_bg()
	if time()-menu.bg.anim>.03 then
		menu.bg.anim=time()
	 menu.bg.n+=1
		if menu.bg.n<=8*6 then
			menu.bg.x+=1
			menu.bg.y+=1
		else
			menu.bg.x-=8*6
			menu.bg.y-=8*6
			menu.bg.n=0
		end
		
		menu.bg.z+=1
		if menu.bg.z>= 25 then
			if menu.bg.sp == 12 then
	 		menu.bg.sp=13
	 	else menu.bg.sp=12
	 	end
	 	menu.bg.z=0
	 end
	 
	 menu.bg.qn+=1
	 if menu.bg.qn>=7 then
	 	if menu.bg.q then
	 		menu.bg.qy+=1
	 	else
	 		menu.bg.qy-=1
	 	end
	 	if menu.bg.qm>=5 then
	 		menu.bg.q=not menu.bg.q
	 		menu.bg.qm=0
	 	end
	 	menu.bg.qn=0
	 	menu.bg.qm+=1
	 end
	 
	end
end

--player circle effect
function draw_circle()
	circfill(plr.x+4,plr.y+4,circle.rad+7,1)
	circfill(plr.x+4,plr.y+4,circle.rad-1,1)
	circ(plr.x+4,plr.y+4,circle.rad+9,1)
	circ(plr.x+4,plr.y+4,circle.rad+12,1)
end
--
function circle_animate()
	if time()-circle.anim>.1 then
	 circle.anim=time()
	 circle.n+=1
	 if circle.n==6 then
	 	circle.switch = not circle.switch
	 	circle.n=0
	 elseif circle.n==0 then
	 	circle.switch = not circle.switch
	 	circle.n=0
	 end
	 if circle.switch then
	 	circle.rad-=1
	 else
	 	circle.rad+=1
	 end
	end
end

-->8
--interaction functions

function open_path()
 local directions = {"down", "right", "left", "up"}
 for _, dir in ipairs(directions) do
 	local collided, col_x, col_y = collide_map(plr, dir, 5)
  if collided then
   local isdoublepath = false
   local adjacenttiles = {
    {x = col_x, y = col_y + 1}, -- below
    {x = col_x, y = col_y - 1}, -- above
    {x = col_x + 1, y = col_y}, -- right
    {x = col_x - 1, y = col_y}, -- left
   }
   for _, tile in ipairs(adjacenttiles) do
   	if fget(mget(tile.x, tile.y), 5) then -- check if adjacent tile also has a flag 5
     isdoublepath = true
     break
    end
   end
   
   if isdoublepath then
    if plr.keys >= 2 then
     plr.keys -= 2 -- use two keys for double paths
     sfx(0,0,1)
     sfx(7)
     do_shake(12,5)
     swap_tiles_double(col_x,col_y,0) -- calling appropriate function for double path
    else
     sfx(2) -- sound for not enough keys
    end
   else
    if plr.keys >= 1 then
     plr.keys -= 1 -- use one key for single paths
     sfx(0,0,1)
     sfx(7)
     do_shake(12,5)
     swap_tiles(col_x, col_y, 0)
    else
     sfx(2) -- sound for not enough keys
    end
   end
   break
  end
 end
end


function pick_up_key()
	local directions = {"down", "right", "left", "up"}
 for _, k in pairs(key.keys) do
  if not k.collected then
   for _, dir in ipairs(directions) do
   local collided, col_x, col_y = collide_map(plr, dir, 4)
    if collided and col_x == k.x and col_y == k.y then
     k.collected = true
     plr.keys += 1
     sfx(3)
     mset(col_x, col_y, 0)
     return -- exit the function once a key is picked up.
    end
   end
  end
 end
end



function swap_tiles(x, y, newtile)
    mset(x, y, 0)
    mset(x, y + 2, 61)
end

function swap_tiles_double(x, y)
    local right_tile = mget(x + 1, y)
    local left_tile = mget(x - 1, y)
    if right_tile == 45 then
        swap_tiles_r(x, y)
    elseif left_tile == 45 then
        swap_tiles_l(x, y)
end
end


function swap_tiles_r(x, y)
 mset(x  ,y,0)
 mset(x+1,y,0)
 mset(x-1,y,61)
 mset(x+2,y,61)
end

function swap_tiles_l(x, y)
 mset(x  ,y,0)
 mset(x-1,y,0)
 mset(x+1,y,61)
 mset(x-2,y,61)
end

function do_shake(duration, magnitude)
    shake.duration = duration
    shake.magnitude = magnitude
end

function check_shake()
	if shake.duration > 0 then
  cam_x = cam_x + rnd(shake.magnitude) - shake.magnitude / 2
  cam_y = cam_y + rnd(shake.magnitude) - shake.magnitude / 2
  shake.duration -= 1
 end
end

---------dialog---------------------


function talk()
	local directions = {"down", "right", "left", "up"}
 for _, w in pairs(wzrds) do
   for _, dir in ipairs(directions) do
   local collided, col_x, col_y = collide_map(plr, dir, 6)
    if collided and col_x == w.x and col_y == w.y then
    
     if w.wisdom==false then
     	w.wisdom=true
     	dialog=w.dialog1
     	sfx(9)
     	do_shake(5,5)
     	plr.wisdom+=1
     elseif w.mv_cat==true then
     	dialog=w.dialog1
     	sfx(2)
     	do_shake(5,5)
     else
   	  dialog=w.dialog2[flr(rnd(3)+1)]
     end
     
     show_dialog=true
     if plr.wisdom==6 then
     	dialog="finally some wisdom!\
     	\nyou can pass."
      sfx(3)
     	mv_cat()
     	w.mv_cat=false
     end
     sfx(6)
     return -- exit the function once a key is picked up.
   end
  end
 end
end

function mv_cat()
	if (plr.x>3*8 and plr.x<10*8)
	and (plr.y>15*8 and plr.y<19*8) then
		do_shake(10,10)
		mset(8,15,30)
		mset(9,15,31)
		mset(8,16,46)
		mset(9,16,47)
		mset(8,17,62)
		mset(9,17,63)
		mset(8,18,0)
		mset(9,18,0)
		mset(wzrds.dark_wzrd.x,wzrds.dark_wzrd.y,0)
		--wzrds.dark_wzrd.x+=2
		plr.wisdom=0
	end
end
-->8
--menu screen & end screen

function draw_menu()
	for i=0,20 do
		for j=0,20 do
		 spr(27,menu.bg.x1+(i*8),menu.bg.y1+(j*8),1,1)
		end
	end
	for i=0,25,6 do
	 for j=0,25,6 do
	 	spr(menu.bg.sp,menu.bg.x+(i*8),menu.bg.y+(j*8),1,1)
	 end
	end
	for i=3,27,6 do
	 for j=3,27,6 do
	 	spr(44,menu.bg.x+(i*8),menu.bg.y+(j*8),1,1)
	 end
	end

	rectfill(16,13,108,50,0)
	rectfill(18,15,106,48,4)
	rectfill(21,15,106,44,9)
	bigprint("raiot",23.8,17,4,10,4)
	--
	oprint("the parkour game",33,55,9)
	oprint("by daniil ivzhenko",29,65,10)
	oprint("press ❎ or 🅾️ to start",19,menu.bg.qy+17,12)
	--cats
	spr(30,1*8,6*8,2,2)
	spr(62,1*8,8*8,2,1)
	spr(30,13*8,6*8,2,2,true)
	spr(62,13*8,8*8,2,1,true)
	--ground
	for i=0,15 do
		spr(83,i*8,15*8,1,1)
		spr(64,i*8,14*8,1,1)
	end
	
	spr(92,3*8,13*8,1,1)
	spr(92,5*8,13*8,1,1)
	spr(94,6*8,13*8,1,1)
	spr(94,8*8,13*8,1,1)
	spr(92,11*8,13*8,1,1)
end

--------------------------------

function draw_game()
  
  -- draw the background
  bg(cam_x * .2, cam_y * .2)  -- the 0.5 value will make the background move at half the speed
  draw_sky()
  if cam_y>0  then
  	draw_circle()
  end
  
  --entities, map and camera
  camera(cam_x, cam_y)
  
  draw_sparkles()
  draw_snow()
  map(0, 0)
  draw_keys()
  draw_wzrds()
  spr(plr.sp,plr.x,plr.y,1,1,plr.flp)
		if show_dialog then
			print_dialog()
		end
  
  -- reset camera for ui or other static elements
  camera()
end


function bg(offset_x, offset_y)
  -- calculate the starting point for the tiles so that they align with the map
  local start_x = flr(offset_x / 32) * 32
  local start_y = flr(offset_y / 32) * 32

  for i = -5, 16*4 do
    for j = -5, 16*4 do
      -- position each sprite based on the loop index and the calculated start position
      local x = i * 32/4 + start_x - offset_x
      local y = j * 32/4 + start_y - offset_y
      
      spr(27, x, y, 1, 1)  -- scaled to 4x4 (32x32 pixels)
    end
  end
end

--------------------------------

function draw_end()
	camera(0,0)
	bigprint("the end",10,50,7,0,4)
end

--------------------------------
--big text

function oprint(str,x,y,c,co) --outline print
 for xx=-1,1,1 do
  for yy=-1,1,1 do
   print(str,x+xx,y+yy,co)
  end
 end
 print(str,x,y,c)
end

function bigprint(str,x,y,c,co,scale)
 poke(0x5f54,0x60) -- screen is spritesheet. spr and sspr use screen as source
 oprint(str,x,y,c,co) -- outline print to desired location
 local x0 = x-1
 local y0 = y-1
 local w = #str*4 + 2
 local h = 7 -- only works on single line strings for now
 palt(0b1111111111111111) -- set all colors transparent
 palt(c,false) -- only draw the text and outline colors
 palt(co,false)
 sspr(x0,y0,w,h,x0,y0,w*scale,h*scale) -- stretch the text with desired scale
 palt()
 poke(0x5f54,0x00) -- set spritesheet back to source for spr
end
__gfx__
0000000000444440004444400004444400044444000444440004444490044444000000000000000000000111111000000023b0000023b0000007c7000007c700
00000000009aaa90009aaa900aa99aa990a99aa99a099aa990a99aa90aa99aa9044444000444440000011d1dd1d1100000023b0000023b00007c7000007c7000
007007000973f7300973f730900ff73f0a0ff73f00aff73f0a0ff73f000ff73f09aaa90099aaa900001ddd1dd1ddd10000233330002333300676650006766504
0007700009fffff009ffeff0000ffffe000ffffe000ffffe000ffffe000ffffe973f7300973f7300001ddd1dd1ddd10053333335555555555667666555555555
000770000009900000999a000faaa0000faaa0000faaa0000faaa0000000aaa09ffeff000ffeff0001d1d11ee11d1d1005555555002794a0555555540cfc7d04
00700700009aaa000f0aa0f0000a9000000a90000009a0000009a0000000990f00aaa9f000aaa9f001eeee1ee1eeee10002794a0022242440cfc7d04ff2fddd0
000000000f0a90f0000a90000da0900000a900000d90a000009a0000000009500f09aa000f09a50001ee11111111ee100222444400224440ffffddd00fffdd00
0000000000d00d0000d00d000000d00000dd00000000d00000dd00000000009500009a9500009a50011116776771111000200040002000400f000d000f000d00
100001c0000011c0000000000c1100000c100001bbbbbbbbbbbbbbbbbbbbbbbb00bbbbbbbbbbbb0000000000100011110670067006700670000a00000a000000
000000000c0100000011cc00000010c0000000003bbb3bb33b3b3b3b3bb3b3b30bbbb3b33b3bbbb00000000000011111007006700670067000a9a0a0a9a00000
00000aa000000a0001c0000000a000000aa0000033b333b333333b33b3b3bbb3bb3b33355333b3bb0000000000111111007006700670060000a999aa99990000
9aaa900909aaa0a00c09aa000a0aaa909009aaa95b355535553b333bb3333b3bbbb3355555d33bbb0b00000001111111006006600600000000a444a444990a00
9090a00909a090900009a90009090a90900a09096b356555553b3353b35553bbbb3565d5557dd3bb0b0000b0111111100000066006000000a0aaa4a4aa99a000
0000099000000900000090c0009000000990000053555d556553b37335d55533b3357555d555533b00b00b0011111100000006000000000009aaa999aaa99990
00000000000010c0000001100c01000000000000555755755553b3655d675d53bbb3555755563bbb0030030b111110000000060000000000aaaaa222aaaa9000
000c10010c1100000c11c000000011c01001c000555d55555557365555775555bb355d555d5553bbb030300311110001000000000000000009a4aa2aa4a94440
0007670000bbbb0bb0bbbb000028e000565527ee555527eee272227227222000bb355555555553bb0000000000000000000c0c000d66777090a944944994a944
0076700003bbbb3003b0bb3070028e0055522e705d522672e72ee72ee27ee200b33565555d55533b0000000000000800000ccc00d6666667004999999994aa92
066667003b03bbbb3bb3bbbb0028888065d2ee0065d22eee6ee67ee677777007335555555d55553300000b0008008a80000ddc00dd66d0660004499994a4aa22
76666667bbbbbbb3bbbbbbb3288888825527e0005527ee70000000000000000055555556555655550b000b008a80080000007000d0000d0600a994444aa9aa40
77777770bbbbbb3bbbbbbbbb4222222255227600552276e7222722277222722055d556555d5555550b000300080b0b0b07076000d0dd06060aaaaaaaaa99aa90
0858710a0b00b0330bbb0b3340d7efb055d2ee00d5d2ee2ee7ee727ee727e7eedd5555555567555503000300b000300300660000dd66d0d60aa944aaaa9aa940
5555111930bbbbb330bbb0b30dddffffd5d2e7e056d2e76e6e22e622e7e7ee00d5557655d75555dd0300b00b0b0b00b000067000dd666ddd04aaa94aaaaa9920
050001000bb3bbbb0bb3bb0b00d000f0555d227e555d2270000000000000000055555555555556550030303003030030000600000dddddd00044a94999a92200
0600d00660060006600600607028e000b0033373b3733373bb735555bb73d55507000700dd5dddddccccc000ccc00ccc000000000d6677700a92922669990000
060d0060d006000d6006006007028e00003bb73bb73bb73b376335d507b336557070000055555555cccc0000cccc00cc00000000d6666667a99a225dd6990000
0d0600d0060d00000d06d00d4028888000077bb76bb67bb6bbb33d5600bb3d5d0600000055655565ccc00000ccccc00c00000000dd66da6699aaa455dd6aa000
0d0600d00d0d00000200d00d22222222000000000000000007bb7355000b73550000000056765676ccc0c00c0cc0c00000000000da9aada649aaa9455dd9aa00
6000d0600d00d000292d00d040d7efb003373337333733377b6733550067336500000700766766670c0000cc00cccc0c00007000d9dd9696499aaa9455499a00
d000d0060000d000020200200dddf2ffbb6b737bb7bb737bb3bb3d5d00bb3d550000607067666666cc00ccc00000cc0070006000dd66d9d6249aa944449994a0
d000d00d000000000029229200ddfff000bbb6bb6b33b633b67b3d650b7b3d550000060066766676cccccc000000000060070070dd666ddd229994a2a2992a49
0600600d000000000002002000d000f000000000000000000733d555b633d55600700000777777770cc0c0000000c00c070607000dddddd00224429292442924
cccccccccccccccccccccccccccccccccccccccc00cccccccccccc00cc155555555551ccc1155555cc1c1155cc1565655556511c5565511c555611cc5555d555
1ccc1cc11c1c1c1c1cc1c1c1c1cc1cccccccccc10cccc1c11c1cccc0c11565555d55511cccc15555c1115765ccc15555551cc1cc555551cc5511c11c55557655
11c111c111111c11c1c1ccc1111111c11c1c11c1cc1c11155111c1cc115555555d555511cc155d55ccc11116cc155d5556711ccc5551111c567111cc55d55715
5c155515551c111cc1111c1c1c15551511ccc111ccc1155555d11ccc5555555655565555c1156555c1111cc1c1156665d75551cc711cc1ccd75551cc555651c6
6c156555551c1151c15551cc61156556651c1155cc1565d5557dd1cc55d556555d555555cc15557dcc1cc117cc15557d5556511c1cc1111c5666511c515551c5
51755d556551c17115d5551151756d5557711d55c1157555d555511cdd55555555675555ccc11765c1111555cc11176555d551cc61111ccc55d551cc1c111c11
556755555551c1655d675d515567655655651555ccc1555755561cccd5557655d75555ddcc1cc155cc155555c11c115555551ccc5675111c55551ccc1cc1ccc1
555d55555557165555775555555d5555555d5556cc155d555d5551cc5555555555555655c1156555c1155655cc1165555555511c5511c1cc565651cccccccccc
555555555555555d555556655555555500dddddddddddd00ddddd00d555655555d5555555555d555555d55555555d5550000000000000000000000005555d555
5555d555556555555565555555d557550dd7d776677d7dd06677dddd55555555575d5dd555557655556755555555765500000000000000000000000065567655
55d555555555555555555555555555550d776776677677d076776776555565655565555555d5571551755d5555d557150000000000000c000000000055d65715
55555556556655755d5555755d555555dd776777777677dd767767775655557555756555555651c66c156555555651c6000000000c000c000c00000065565116
55d57555d666655555555577555555d5d67767777776776d767767775555555555555555515551c55c155515515551c50c000c000c000c000c0000c0515551c1
55555555dd6665655555576555575555d67766766766776d767766761155d555655555111c111c1111c111c11c111c11c000c00c0c00cc0000c00c001c111111
566555555dddd55555577655575d5555d67776766767776d66777676c1155d555d55511c1cc1ccc11ccc1cc11cc1ccc10c0c00c00c00c00c00c00c0cccc1cc1c
5555555d555555555655755d55555555d77776766767777d67777676cc155dd55d5551cccccccccccccccccccccccccc0c0c00c00cc0c0ccc0c0c00ccccccccc
666777666667776666677766666777666667777667777666d7776776677767766776776d67776776677767767007000700000000000000000000000000000000
77666667776666670706660767665605776666d00d666677dd77677666776776677677d660076706607767760760007600000000000000000000020000000000
7777777777777777007777700077770677777100001777770d776776767767766776777676006006700767060007770002000000000000070200292000000080
7666667776666677706066077006666776d1000000001d67dd776777767767777776776676700077767060076760707629200020000000602920020008000488
667776666677766666077666666776666d100000000001d6d6776777767767777776766d76700777767006770070707002c0029200000770020c0c0348800060
ddddddddddddddddddddddddddddddddd10000000000001dd677667666776676676676d066770676667760000767070000c00c2000007707c000c00c06000660
00d666000000000000000000000000000000000000000000d677767666777676676776d066700676667770760707677003c03c0c000760600c0c00c000600600
00d666000000000000000000000000000000000000000000d777767667777676676776dd67777676677776766000700700c0c00c007070070c0c00c000606000
00d6660000d6760000d6500000d6770000d76700d1dddd100000050000500000bbbbbbbbbbbbbbbb3bbbbbbbbbbbb3bbbbbb3bbb00076700c155557555d551cc
00d6760000d6770000d5000000d6760000d76700d1dddd1d00005d0000d5000073b63b6763b3bb3633633b737363bb3b63b333b600767000cc15d55575551ccc
00d6670000d770000050050000d66d0000d6670011dddd1d0005d600006d5000773b3777777b733703b73b777773b33b773b733706666700c115555d5557511c
00d7770000d70700000056000066d500005d6700d1dddd1d000d66000066d000766b66377666637703b03b6776d3b3b3333b63b377777777cc1167555d5651cc
00d6770000d67700005557000066d000000d6600d1e1ee1e005d66000066d500667776666677766603b03bd66d33b003663b73360858710accc1551555511ccc
00d6760000d0760000666700006d50000005d600e1e11e1e00d66d0000d66d00dddddddddddddddd00b003bdd103b003dd3bbd3d55251119cc1c11c15111c1cc
00d6770000d6070000d7670000d5000000005d001116611100676d0000d6760000d666000000000000b003b00003b0000003b030055511000cccc1cc1c1cccc0
00d7760000d7760000d0660000500000000005007676677700776d0000d6770000d6660000000000000000b000030000000300300500010000cccccccccccc00
0505c483d6e2c4000073c4f60000a405c4000000b1b1b1b100e7758584000000000054ebebeb64c50000b10000000000000000000000fb05dddddddddddddddd
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d544444dd566466d
0505843464e3c4004363f7460000e775c4000000b1b1b1b10047e7f7270000b10000e7a5751584640000b100000000fb00effcfbec54eb05d546464dd566466d
0000610000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d546464dd544444d
b595a5b584ebc4d500070700000000b4d4000000b1b1b1b100001303370000b1000007d6e795a5f700b1b100000054ebebebebebeb740535d546464dd566466d
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d546464dd556466d
575757b0e7a58464c54707000000e6a4c40000b1b1b1b1b1000000230000b1b1000006264603130000b1b1000056e7a57535150505153505d546464ddd55555d
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d544444d44444444
861383271303e7756400370000005474d40000b1b1b1b100000000000000b1000000370000230000b1b1b10000000000e795050535053515d544aa9d77777777
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d544444d66766676
6500b217b11300a4e4d500000000e775e40000b1b1b100b1b10000000000b1000000000000b1b1b1b1b1000000000000d6b6e77525153535d546464d67666666
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d546464d76676667
716161b7b1b183e77564c60000008373e40000b1b1b1b100b1b1b1b1b1b1b10000b1b1b1b1b1b1b1b1b1b1007700a706b6b613b405353515d546464d56765676
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d554444d55655565
3585f783b1b10003a484428300436305c4000000b100b100b1b100b1b1b1b1b1b1b1b1b1b10000000000000007000007b60000e7753535353555555d55555555
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddd5ddddd
35c4c500b1b15606e775527200836305d4000000b1b1b1b1b1b1b1b1b1b1b1b1b1000000000000000000000027d6b60700000003b43535053507767777767000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000766676776666770
358464b1f6b1b1b113e7f7d2d5f6a485f7000000b1b1b1b1b1b1b10000b1b100000000000000f6005687b70007b6b62700000003e77525057666766666766667
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007667667667667677
3535c42646b1b1b100030000540474c40300b1b1b1b100b1b1b1b10000b100000000e5fc00005464e507000017b6001700b1001303e77505d676575676676675
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd6555566566565d
3585f7b1b1b1b1b1b11300b1a41585f70300b1b1b1b1b1b1b1b100000000b10000d5546400b1a415640700002700004700b1b1b12303b4050dd5555555655dd0
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd555dddd000
3585130000b100b1b1b10000e7a5f7001300b1b100b1b1b1b1b1b100b1b1b100005474f700b1e705d42700d607000000b1b1b1f60013e775aaa999a900000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000499a999a00000000
35c43646b1b1b1b1b1b1b100001300000000b1b1b1b100b1b1b1b1b1b100000000a4057200b1e573d406d6b607000000b100a0575757b0a49449949900000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004499449900000000
85f7b1b1fbb1b1b1b100e5c50000000000b1b100b1b100005687b7000000000000e7756400d65485f707b6b637000000b10017b155d617945494594400000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d54555450a000a00
d413b100eeb1b1b1e6541464b100000000b1b1b1b10000000007c36700c300000023e7f7b6b6e7f703370000000000b1b1b1a706879706a455555d5d0090090a
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055d5555500400400
e4000000b1b1b1b1544273d4b1b1b1b1b1b1b1b1b1000000a787c787160646000000031300002303130000000000b1b1b1b1b117830007b40000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000066666000000000
c4e60000b1b1b1b1e7a595f7b1b1b100b1b1b1b100b1000000670007003700000000130000000013b1b1000000b1b1b1b1b1b127000054740677770700000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006007007600202002
84640000b100b1b1b11313b1b1b100b1b1b1b1b1b1b10000c327001700670000b100b1b1b1b1b1b1b1b1b1b1b1b100b1b1b100070000b4056777777620020020
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006707776602222220
05c40000b100b1b1b100b1b1b100b1b1b1b1b1b100000000560616871687b70000b1b1b1b1b1b1000000b1b1b100b1b100b1b1170000b405067777602288ee22
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000676760002288820
05c40000b1000000b1b1b1b1b1b100b1b1b1b1000000000000070007c307000000b1b1b1b1b1b1b1b1b1b100b1b1b100b1b1002700ecb405049a0000049a0007
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000049a0070049a070
05c4d500b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b10000a7871687c706464700b1b1b100000000000000b1b1000000000000000047005474050499990004999905
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009999994444444444
2584640000b1b1b1b1b1b1b1b1b100b1b1b1b1b1b100001700070007000000b10000000000f6000000b1b1000000a057575757b000b40505444444450d73fb05
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d73fb05dddfeff0
3505c400000000b1b1b1b1b100b1b1b10000000000000007c317f627007700000000a0575757b00000b1b1000000f6664686b607c3b40515dddffff00ddfff00
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d000f000d000f00
3535c400000000b1b1b1b10000b1b1b1000000a78726c70616061697c706000000a05757575757b000b1b1000056167616a6160616b435050aa999a94494a994
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000499a999a00a99a90
05058464000000b1b1b1b100b1b1b1b1000000000700c3a0575757b00027000000275666468646170000b1000000c366d666c3275474353594499499000a9000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004499449900000000
353505c4d500000000b1b1b100b1b1000000000087971666b6669686000700000007c366c6860047f60000000000567665451606a4253505d494594400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d4d554500000000
353525846400000000b1b1b1b1b10000000000002700d6666586e666d5170000001745764586b6a0575757b0000000669646d55474352505000ddd5d00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd500000000
15350535d40000000000000000b10000c30087c706d5544474358444640700c30017664656860007c566c31777fc676646675435153535050000000000009000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
35050535846400e50000000000c50000069787f6544474250515053584640006260686d6b607c50745765586062606466707740525353535000000000000a000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a000000000000
052535353584240464d500e65444042404042404740535153505353525844404440444748404440444047484044404147444050535353515000aa00000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aa900000000000
050505350515053584143444740515053505352505150505350515050535051505150515051505150515050515051515353535351505050500a99a900000a000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004494a99400000000
__label__
11111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000
11000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111
10001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111
10011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111
10111111101111111011111110111111101111111011111110111111101111111011111110111111101111111011111110111111101111111011111110111111
01111111011111110111111101111111011111110111111101111111011111110111111101111111011111110111111101111111011111110111111101111111
01111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110
01111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100
11111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000
11000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111
10001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111
10011111100111b32001111110011111100111111001111110011111100111b32001111110011111100111111001111110011111100111b32001111110011111
1011111110111b32101111111011111110111111101111111011111110111b32101111111011111110111111101111111011111110111b321011111110111111
01111111011133330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003332111111101111111
01111110011555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005555551111001111110
011111000111a4970044499999999999999999999999999999999999999999999999999999999999999999999999999999999999999004972111110001111100
1111100011144242004449aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa9002422211100011111000
1100011111004442004449aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa9004422100011111000111
1000111110004111004449aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa9001112000111110001111
1001111110011111004449aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa9001111001111110011111
1011111110111111004449aaaa444444444444aaaa444444444444aaaa444444444444aaaaaaaa44444444aaaa444444444444aaaa9001111011111110111111
0111111101111111004449aaaa444444444444aaaa444444444444aaaa444444444444aaaaaaaa44444444aaaa444444444444aaaa9001110111111101111111
0111111001111110004449aaaa444444444444aaaa444444444444aaaa444444444444aaaaaaaa44444444aaaa444444444444aaaa9001100111111001111110
0111110001111100004449aaaa444444444444aaaa444444444444aaaa444444444444aaaaaaaa44444444aaaa444444444444aaaa9001000111110001111100
1111100011111000004449aaaa4444aaaa4444aaaa4444aaaa4444aaaaaaaa4444aaaaaaaa4444aaaa4444aaaaaaaa4444aaaaaaaa9000001111100011111000
1100011111000111004449aaaa4444aaaa4444aaaa4444aaaa4444aaaaaaaa4444aaaaaaaa4444aaaa4444aaaaaaaa4444aaaaaaaa9001111100011111000111
1000111110001111004449aaaa4444aaaa4444aaaa4444aaaa4444aaaaaaaa4444aaaaaaaa4444aaaa4444aaaaaaaa4444aaaaaaaa9001111000111110001111
1001111110011111004449aaaa4444aaaa4444aaaa4444aaaa4444aaaaaaaa4444aaaaaaaa4444aaaa4444aaaaaaaa4444aaaaaaaa9001111001111110011111
1011111110111111004449aaaa44444444aaaaaaaa444444444444aaaaaaaa4444aaaaaaaa4444aaaa4444aaaaaaaa4444aaaa99999001111011111110111111
0111111101111111004449aaaa44444444aaaaaaaa444444444444aaaaaaaa4444aaaaaaaa4444aaaa4444aaaaaaaa4444aaaa99999001110111111101111111
0111111001111110004449aaaa44444444aaaaaaaa444444444444aaaaaaaa4444aaaaaaaa4444aaaa4444aaaaaaaa4444aaaa99999001100111111001111110
0111110001111100004449aaaa44444444aaaaaaaa444444444444aaaaaaaa4444aaaaaaaa4444aaaa4444aaaaaaaa4444aaaa99999001000111110001111100
1111100011111000004449aaaa4444aaaa4444aaaa4444aaaa4444aaaaaaaa4444aaaaaaaa4444aaaa4444aaaaaaaa4444aaaa99999000001111100011111000
1100011111000111004449aaaa4444aaaa4444aaaa4444aaaa4444aaaaaaaa4444aaaaaaaa4444aaaa4444aaaaaaaa4444aaaa99999001111100011111000111
1000111110001111004449aaaa4444aaaa4444aaaa4444aaaa4444aaaaaaaa4444aaaaaaaa4444aaaa4444aaaaaaaa4444aaaa99999001111000111110001111
1001111110011111004449aaaa4444aaaa4444aaaa4444aaaa4444aaaaaaaa4444aaaaaaaa4444aaaa4444aaaaaaaa4444aaaa99999001111001111110011111
1011111110111111004449aaaa4444aaaa4444aaaa4444aaaa4444aaaa444444444444aaaa44444444aaaaaaaaaaaa4444aaaa99999001111011111110111111
0111111101111111004449aaaa4444aaaa4444aaaa4444aaaa4444aaaa444444444444aaaa44444444aaaaaaaaaaaa4444aaaa99999001110111111101111111
0111111001111110004449aaaa4444aaaa4444aaaa4444aaaa4444aaaa444444444444aaaa44444444aaaaaaaaaaaa4444aaaa99999001100111111001111110
0111110001111100004449aaaa4444aaaa4444aaaa4444aaaa4444aaaa444444444444aaaa44444444aaaaaaaaaaaa4444aaaa99999001000111110001111100
1111100011111000004449aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa9999aaaaaaaaaaaa99999000001111100011111000
1100011111000111004449aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa9999aaaaaaaaaaaa99999001111100011111000111
1000111110001111004449aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa9999aaaaaaaaaaaa99999001111000111110001111
1001111110011111004449aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa9999aaaaaaaaaaaa99999001111001111110011111
10111111101111110044499999999999999999999999999999999999999999999999999999999999999999999999999999999999999001111011111110111111
01111111011111110044444444444444444444444444444444444444444444444444444444444444444444444444444444444444444001110111111101111111
01111110011111100044444444444444444444444444444444444444444444444444444444444444444444444444444444444444444001100111111001111110
01111100011111000044444444444444444444444444444444444444444444444444444444444444444444444444444444444444444001000111110001111100
11111000111a10000a44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444000a01111a00011111000
1100011111a9a1a1a9a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a9a1a0a9a1111000111
1000111110a999aa999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000009999aa999a1110001111
1001111110a444a444991a111001111110011111100111111001111110011111100111111001111110011111100111111001111110a199444a444a1110011111
10111111a0aaa4a4aa99a11110111111101111111011111110111111101111111011111110111111101111111011111110111111101a99aa4a4aaa1a10111111
0111111109aaa999aaa999910111111101111111011111110111111101111111011111110111111101111111011111110111111109999aaa999aaa9101111111
01111110aaaaa222aaaa9110011111100000000000000110000000000000000000000000000001100000000000000000011111100119aaaa222aaaaa01111110
0111110009a4aa2aa4a944400111110009990909099901000999099909990909009909090999010000990999099909990111110004449a4aa2aa4a9001111100
1111100091a944944994a94411111000009009090900000009090909090909090909090909090000090009090999090001111000449a499449449a0911111000
11000111114999999994aa921100011110900999099001110999099909900990090909090990011109000999090909901100011129aa49999999941111000111
100011111004499994a4aa221000111110900909090001110900090909090909090909090909011109090909090909000000111122aa4a499994411110001111
1001111110a994444aa9aa411001111110900909099901110901090909090909099000990909011109990909090909990001111114aa9aa444499a1110011111
101111111aaaaaaaaa99aa911011111110000000000001110001000000000000000010000000011100000000000000000011111119aa99aaaaaaaaa110111111
011111110aa944aaaa9aa94101111111011111110111111101111111011133332111111101111111011111110111111101111111049aa9aaaa449aa101111111
0111111004aaa94aaaaa9920011111100111111001111110011111100115555555511110011111100111111001111110011111100299aaaaa49aaa4001111110
011111000144a94999a92200011111000111110001111100011111000111a497211111000111110001111100011111000111110001229a99949a440001111100
111110001a929226699910001111000000000000000000000000000000000002221100000000000000000000000000000000000011149996622929a011111000
11000111a99a225dd699011111000aaa0a0a01110aa00aaa0aa00aaa0aaa0a0221000aaa0a0a0aaa0a0a0aaa0aa00a0a00aa01111100996dd522a99a11000111
1000111199aaa455dd6aa11110000a0a0a0a01110a0a0a0a0a0a00a000a00a01200000a00a0a000a0a0a0a000a0a0a0a0a0a0111100aa6dd554aaa9910001111
1001111149aaa9455dd9aa1110010aa00aaa01110a0a0aaa0a0a00a010a00a01100110a00a0a00a00aaa0aa00a0a0aa00a0a011110aa9dd5549aaa9410011111
10111111499aaa9455499a1110110a0a000a01110a0a0a0a0a0a00a000a00a00001100a00aaa0a000a0a0a000a0a0a0a0a0a011110a9945549aaa99410111111
01111111249aa944449994a101110aaa0aaa01110aaa0a0a0a0a0aaa0aaa0aaa01110aaa00a00aaa0a0a0aaa0a0a0a0a0aa001110a499944449aa94201111111
01111110229994a2a2992a490111000000000110000000000000000000000000011100000000000000000000000000000000111094a2992a2a49992201111110
01111100022442929244292401111100011111000111110001111100011111000111110001111100011111000111110001111100429244292924422001111100
11111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000
11000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111
10001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111
10011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111
10111111101111111011111110111111101111111011111110111111101111111011111110111111101111111011111110111111101111111011111110111111
01111111011111110111111101111111011111110111111101111111011111110111111101111111011111110111111101111111011111110111111101111111
01111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110
01111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100
11111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000
11000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111
10001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111
10011111100111111001111110011111100111c1c001111110011111100111111001111110011111100111c1c001111110011111100111111001111110011111
10111111101111111011111110111111101111ccc011111110111111101111111011111110111111101111ccc011111110111111101111111011111110111111
01111111011111110111111101111111011111ddc111111101111111011111110111111101111111011111ddc111111101111111011111110111111101111111
01111110011111100111111001111110011111170111111001111110011111100111111001111110011111170111111001111110011111100111111001111110
01111100011111000111110001111100011171760111110001111100011111000111110001111100011171760111110001111100011111000111110001111100
11111000111110001111100011111000111116601111100011111000111110001111100011111000111116601111100011111000111110001111100011111000
11000111110001111100011111000111110001671100011111000111110001111100011111000111110001671100011111000111110001111100011111000111
10001111100011111000000000000000000000011000000000001110000000011000000000001100000000011000000000000000000000011000111110001111
1001111110011111100ccc0ccc0ccc00cc00cc011000ccccc0011100cc0ccc011000ccccc001110ccc00cc011000cc0ccc0ccc0ccc0ccc011001111110011111
1011111110111111100c0c0c0c0c000c000c0001100cc0c0cc01110c0c0c0c01100cc000cc011100c00c0c01100c0000c00c0c0c0c00c0011011111110111111
0111111101111111010ccc0cc00cc00ccc0ccc01010ccc0ccc01110c0c0cc001010cc0c0cc011110c00c0c01010ccc00c00ccc0cc000c0110111111101111111
0111111001111110010c000c0c0c00000c000c00010cc0c0cc01110c0c0c0c00010cc000cc011110c00c0c0001000c00c00c0c0c0c00c0100111111001111110
0111110001111100010c010c0c0ccc0cc00cc0000100ccccc001110cc00c0c000100ccccc0011100c00cc000010cc000c00c0c0c0c00c0000111110001111100
11111000111110001100000000000000000000001110000000111000000000001110000000111000000000001100000000000000000000001111100011111000
11000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111
10001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111
10011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111
10111111101111111011111110111111101111111011111110111111101111111011111110111111101111111011111110111111101111111011111110111111
01111111011111110111111101111111011111110111111101111111011111110111111101111111011111110111111101111111011111110111111101111111
01111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110
01111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100
11111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000
11000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111
10001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111100011111000111110001111
10011111100111b3200111111001111110011111100111111c011111100111b32c01111110011111100111111001111110011111100111b32001111110011111
1011111110111b32101111111c111c11101111111c111c111c1111c110111b321c1111c110111111101111111c111c111011111110111b321011111110111111
011111110111333321111111c111c11c01111111c111c11c01c11c110111333321c11c110111111101111111c111c11c01111111011133332111111101111111
0111111001155555555111100c1c11c0011111100c1c11c001c11c1c0115555555c11c1c01111110011111100c1c11c001111110011555555551111001111110
011111000111a497211111000c1c11c0011111000c1c11c0c1c1c10c0111a497c1c1c10c01111100011111000c1c11c0011111000111a4972111110001111100
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
1ccc1cc11ccc1cc11ccc1cc11ccc1cc11ccc1cc11ccc1cc11ccc1cc11ccc1cc11ccc1cc11ccc1cc11ccc1cc11ccc1cc11ccc1cc11ccc1cc11ccc1cc11ccc1cc1
11c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c111c1
5c1555155c1555155c1555155c1555155c1555155c1555155c1555155c1555155c1555155c1555155c1555155c1555155c1555155c1555155c1555155c155515
6c1565556c1565556c1565556c1565556c1565556c1565556c1565556c1565556c1565556c1565556c1565556c1565556c1565556c1565556c1565556c156555
51755d5551755d5551755d5551755d5551755d5551755d5551755d5551755d5551755d5551755d5551755d5551755d5551755d5551755d5551755d5551755d55
55675555556755555567555555675555556755555567555555675555556755555567555555675555556755555567555555675555556755555567555555675555
555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55d5575555d5575555d5575555d5575555d5575555d5575555d5575555d5575555d5575555d5575555d5575555d5575555d5575555d5575555d5575555d55755
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d555555
555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5555555d5
55575555555755555557555555575555555755555557555555575555555755555557555555575555555755555557555555575555555755555557555555575555
575d5555575d5555575d5555575d5555575d5555575d5555575d5555575d5555575d5555575d5555575d5555575d5555575d5555575d5555575d5555575d5555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555

__gff__
0000000000000000000001014040404013131313130303030303000000000303400101400303010103030000002303030000004001010303000700000003030303030303030303030303030303030303030303030000000303030303000000030101010101010000000000080008400000000000000100000101010101400303
03030300000000000000000000000000000000000000000000000000000000070000000000000000000000000000070700000000000000000000000000000b00000000000000000000000000000040000000000000000000000000000000404000000000000000000000000000000b0000000000000000000000000000000808
__map__
1a382a00000000003800000000002a000000003800000038002a001a7a786179786179787b38380000000000003a0000006d545664565050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22002200003800001e1f0038000022001a003800003800212122222222222200703800701a00000000000000003a000000787c7b61565655000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21002100380000002e2f38000038221a2200381a0038007a7879617879787b38701a007022381a0000000000003a0000007474746b74746b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
782b787b0000382a3e3f2a1a2b00222222380022001e1f1a5456675667552b38702100607b00220000000000003a0000767600006d6b006b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1719701a2a000018bebe1516191a7a787b000021002e2f21568f568e56567b00702238700038210000000000003a0000181976767677ce00000000000000000000000000000000000000000000000000000015151515151515151515151515151515151500000000000000000000000000000000000000000000000000000000
502915171900007e595957502915161615191a782b3e3f7a6656569e5668001a607b00701a00781a2a2b002a003a00007e2917289f9f9f9f000000000000000000000000000000000000000000000000000050505050505050505050505050505050501500000000000000000000000000000000000000000000000000000000
525150504c3b3b3b3b3b7e57505051505029161717bebe171516171615151615161716171717151516171515171715151717285050505050000000000000000000000000000000000000000000000000000050505050505050505050505050505050505000000000000000000000000000000000000000000000000000000000
5050535048461b1b001b1b7e5b59575150505150505150515050505050505050505050505050505050505050505050505050505050505050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
51505353524e1b1b1b1b1b1b0000495050585a5a5a595a5a5a5a59595a5a5a5a5a5a5a5a595a59595a5a595a5a5a5a5a5a595a595a5a5a5a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5a575353534d640000001b1b1b1b7e57504c39393939393939393939393939393939393939393939393939393939393939394b2527323136000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
307e5753534e001b1b001b1b1b1b1b4a504d1c1d001c1c1d003c1c1c1c1d001c1c1c001b1d1c1c1d2d1c3c2c1d3c001c1d0047246f5d3436000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
32317e5a57484600000000001b1b0049504e001b00003cae9f9f9f9faf001b001b000000001b3cae9f9f9f9f9f9f9f9f9f9f574840444645000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
38383138375348460000001b1b1b1b4a587f1b003c1baeaf001c1d1c1b0000003c2c00000000ae9faf001d1c1b1c1d004543472434364847000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3c7d3c3c3436534e000000001b1b45474d310000ae9faf1b1b1b1b1b1b1b1bae9faf00001b1b721c1d00001b001b001b313030311b343650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
404042463837504d000000001b1b4a587f0000001d001c0000000000001b00001c000000003c733c00003c3c00001b1b1b31313800383137000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5751504844585a7f00000000001b494d61641b1b00001b00001b1b001b001b1b1b1b1b00ae9f9faf0000aeaf0000001b45252627001b3436000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
375050585a7f1b1b1e1f00001b45474e00005e005e5d00000000001b1b001b1b1b000000711d1c0000001c1d00001b1b4950241b6f383750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3653534c1b1b1b1b2e2f001b004a587f2d2d459f9f9f641b1b1b1b1b1b1b1b1b1b1b1b0074001b0000000000007600007e57505229155051000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3753514c001b1bbf3e3f6d4543477f30001b7e5a574c1b1b1b1b1b1b1b1b1b1b1b1b1bce3c2c1b001b1b00006c713c00004b515150505250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2850587f000045bebebebe5a5b7f62797b1b0038364e001b00003c3c0000001b000000ae9faf0000001b1b00459f9f1b1b7e5b5b5a595753000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
51504c3100003750587f31313200000000000034364c1b1b00ae9f9faf00001b000000323031767700001b007e5a7f1b4544bebebebe4a50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
505024000034365125273800005c5d0000003800374c1b1b000032310000001b00000000310070703c001b000031731b4befef00ef655350000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5050252700003750240000003436434600005d5c454e001b1b1b1b1b00001b1b000000000000ae9faf0000001b2c3c4547bf00bffe00ef53000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
50504c0000003650466f006f4551587f2d2d4543474d0000001b1b1b1b1b1b00006e7700000074721d00001b009f4147bebebebe64000065000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
50502400003435364843434347587f30006c4951587f00001b1b1b1b1b00000000454600000000730000001b004a51587fef00ef00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
505024003800007e57505150587f3031004547534c00001b1b00000000005e5d007e7f00000000000000001b1b49587f1b0000000000febf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5050252700000038375050504d3131005e4a51587f001b1b007600007700454676307100001b000000001b1b1b4a4c0000001b000000ee44000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5050240000003435365051524c00006e4547587f00001b000070000070007e7f70317000001b1b1b001b1b001b494d001b001bfe000000be000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5050250000000000375050582527004547587f00000000007a60000070000031720072000000001b1b1b001b1b7e7f641b0000ee00000051000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
50502438000000343651587f3100004a504c0000001b1b0000787961780000007100700000000000001b1b001b00001b0000000000000053000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
50502526275e5d007e574c3100005e4b504c00001b1b1b0000705c5d70000000740073000000000000001b001b0000000000bf5e00000053000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5050252700454600004a4e0000004547507f00001b1b1b000045424346000000000076bffebf5e0000001b1b1b0000000000ee4200000052000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00060000027500f4500b0500f0500b7501c45016450194501b4501c4501d4501d75020050200501e0501d050187502345016750137501475029450177501a750207502e0503c450380503a0503b7503c7503c750
0006000002740023100a0300c0400d0500e05010060120501405015050180501a0501b0701e0501f01021050220101f0501d0501b050180501801018050190501c0501f05023040270102c010320303901039050
000100001477012770127701277011770107700f7500f7500f7500e7500d7500c7500c7500c7500d7500d7500c7500b7500a7500a7500975009750097500a7500a75009750087500875007750067500675005750
100500003007000000350703507035070350603505035050350303501000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
090500002d63000600006002061023600006000060000600006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0210000000600386403865036650326402d640256601f6601b65018600176201663015650146601565021640166401764018640196401a6401b6501d6501e65020650216501f6501e65022650006000060000600
020500000377007770097700c7700d7700f7700a77008770097700b7700c77012770177701a770167700f77011770127700d7700e7700f77010770107700d7700d7700a7700b7700877008770067700577007770
8e0200001c6501f6502166022660216601d6601a660196701867017670176701a6601e6602165022650226501f6501b6501765016650176401b6401f63022630216301d6201a62018610186101e6102161022610
000100000a1500d150140501c05024050280002d00011000120001400016000190001c000200002300026000270002a000190001a0001b0001d0001e000200002100023000260002d00030000350003a00000000
100500001b07000000240702407023070230602405024050240302401000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020200000b7700a77007770097700a770087700576005760087600976007760057600576005760067600676005750047500475005750047500475001740007400074000740007400074000740007400074000740
000700001d01008110091100901000000000001d300183000000000000000000000000000000000d01005110000100000000000000000000000000210100000000000000000000000000000000e0100060000600
140500000100002000030000300003000000001b6101a610050000500006000060000700007000070002a6102a610000000000000000000000000000000000000000000000000000000000000000000000000000
d60700000061000610016100061000610006100061000610006100161000610006100061000610006100061000610016100161000610006100061000610006100161001610006100061000610006100161000610
0003000013650126501265012650000001365000000000000000015650000000000000000176500000000000000001665000000000000e650000001e600000000000000000000000000024600000000000000000
00010b00090300a0300b0300d030100301303018030140301a0001b0001600004000070000a00011000260002700024600246001a0001b0001d0001e000200002100023000260002d00030000350003a00000000
000700001b6601666013650106500d6400a6400a6400e64011640196000b60012600116000c60008600046000b600076000060000600006000060000600006000060000600006000060000600006000060000600
910b000015000160003f6000000013000000001f0552105522050220551f0551a0052605026055250522505225052250522504225042250321902200000000000000000000213301c33019330153301333010330
000b00000c1530000000000000000000000000220202402018655260202202000000290202902528012280120c15328012280120c05328012280120c053000001865500000306153061530625306553065524655
030b00000714007140071430710007143224002640007140071430714507140071431a14116140131400e14009140091400914309000090000915509150091530915525100393123931239322393223933239333
000b00001500000000160003f600130000000021055220552405024055210551a0052405024055220522205222052220522204222042220322202200000000000000000000000000000000000000000000000000
010b00000c1530000000000000000000000000240202602018655270202402000000270202702526012260120c15326012260120c05326012260120c05300000186550000030600306000c153246000000000000
010b00000216002140021400214300000021330216002140021430000000000000000216002140021430000013140131400714107140071430000000000000001310007100070750707505075070750000000000
010b00000714007143264002240026400224002640007140071430714507140071431a14116140131400e1400d1600d1500916109141091400d1600d1400d1430000025400393123931239322393223933239333
000b00001500000000160003f600130000000021055220552405024055210551a0051e0501e0551f0521f0521f0521f0521f0421f0421f0321f02200000000000000000000000000000000000240002650028500
010b00000c1530000000000000000000000000240202602018655270202402000000210202102522012220120c15322012220120c05322012220120c053000001865500000306003060018625186351864518655
010b00000000000000264242242026420224202642022410264102241026415000000000000000000001000016000100000000028235000000000025235000000000021235000000000025235000002823500000
000c00000000000000240242102024020210202402021010240102101024015000000000000000000000000000000000002b7352b735297352b73500000007000070000700000000000000000000000000000000
010b00001500000000160003f600130000000021055220552405024055210551a0051e0501e0551f0521f0521f0521f0521f0421f0421f0321f02200000000000000000000000000000000000240002655128550
010b000029560295622956229562295622956229562295652956029560295602b5622b5622b56229560295602856228562285622456024560245602b5612b5602b5602b5602b5622b5622b565005022b5522d552
010b00000c1532652226522346000e6550000000000000000c1530e6350c153000000e65500000000000e6350c153000000c153000000e65500000000000e6550c153000000c153000000e6250e6350e6450e655
010b00000a1400a1400a1400a14305140051400a1400a145001000a1450a1450a1450a1400a1400b1400b14000140001400014500140001430014000100001400000000000001400c145011400d145021400e145
010b00000000000000346150000000000000003461500000000000000034615000000000000000346150000000000000003461500000000000000034615000000000000000346150000000000000003461500000
010b00002e5502e5522e5522d5522d5522d5522b5522b5502b5502b5502b5502b553295002b5002b5002b5002b5252e52532525375253a52537525325252e525295252d525305253552539525355252655528555
010b00000717007140071453052230522305222e5222e5202e5202e5230717507140051400714007145131750717007175375253a5253e5253a5253752532525051700517535525395253c525395253552530525
010b00002e5502e5522e552305523055230552325523255032550325503255032553295002b5002b5002b5002b5252e52532525375253a52537525325252e525295252d525305253552539525355252655528555
000b0000265502655022550225501f5501f5502955129550295502955024550245502e5512e5502d5502d5502d5522d5522d5522d5522450024500245002b50000000260002e5512e55026550265502b5512b550
000b00000315003150031500315300000000000a1500a155000000a1550a1550a1550a1500a15003150031500215002150021550215002153000000215502155021500215332551325302a5302a5302e5302e532
000b00002b5502b5551f5551f5551d5551f55522505225052255522555215552255522505225052b555295552b5552b553021000210002100000000210002100021000210000000001000c100011000d10002100
000b00000c153265020e6550e6550e6550e65500000000000e6550e6550e6550e65500000000000e6550e6550e6550000000000000000c1530e6000c1530000000000000000e655000000e6550e6550e65500000
000b00002e5322e535071550715505155071550a1000a100071550715505155071550a1050a10507155051550715507153021050210002100000000210002100021000210000000001000c100011000d10002100
000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0114001800140005351c7341c725247342472505140055352173421725287342872504140045351f7341f725247342472502140025351d7341d72500000000000000000000000000000000000000000000000000
011400180c043287252b0152f72534015377253061528725290152d72530015377250c0432f7253001534725370153c725306152b7252d01532725370153b7250000000000000000000000000000000000000000
0114001809140095351f7341f7252473424725091400953518734187251f7341f72505140055351f7341f7252473424725051400553518734187251f7341f7250000000000000000000000000000000000000000
0114001802140025351f7341f725247342472504140045351f7341f725247342472505140055352b7242b715307243071507140075352b7242b71534724347150000000000000000000000000000000000000000
011400180c0433772534015307252f0152d725306152d7252f0153072534015377250c0433772534015307252f0152d725306152d7252f0153072534015377250000000000000000000000000000000000000000
011400180c0433c7253701534725300152f725306152f7253001534725370153c7250c0433c7253701534725300152f725306152f7253001534725370153c7250000000000000000000000000000000000000000
011400180c043287252b0152f725340153772530615287252901530725370153c7250c043287252901530725370153c72530615287252901530725370153c7250000000000000000000000000000000000000000
001400180c003287052b0052f705340053770530605287052900530705370053c7050c0032f7053000534705370053c705306052b7052d00532705370053b7050000000000000000000000000000000000000000
__music__
01 11121350
00 14151651
00 11121750
00 18191651
00 1112131a
00 1415161b
00 1112171a
00 1c19161b
00 1d1e1f20
00 211e2220
00 1d1e1f20
00 231e2220
00 1d1e1f20
00 211e2220
00 241e2520
02 26272844
00 29424344
00 29424344
00 17424344
00 29424344
00 14424344
00 29424344
02 17424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
05 10424344
01 0b0d4344
02 0d0c4344

