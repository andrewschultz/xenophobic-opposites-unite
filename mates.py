#mates.py: two-bishop mates from text

import sys
import re

from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw

clear_board = "c:/games/inform/xenophobic-opposites-unite.inform/Source/clear.bmp"
chess_icons = "c:/games/inform/xenophobic-opposites-unite.inform/Source/kings.bmp"

one_line = [ 0, 1, 0, 1, 0, 1, 0, 1 ]
one_line.extend(one_line[::-1])

def vet_king_move(l1, l2, my_move):
    a = abs((l1 & 7) - (l2 & 7))
    l3 = l1 >> 3
    l4 = l2 >> 3
    b = abs((l3 & 7) - (l4 & 7))
    if a > 1 or b > 1:
        print("Uh-oh. too-far king move on move {}, {} to {}.".format(my_move, l1, l2))
    if a == 0 and b == 0:
        print("Uh-oh. null king move on move {}, {} to {}.".format(my_move, l1, l2))

def write_one_graphic(file_name, placements):
    background = Image.open(clear_board).convert("RGBA")
    foreground = Image.open(chess_icons)

    h_delta = 64
    v_delta = 64

    these_lines = one_line * 4
    these_lines[placements[0]] += 2
    these_lines[placements[3]] += 4
    these_lines[placements[1]] = 6
    these_lines[placements[2]] = 7

    for x in range(0, 64):
        icon_h = (these_lines[x] % 2) * h_delta
        icon_v = (these_lines[x] // 2) * v_delta
        foreground_temp = foreground.crop((icon_h, icon_v, icon_h + h_delta, icon_v + v_delta)).convert("RGBA")
        background.paste(foreground_temp, (h_delta * (x % 8), v_delta * (x // 8)), foreground_temp)

    out_file = "{}.png".format(file_name)
    try:
        background.save(out_file)
        print("Wrote", out_file)
    except:
        sys.exit("Could not create {}.".format(out_file))

def to_board(two_square_thing):
    return ord(two_square_thing[0]) - ord('a') + 8 * (8 - int(two_square_thing[1]))

def is_dark_square(numerical_location):
    v1 = (numerical_location >> 3) & 1
    v2 = numerical_location & 1
    return v1 != v2

def write_lines(my_prefix, list_of_moves):
    wk_location = to_board(list_of_moves[0])
    lsb_location = to_board(list_of_moves[1])
    dsb_location = to_board(list_of_moves[2])
    if is_dark_square(lsb_location):
        (lsb_location, dsb_location) = (dsb_location, lsb_location)
    bk_location = to_board(list_of_moves[3])
    white_moves = True
    total_moves = 0
    placements = [wk_location, lsb_location, dsb_location, bk_location]
    write_one_graphic("{}-{:02d}-{}".format(my_prefix, total_moves, 2 - white_moves), placements)
    for x in range(4, len(list_of_moves)):
        print(list_of_moves[x])
        if white_moves:
            total_moves += 1
        my_move = list_of_moves[x].lower()
        if not re.search("^[kb][a-h][1-8]$", my_move):
            sys.exit("Bad move {}.".format(my_move))
        who_moves = my_move[0]
        where_moves = to_board(my_move[1:])
        if who_moves not in 'bk':
            sys.exit("Bad piece to move {} in {}.".format(who_moves, my_move))
        if my_move.startswith('k'):
            if white_moves:
                vet_king_move(wk_location, where_moves, x)
                wk_location = where_moves
            else:
                vet_king_move(bk_location, where_moves, x)
                bk_location = where_moves
        elif my_move.startswith('b'):
            if is_dark_square(where_moves):
                dsb_location = where_moves
            else:
                lsb_location = where_moves
        placements = [wk_location, lsb_location, dsb_location, bk_location]
#        print("wk {} lsb {} dsb {} bk {}".format(wk_location, lsb_location, dsb_location, bk_location))
        write_one_graphic("{}-{:02d}-{}".format(my_prefix, total_moves, 2 - white_moves), placements)
        white_moves = not white_moves

with open("mates.txt") as file:
    for (line_count, line) in enumerate(file, 1):
        if line.startswith('#'):
            continue
        if line.startswith(';'):
            break
        ary = line.lower().strip().split(',')
        write_lines(ary[0], ary[1:])
