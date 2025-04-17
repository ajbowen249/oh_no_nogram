pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

#include ./constants.lua
#include ./dispatch.lua
#include ./utils.lua
#include ./professor.lua
#include ./tutorial.lua
#include ./out/puzzles.lua
#include ./puzzle_common.lua
#include ./puzzle.lua
#include ./puzzle_grid.lua
#include ./cart_menu.lua
#include ./main_menu.lua

init_cart_menu()
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
00000000001000005fff5000404000000000ff000000000000000000000000080000000000000008000000000000000000000000000000000000000000000000
0000000001710000f5f5f00040040000006ffff60000000000000000000000880000000000008888000000000000000000000000000000000000000000000000
0070070001711010ff5ff0004044000066ffffff6600000000000000000008880000000008888888000000000000000000000000000000000000000000000000
0007700001717171f5f5f00040040000611111111600000000000000000008880000fff888888888000000000000000000000000000000000000000000000000
00077000717777715fff50004040000061771177160000000000000000000888000000f888888888000000000000000000000000000000000000000000000000
00700700177777710000000000000000017611671000000000000000000008880000000888880000000000000000000000000000000000000000000000000000
00000000011777100000000000000000001111110000000000000000000008880000000000000000000000000000000000000000000000000000000000000000
0000000000177710000000000000000000f6666f0000000000000000000008880000000000000000000000000000000000000000000000000000000000000000
0000000000000000404000004004000000ffbbff0000000000000000000008880000000000000000000000000000000000000000000000000000000000000000
00000000000000004404000040400000000ffff00000000000000000000008880000000000000000000000000000000000000000000000000000000000000000
001f900000ee600044040000444400000000ff000000000000000000000008880000000000000000000000000000000000000000000000000000000000000000
00faa90000e6a900440400004004000088171171880000000000000000000ff00000000000000000000000000000000000000000000000000000000000000000
009aaa90006aaa90404000004004000088817718880000000000000000000f000000000000000000000000000000000000000000000000000000000000000000
0009aaa60009aaf0000000000000000088871178180000000000000000000f000000000000000000000000000000000000000000000000000000000000000000
00009aee00009f100000000000000000288888811200000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000006ee000000000000000000000000288888777200000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000004040000040440000288888777200000000000000000000080000000000000000000000000000000000000000000000000000000000000000
00000000000000004040000040400000288888878200000000000000000000880000000000000000000000000000000000000000000000000000000000000000
00000000000000004040000040440000288888888200000000000000000008880000000000000000000000000000000000000000000000000000000000000000
000a99000e6000004040000040040000288888888200000000000000000088880000000000000000000000000000000000000000000000000000000000000000
0009aa6006a900004040000040440000616155161600000000000000000888880000000000000000000000000000000000000000000000000000000000000000
0009aee00aaa90000000000000000000677777777600000000000000008888800000000000000000000000000000000000000000000000000000000000000000
00006ee009aaf0000000000000000000677766777600000000000000088888000000000000000000000000000000000000000000000000000000000000000000
00000000009f10000000000000000000677766777600000000000000888880000000000000000000000000000000000000000000000000000000000000000000
0000000000000000404000007700000067776677760000000000000ff88800000000000000000000000000000000000000000000000000000000000000000000
000000000000000044040000777000006777667776000000000000f0ff8000000000000000000000000000000000000000000000000000000000000000000000
00066000000000004004000007770000677766777600000000000000000000000000000000000000000000000000000000000000000000000000000000000000
006ee600000ee6004040000000777000677766777600000000000000000000000000000000000000000000000000000000000000000000000000000000000000
006ee600000e6a904444000000777700677766777600000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000660000006aaa90000000000077770644466444600000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000009aaf0000000000077777644411444600000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000009f10000000000077777444411444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222200000000000000000000000000000000
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222200000000000000000000000000000000
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222200000000000000000000000000000000
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222200000000000000000000000000000000
2222222ddddddddd22222dddddddd22ddddddd22222222222222dddddd22222dddddd22222ddddddddd222222ddddd2200000000000000000000000000000000
222222dd11ddd11dd22222d111dd222dd111dd222222222222222d1111d2222dd1dd22222dd11ddd11dd22222d111d2200000000000000000000000000000000
22222d111d222d11dd2222d111d22222d11dd2222222222222222d1111d22222d1d22222d111d222d11dd2222d111d2200000000000000000000000000000000
2222d111d2222d111d2222d111d2222dd11d22222222222222222d1111d2222dddd2222d111d2222d111d2222d11dd2200000000000000000000000000000000
222d111d22222d111d2222d111d2222d111d22222222222222222d1d111d222d1d2222d111d22222d111d2222d11d22200000000000000000000000000000000
222d111d22222d111d222dd11dd2222d111d2222222222222222dddd111d222d1d2222d111d22222d111d222dd11d22200000000000000000000000000000000
22d111d222222d111d222d111d22222d111d2222222222222222d1ddd11d222d1d222d111d222222d111d222dd1dd22200000000000000000000000000000000
22d111d222222d111d222d111dd222dd11dd2222222222222222d1d2d111d22d1d222d111d222222d111d222d11d222200000000000000000000000000000000
22d111d222222d111d222d111dddddd111d22222222222222222d1d2d111d2dddd222d111d222222d111d222d11d222200000000000000000000000000000000
2dd11dd222222d111d222d11ddddddd111d22222222222222222d1d22d11d2d1d222dd11dd222222d111d222d1dd222200000000000000000000000000000000
2d111d222222dd11dd22dd11d22222d111d2222222222222222dddd22d11ddd1d222d111d222222dd11dd222d1d2222200000000000000000000000000000000
2d111d222222d111d222d111d22222d11dd2222222222222222d1d222d111dd1d222d111d222222d111d2222ddd2222200000000000000000000000000000000
2d111d22222dd111d222d111d2222dd11d22222222222222222d1d2222d11dddd222d111d22222dd111d2222dd22222200000000000000000000000000000000
2d111d22222d111d2222d11dd2222d111d22222222222222222d1d2222d1111d2222d111d22222d111d222222222222200000000000000000000000000000000
2dd11d2222dd11dd222dd11d22222d111d2222dddd22222222dddd2222d1111d2222dd11d2222dd11dd2222dddd2222200000000000000000000000000000000
22d11dd22dd11dd2222d111d22222d111d2222d11d22222222d1dd22222d111d22222d11dd22dd11dd2222dd11d2222200000000000000000000000000000000
222d11dddd11dd2222dd111dd222dd111d222dd1dd2222222dd1dd22222d111d222222d11dddd11dd22222d11d22222200000000000000000000000000000000
2222dddddddd222222ddddddd22dddddddd22d11d22222222dddddd2222ddddd2222222dddddddd2222222dddd22222200000000000000000000000000000000
222222222222222222ddddddd22ddddddd222d1dd22222222ddddd222222ddd22222222222222222222222dddd22222200000000000000000000000000000000
222222222222222222222222222222222222dd1d2222222222222222222222222222222222222222222222222222222200000000000000000000000000000000
22222222222222222222222222222222222dddd222222222c222c222cccc2222ccc22ccc22222c222c22222c2222222200000000000000000000000000000000
22222222222222222222222222222222222ddd2222222222cc22c22cc22cc22c22222c22c222c2c22cc222cc2222222200000000000000000000000000000000
222222222222222222222222222222222222222222222222cc22c22c2222c2c222222c22c222c2c22cc222cc2222222200000000000000000000000000000000
222222222222222222222222222222222222222222222222c2c2c22c2222c2c2ccc22ccc222c22c22c2c2c2c2222222200000000000000000000000000000000
222222222222222222222222222222222222222222222cc2c22cc22c2222c2c222c22c2c222cccc22c2c2c2c2222222200000000000000000000000000000000
222222222222222222222222222222222222222222222222c22cc22cc22cc2cc22c22c22c22c222c2c22c22c2222222200000000000000000000000000000000
222222222222222222222222222222222222222222222222c222c222cccc222cccc22c222cc2222c2c22c22c2222222200000000000000000000000000000000
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222200000000000000000000000000000000
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
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7000720000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8081828384858687000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9091929394959697000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a0a1a2a3a4a5a6a7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b0b1b2b3b4b5b6b7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00020000182502f25031250312502f250322502e2502425021250252502625022250272502b2502c25021250022500b2500f250122501225011250102500d2500925005250022500125000250002500025000250
3f0f0000171001510013100131000c150101000c1500e1001715015150131501315011150101500e1000e150236000c1502760029600006000000000000000000000000000000000000000000000000000000000
000100002265022650226502265022650226502165021650206501e6501b640186401663013630106300c620086300762003650006500b6000060000600006000060000600006000060000600006000060000600
900100000566005640056300563005630056300563005630056300663006630066300664006640066400664006640066400663006630076300763007620076100760000000000000000000000000000000000000
