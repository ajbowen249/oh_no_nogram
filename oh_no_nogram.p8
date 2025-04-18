pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

#include ./constants.lua
#include ./dispatch.lua
#include ./utils.lua
#include ./tutorial.lua
#include ./out/puzzles.lua
#include ./puzzle_common.lua
#include ./puzzle.lua
#include ./puzzle_grid.lua
#include ./main_menu.lua

init_main_menu()

g_draw_funcs = {
  draw_main_menu,
  draw_tutorial,
  draw_puzzle_grid,
  draw_puzzle,
}

g_update_funcs = {
  update_main_menu,
  update_tutorial,
  update_puzzle_grid,
  update_puzzle,
}

function _draw()
  predraw_dispatch()
  g_draw_funcs[g_game_state]()
  draw_dispatch()
end

function _update()
  g_update_funcs[g_game_state]()
  update_dispatch()
end

__gfx__
00000000001000005fff500040400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000001710000f5f5f00040040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070001711010ff5ff00040440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700001717171f5f5f00040040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000717777715fff500040400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700177777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000011777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000004040000040040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000004404000040400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001f900000ee60004404000044440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00faa90000e6a9004404000040040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
009aaa90006aaa904040000040040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0009aaa60009aaf00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00009aee00009f100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000006ee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000004040000040440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000004040000040400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000004040000040440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000a99000e6000004040000040040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0009aa6006a900004040000040440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0009aee00aaa90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00006ee009aaf0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000009f10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000004040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000004404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00066000000000004004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
006ee600000ee6004040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
006ee600000e6a904444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000660000006aaa90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000009aaf0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000009f10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000cccc000ccc10ccc1000ccc000cc10000cccc000cc1000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000cdddd100cdd10cdd1000cdd100cd1000cdddd100cd1000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000cdddd100cdd10cdd1000cdd100cd1000cdddd100cd1000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cdddddd10cdd10cdd1000cddd10cd100cdddddd10cd10000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cdd11dd10cdd11cdd1000cddd10cd100cdd11dd10cd10000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cdd11dd10cddddddd1000cddddccd100cdd11dd10cd10000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cdd11dd10cddddddd1000cd1ddcdd100cdd11dd10cd10000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cdd11dd10cddddddd1000cd11dddd100cdd11dd10cd100000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cdddddd10cdd111dd1000cd11dddd100cdddddd1001000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cddddd100cdd101dd1000cd101ddd100cddddd100cd100000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cdddd100cdd101dd1000cd1001dd1000cdddd100cd1000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001111000c11101111000c1100111100001111000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000cc000cc00cc0ccc0ccc0ccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000c0c0c0c0c000c0c0c0c0ccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000cc0c0c0c0c0c000cc00ccc0c0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000c0c0c0c0c0c0c0c0c0c0c0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000c0c0cc00ccc0c0c0c0c0c0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dd44d444d444d444d444dd44dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
d4ddd4d4d4ddd4ddd4ddd4dddd4dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
d4ddd444d44dd44dd44dd444ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
d4d4d4d4d4ddd4ddd4ddddd4dd4dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
d444d4d4d4ddd4ddd444d44dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
d444ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
d4d4ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
d444ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
ddd4ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
ddd4ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddccccccdddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfffdddddddddddddddddddddddddddfffddccccccdddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfdddddddddddddddddddddddddddddfddccccccdddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfffdddddddddddddddddddddddddddfffddccccccdddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfdddddddddddddddddddddddddddddfddddccccccdddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfffdddddddddddddddddddddddddddfffddccccccdddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfffddd444dddddddddddddddddddddfffddd444ddccccccdddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfddddddd4dddddddddddddddddddddfddddddd4ddccccccdddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfffddd444dddddddddddddddddddddfffddd444ddccccccdddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfddd4dddddddddddddddddddddddddfddd4ddddccccccdddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfffddd444dddddddddddddddddddddfffddd444ddccccccdddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddfffdddffddddfffdddffdddd44ddddffddddfffdddfffdddfffddd44ddddffdddcffcccdfffdddffddddfffdddd
dddddddddddddddddddddddddddddddddddddfdfddddfddddddfddddfddddd4dddddfddddddfdddddfdddddfdddd4dddddfdddccfcccdddfddddfddddfdfdddd
dddddddddddddddddddddddddddddddddddddfdfddddfddddfffddddfddddd4dddddfddddfffdddfffdddfffdddd4dddddfdddccfcccdfffddddfddddfdfdddd
dddddddddddddddddddddddddddddddddddddfdfddddfddddfddddddfddddd4dddddfddddfdddddfdddddfdddddd4dddddfdddccfcccdfddddddfddddfdfdddd
dddddddddddddddddddddddddddddddddddddfffdddfffdddfffdddfffddd444dddfffdddfffdddfffdddfffddd444dddfffddcfffccdfffdddfffdddfffdddd
dddddddddddddddddddddddddddddddfffdd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
dddddddddddddddddddddddddddddddfdfdd45fff5f5fff5f5fff5f5fff5f5fff545fff5f5fff5f5fff5f5fff5f5fff545fff5f5fff5f5fff5f5fff5f5fff54d
dddddddddddddddddddddddddddddddfdfdd4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4d
dddddddddddddddddddddddddddddddfdfdd4ff5fffff5fffff5fffff5fffff5ff4ff5fffff5fffff5fffff5fffff5ff4ff5fffff5fffff5fffff5fffff5ff4d
dddddddddddddddddddddddddddddddfffdd4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4d
dddddddddddddddddddddddddddddddddddd45fff5f5fff5f5fff5f5fff5f5fff545fff5f5fff5f5fff5f5fff5f5fff545fff5f5fff5f5fff5f5fff5f5fff54d
ddddddddddddddddddddddddddddddd444dd4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4d
ddddddddddddddddddddddddddddddd4d4dd45fff5f5fff5f5fff5f5fff5f5fff545fff5f5fff5f5fff5f5fff5f5fff545fff5f5fff5f5fff5f5fff5f5fff54d
ddddddddddddddddddddddddddddddd4d4dd4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4d
ddddddddddddddddddddddddddddddd4d4dd4ff5fffff5fffff5fffff5fffff5ff4ff5fffff5fffff5fffff5fffff5ff4ff5fffff5fffff5fffff5fffff5ff4d
ddddddddddddddddddddddddddddddd444dd4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4d
dddddddddddddddddddddddddddddddddddd45fff5f5fff5f5fff5f5fff5f5fff545fff5f5fff5f5fff5f5fff5f5fff545fff5f5fff5f5fff5f5fff5f5fff54d
ddddddddddddddddddddddddddfffddfffdd4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4d
ddddddddddddddddddddddddddddfddddfdd4ffffffffffffffffffffffff11111411111fffffffffffffffffff11111411111ffffffffffffffffffffffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddfddddfdddd4ffffffffffffffffffffffff11111411111fffffffffffffffffff11111411111ffffffffffffffffffffffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4ffffffffffffffffffffffff11111411111fffffffffffffffffff11111411111ffffffffffffffffffffffff4d
dddddddddddddddddddddddddd444dd444dd4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4d
dddddddddddddddddddddddddddd4dddd4dd4ffffffffffffffffffffffff11111411111fffffffffffffffffff11111411111ffffffffffffffffffffffff4d
dddddddddddddddddddddddddd444dd444dd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd4dddd4dddd4ffffffffffffffffffffffff11111411111fffffffffffffffffff11111411111ffffffffffffffffffffffff4d
dddddddddddddddddddddddddd444dd444dd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4ffffffffffffffffffffffff11111411111fffffffffffffffffff11111411111ffffffffffffffffffffffff4d
ddddddddddddddddddddddddddffdddffddd4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4d
dddddddddddddddddddddddddddfddddfddd4ffffffffffffffffffffffff1111145fff5fffffffffffffffffff111114fffffffffffffffffffffffffffff4d
dddddddddddddddddddddddddddfddddfddd4fffff4fffff4fffff4fffff4111114f5f5f4fffff4fffff4fffff4111114fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddfddddfddd4ffffffffffffffffffffffff111114ff5fffffffffffffffffffff111114fffffffffffffffffffffffffffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4fffff4fffff4111114f5f5f4fffff4fffff4fffff4111114fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4ffffffffffffffffffffffff1111145fff5fffffffffffffffffff111114fffffffffffffffffffffffffffff4d
dddddddddddddddddddddddddd444dd444dd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
dddddddddddddddddddddddddddd4dddd4dd4ffffffffffffffffffffffff11111411111fffffffffffffffffff11111411111ffffffffffffffffffffffff4d
dddddddddddddddddddddddddd444dd444dd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd4dddd4dddd4ffffffffffffffffffffffff11111411111fffffffffffffffffff11111411111ffffffffffffffffffffffff4d
dddddddddddddddddddddddddd444dd444dd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4ffffffffffffffffffffffff11111411111fffffffffffffffffff11111411111ffffffffffffffffffffffff4d
ddddddddddddddddddddddddddfffddfffdd4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4d
ddddddddddddddddddddddddddddfddddfdd4ffffffffffffffffffffffff11111411111fffffffffffffffffff11111411111ffffffffffffffffffffffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddfddddfdddd4ffffffffffffffffffffffff11111411111fffffffffffffffffff11111411111ffffffffffffffffffffffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4ffffffffffffffffffffffff11111411111fffffffffffffffffff11111411111ffffffffffffffffffffffff4d
ddddddddddddddddddddddddddddddd444dd4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4d
ddddddddddddddddddddddddddddddd4d4dd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
ddddddddddddddddddddddddddddddd4d4dd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddd4d4dd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
ddddddddddddddddddddddddddddddd444dd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
ddddddddddddddddddddddddddffdddffddd4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4d
dddddddddddddddddddddddddddfddddfddd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
dddddddddddddddddddddddddddfddddfddd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddfddddfddd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
ddcccccccccccccccccccccccc444cc444cc4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4d
ddcccccccccccccccccccccccccc4cccc4cc4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
ddcccccccccccccccccccccccc444cc444cc4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4f1f9f4fffff4fffff4fffff4d
ddcccccccccccccccccccccccc4cccc4cccc4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4ffffffffaa9ffffffffffffffffff4d
ddcccccccccccccccccccccccc444cc444cc4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4f9aaa9fffff4fffff4fffff4d
ddcccccccccccccccccccccccccccccccccc4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4ffffffff9aaa6ffffffffffffffff4d
ddddddddddddddddddddddddddffdddffddd44444444444444444444444444444444444444444444444444444444444444444444449aee44444444444444444d
dddddddddddddddddddddddddddfddddfddd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4ffffff11116eeffffffffffffffff4d
dddddddddddddddddddddddddddfddddfddd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4111114fffff4fffff4fffff4d
dddddddddddddddddddddddddddfddddfddd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4ffffff11111ffffffffffffffffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4111114fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4ffffff11111ffffffffffffffffff4d
ddddddddddddddddddddddddddddddd444dd4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4d
ddddddddddddddddddddddddddddddddd4dd4ffffffffffffffffffffffff11111411111f11111f11111f11111f11111411111ffffffffffffffffffffffff4d
ddddddddddddddddddddddddddddddddd4dd4fffff4fffff4fffff4fffff4111114111114111114111114111114111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddddd4dd4ffffffffffffffffffffffff11111411111f11111f11111f11111f11111411111ffffffffffffffffffffffff4d
ddddddddddddddddddddddddddddddddd4dd4fffff4fffff4fffff4fffff4111114111114111114111114111114111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4ffffffffffffffffffffffff11111411111f11111f11111f11111f11111411111ffffffffffffffffffffffff4d
dddddddddddddddddddddddddddddddfffdd4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4d
dddddddddddddddddddddddddddddddddfdd4fffffffffffffffffffffffffffff4ffffff11111f11111f11111ffffff4fffffffffffffffffffffffffffff4d
ddddddddddddddddddddddddddddddddffdd4fffff4fffff4fffff4fffff4fffff4fffff4111114111114111114fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddfdd4fffffffffffffffffffffffffffff4ffffff11111f11111f11111ffffff4fffffffffffffffffffffffffffff4d
dddddddddddddddddddddddddddddddfffdd4fffff4fffff4fffff4fffff4fffff4fffff4111114111114111114fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffffffffffffffffffffffffffff4ffffff11111f11111f11111ffffff4fffffffffffffffffffffffffffff4d
ddddddddddddddddddddddddddddddd444dd4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4d
ddddddddddddddddddddddddddddddd4d4dd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
ddddddddddddddddddddddddddddddd4d4dd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddd4d4dd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
ddddddddddddddddddddddddddddddd444dd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
dddddddddddddddddddddddddddddddfffdd4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4d
dddddddddddddddddddddddddddddddfdfdd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
dddddddddddddddddddddddddddddddfdfdd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddfdfdd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
dddddddddddddddddddddddddddddddfffdd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4fffffffffffffffffffffffffffff4d
dddddddddddddddddddddddddddddddddddd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

__map__
4041424344454647000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5051525354555657000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6061626364656667000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7071727374757677000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8081828384858687000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9091929394959697000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a0a1a2a3a4a5a6a7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b0b1b2b3b4b5b6b7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00020000182502f25031250312502f250322502e2502425021250252502625022250272502b2502c25021250022500b2500f250122501225011250102500d2500925005250022500125000250002500025000250
3f0f0000171001510013100131000c150101000c1500e1001715015150131501315011150101500e1000e150236000c1502760029600006000000000000000000000000000000000000000000000000000000000
000100002265022650226502265022650226502165021650206501e6501b640186401663013630106300c620086300762003650006500b6000060000600006000060000600006000060000600006000060000600
900100000566005640056300563005630056300563005630056300663006630066300664006640066400664006640066400663006630076300763007620076100760000000000000000000000000000000000000
