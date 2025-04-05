pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

#include ./constants.lua
#include ./dispatch.lua
#include ./utils.lua
#include ./tutorial.lua
#include ./out/puzzles.lua
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
000000000010000000000000000000005fff50001111100040400000404000004040000040400000400400004044000000000000000000000000000000000000
00000000017100000000000000000000f5f5f0001111100044040000404000004404000040040000404000004040000000000000000000000000000000000000
0070070001711010001f900000000000ff5ff0001111100044040000404000004004000040440000444400004044000000000000000000000000000000000000
000770000171717100faa90000000000f5f5f0001111100044040000404000004040000040040000400400004004000000000000000000000000000000000000
0007700071777771009aaa90000000005fff50001111100040400000404000004444000040400000400400004044000000000000000000000000000000000000
00700700177777710009aaa600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000117771000009aee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000177710000006ee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000ee6000000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000a990000e6a900000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000009aa60006aaa90000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000009aee00009aaf0000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000006ee000009f10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000006ee600ee600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000006ee600e6a90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000660006aaa9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000009aaf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000009f1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000ee600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000e6a90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000006aaa9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000009aaf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000009f1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
dddddddddddddddddddddddddddddddfdfdd4fffff4fffff4fffff4fffff4fffff45fff54fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddfdfdd4fffff4fffff4fffff4fffff4fffff4f5f5f4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddfdfdd4fffff4fffff4fffff4fffff4fffff4ff5ff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddfffdd4fffff4fffff4fffff4fffff4fffff4f5f5f4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4fffff4fffff4fffff4fffff45fff54fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddd444dd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
ddddddddddddddddddddddddddddddd4d4dd4fffff4fffff4fffff4fffff4fffff45fff54fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddd4d4dd4fffff4fffff4fffff4fffff4fffff4f5f5f4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddd4d4dd4fffff4fffff4fffff4fffff4fffff4ff5ff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddd444dd4fffff4fffff4fffff4fffff4fffff4f5f5f4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4fffff4fffff4fffff4fffff45fff54fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddfffddfffdd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
ddddddddddddddddddddddddddddfddddfdd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddfddddfdddd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd444dd444dd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
dddddddddddddddddddddddddddd4dddd4dd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd444dd444dd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd4dddd4dddd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd444dd444dd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddffdddffddd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
dddddddddddddddddddddddddddfddddfddd4fffff4fffff4fffff4fffff41111145fff54fffff4fffff4fffff41111145fff54fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddfddddfddd4fffff4fffff4fffff4fffff4111114f5f5f4fffff4fffff4fffff4111114f5f5f4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddfddddfddd4fffff4fffff4fffff4fffff4111114ff5ff4fffff4fffff4fffff4111114ff5ff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4fffff4fffff4111114f5f5f4fffff4fffff4fffff4111114f5f5f4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4fffff4fffff4fffff41111145fff54fffff4fffff4fffff41111145fff54fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd444dd444dd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
dddddddddddddddddddddddddddd4dddd4dd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd444dd444dd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd4dddd4dddd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd444dd444dd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddfffddfffdd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
ddddddddddddddddddddddddddddfddddfdd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddfddddfdddd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4fffff4fffff4fffff4111114111114fffff4fffff4fffff4111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddd444dd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
ddddddddddddddddddddddddddddddd4d4dd45fff545fff545fff545fff545fff545fff545fff545fff545fff545fff545fff545fff545fff545fff545fff54d
ddddddddddddddddddddddddddddddd4d4dd4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4d
ddddddddddddddddddddddddddddddd4d4dd4ff5ff4ff5ff4ff5ff4ff5ff4ff5ff4ff5ff4ff5ff4ff5ff4ff5ff4ff5ff4ff5ff4ff5ff4ff5ff4ff5ff4ff5ff4d
ddddddddddddddddddddddddddddddd444dd4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4f5f5f4d
dddddddddddddddddddddddddddddddddddd45fff545fff545fff545fff545fff545fff545fff545fff545fff545fff545fff545fff545fff545fff545fff54d
ddddddddddddddddddddddddddffdddffddd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
dddddddddddddddddddddddddddfddddfddd4fffff4fffff4111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddfddddfddd4fffff4fffff4111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddfddddfddd4fffff4fffff4111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddfffddfffdd4fffff4fffff4111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4fffff4111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd444dd444dd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
dddddddddddddddddddddddddddd4dddd4dd4fffff4111114111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd444dd444dd4fffff4111114111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd4dddd4dddd4fffff4111114111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddd444dd444dd4fffff4111114111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4111114111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
ddccccccccccccccccccccccccffcccffccc4444444444444444444444444444444444444444444444444444444444444444444444414444444444444444444d
ddcccccccccccccccccccccccccfccccfccc4fffff4fffff4fffff4111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4fff121fffff4fffff4fffff4d
ddcccccccccccccccccccccccccfccccfccc4fffff4fffff4fffff4111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4ff12221ffff4fffff4fffff4d
ddcccccccccccccccccccccccccfccccfccc4fffff4fffff4fffff4111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4f12121fffff4fffff4fffff4d
ddccccccccccccccccccccccccfffccfffcc4fffff4fffff4fffff4111114fffff4fffff4fffff4fffff4fffff4fffff4fffff4121114fffff4fffff4fffff4d
ddcccccccccccccccccccccccccccccccccc4fffff4fffff4fffff4111114fffff4fffff4fffff4fffff4fffff4fffff4fffff1222111fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddd444dd4444444444444444444444444444444444444444444444444444444444444444444121411144444444444444444d
ddddddddddddddddddddddddddddddddd4dd4fffff4fffff4fffff4fffff4111114111114111114111114111114111114111114f1fff1fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddddd4dd4fffff4fffff4fffff4fffff4111114111114111114111114111114111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddddd4dd4fffff4fffff4fffff4fffff4111114111114111114111114111114111114111114fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddddd4dd4fffff4fffff4fffff4fffff4111114111114111114111114111114111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4fffff4fffff4fffff4111114111114111114111114111114111114111114fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddfffdd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
dddddddddddddddddddddddddddddddddfdd4fffff4fffff4fffff4fffff4fffff4fffff4111114111114111114fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddddffdd4fffff4fffff4fffff4fffff4fffff4fffff4111114111114111114fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddfdd4fffff4fffff4fffff4fffff4fffff4fffff4111114111114111114fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddfffdd4fffff4fffff4fffff4fffff4fffff4fffff4111114111114111114fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4fffff4fffff4fffff4fffff4fffff4111114111114111114fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddd444dd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
ddddddddddddddddddddddddddddddd4d4dd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddd4d4dd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddd4d4dd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
ddddddddddddddddddddddddddddddd444dd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddfffdd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444d
dddddddddddddddddddddddddddddddfdfdd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddfdfdd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddfdfdd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddfffdd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
dddddddddddddddddddddddddddddddddddd4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4fffff4d
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
