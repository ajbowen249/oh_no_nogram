pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

#include ./constants.lua
#include ./utils.lua
#include ./tutorial.lua
#include ./puzzles.lua
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
  g_draw_funcs[g_game_state]()
end

function _update()
  g_update_funcs[g_game_state]()
end

__gfx__
000000000010000000000100000001005fff50001111100040400000404000004040000040400000400400004044000000000000000000000000000000000000
00000000017100000000121000001210f5f5f0001111100044040000404000004404000040040000404000004040000000000000000000000000000000000000
00700700017110100001222100012221ff5ff0001111100044040000404000004004000040440000444400004044000000000000000000000000000000000000
00077000017171710012121000111210f5f5f0001111100044040000404000004040000040040000400400004004000000000000000000000000000000000000
000770007177777101211100012111005fff50001111100040400000404000004444000040400000400400004044000000000000000000000000000000000000
00700700177777711222111012221000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000011777100121011101210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001777100010001000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
