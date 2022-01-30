pico-8 cartridge // http://www.pico-8.com
version 33
__lua__
-- game

function _init()
	--boat/scene
	boatsprites = {1,2,3}
	boatleftx = 1
	boaty = 8
	waterlevel = boaty*8+4
	
	--player
	playersprite = 241
	playerx = 4
	playery = 7
	rodtipx, rodtipy = playerx*8+8, playery*8+2
	
	--bobber
	bobbersprite = 224
	bobberx = rodtipx-3
	bobbery = rodtipy-3
	
	 --underwater palette array
 local palarr={[0]=129,1,1,1,1,1,140,12,131,140,12,12,131,140,140,12}
  
 --apply secondary display pal
 pal(palarr,2)
 
 --turn on the sec disp pal
 poke(0x5f5f,0x10)
end

function _update()
	updatebobber()
end

function _draw()
	cls()
	drawsky()
	drawboat()
	drawplayer()
	drawwater()
	drawfishingline()
	drawbobber()
end
-->8
--draw

function drawboat()
	for i = 1, count(boatsprites) do
		spr(boatsprites[i],boatleftx * 8 + i * 8, 8 * boaty)
	end
end

function drawplayer()
	spr(playersprite,8*playerx,8*playery)
end

function setwaterlevel(lvly)
 --renders everything below
 --lvly in secondary disp pal
 for i=0,15 do
  local mypoke,dif=0,lvly-i*8
  if dif<=0 then
   mypoke=0xff
  elseif dif<8 then
   mypoke=tonum(sub("0b11111111",1,10-dif)..sub("00000000",1,dif))
  end
  poke(0x5f70+i,mypoke)
 end
end

function drawwater()
	setwaterlevel(waterlevel)
	--draw wavy surface
 for x=0,127 do
  pset(x,waterlevel+sin(x/8+time()*2)/2,1)
 end
end

function drawsky()
	rectfill(0,0,128,waterlevel-1,12)
	circfill(8,8,8,10)
end

function drawfishingline()
 line(rodtipx,rodtipy,bobberx+3,bobbery+3, 7)
end

function drawbobber()
	spr(bobbersprite,bobberx,bobbery)
end
-->8
--update
function updatebobber()
	--temp movement for fishing line test
	if(btnp(⬆️)) then
		bobbery -= 2
	end
	if(btnp(⬇️)) then
		bobbery += 2
	end
	if(btnp(⬅️)) then
		bobberx -= 2
	end
	if(btnp(➡️)) then
		bobberx += 2
	end
end
-->8
--init
-->8
--helpers
__gfx__
00000000555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000566666666666666666666650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007005ddddddddddddddddddddd50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000566666666666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770005fffffffffffffffffff5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700566666666666666666550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000056666666666666655000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005555555555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c11d10000000000000000000000000000cc10000000000000000000001000000111100000000000000000000000000000000000000000000000000000000000
cccc1d1000000000001110010000cc00011ccc000000000000011101001000101171d11000000010000000000000000000000000000000000000000000000000
1c7c11d1000000000ccc0011000cc00c01cc1c000ccdc00c00ccc0010ccc0c001ddc1d100c7cccc10001000000c0c00000000000000000000000000000000000
1ccc1100001100000c7ccc1117ddddc00ccccc00c7ccd1c00c7ccc10c7cccc101dccd1000cccccc11c11c00000ccc00000000000000000000000000000000000
d11111000cccc010cccccc1101dd11c00c0c0c00ccccdcc00ccccc100cc10cc0011dc100000c0c107c1c1c1000cc700000000000000000000000000000000000
dd11111d0c7cc1000cccc011000c000c00c0c0c00ccd100c000000010010000001d11111000000001c1c1c1000ccc00000000000000000000000000000000000
0dd001d10cccc010000c000100000000000c0c0c000000000000000100000000010001c100000000001000000c0c0c0000000000000000000000000000000000
0d000d10000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaa0000aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0aaaaa00aaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00fff00504ff00040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccfff05004ff00400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cfc00660422004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cfff5660422040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccc05000022f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111ff00011110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
