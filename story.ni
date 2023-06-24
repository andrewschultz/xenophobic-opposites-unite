"Xenophobic Opposites, Unite!" by Andrew Schultz

volume heading stuff

include Old School Verb Total Carnage by Andrew Schultz.

include Trivial Niceties by Andrew Schultz.

include Chessboard Rendering Utilities by Andrew Schultz.

include Chess Four Bishops by Andrew Schultz.

the player is in e1;

when play begins:
	move white light squared bishop to a1;
	move white dark squared bishop to h1;
	now black king is in e8;

chapter game specific stuff

to say text-board-description:
	say "Here at [location of player], you can see your light-squared bishop at [llsb] and your dark-squared bishop at [ldsb]. The enemy king skulks at [location of black king]"

volume moving rules

check going:
	if the room gone to is adjacent to location of black king, say "Oops! Don't want to get too near the black king." instead;

volume definitions

to decide which room is lwk: decide on location of white king;
to decide which room is lbk: decide on location of black king;

to decide which room is llsb: decide on location of white light squared bishop;
to decide which room is ldsb: decide on location of white dark squared bishop;

to decide which number is lsbx: decide on xval of llsb;
to decide which number is lsby: decide on yval of llsb;

to decide which number is dsbx: decide on xval of ldsb;
to decide which number is dsby: decide on yval of ldsb;

to decide which direction is todir of (r1 - a room) and (r2 - a room): [from r1 to r2]
	if xval of r1 is xval of r2:
		if yval of r1 > yval of r2, decide on north;
		if yval of r1 < yval of r2, decide on south;
		decide on up;
	if yval of r1 is yval of r2:
		if yval of r1 > yval of r2, decide on west;
		if yval of r1 < yval of r2, decide on east;
		decide on up;
	if xval of r1 < xval of r2:
		if yval of r1 < yval of r2, decide on northeast;
		decide on southeast;
	if yval of r1 < yval of r2, decide on northwest;
	decide on southwest;

definition: a room (called sq) is king-reachable:
	unless sq is adjacent to lwk, no;
	if sq is adjacent to lbk, no;
	if number of people in sq > 0, no;
	yes;

definition: a room (called sq) is lsb-reachable:
	let x0 be xval of sq;
	let y0 be yval of sq;
	unless (x0 - y0) is (lsbx - lsby) or (x0 - y0) is (lsby - lsbx), no;
	let mydiag be todir of llsb and sq;

definition: a room (called sq) is dsb-reachable:
	let x0 be xval of sq;
	let y0 be yval of sq;
	unless (x0 - y0) is (dsbx - dsby) or (x0 - y0) is (dsby - dsbx), no;
	let mydiag be todir of ldsb and sq;

volume parser stuff

rule for printing a parser error (this is the general info error rule):
	say "Sorry, I couldn't parse that. Commands never need to be more than three letters long, and there are only limited squares per move. In this case, you can ";
	process the print-legal-moves rule;
	say "Note that not specifying who moves to a square has me try the king first, then a bishop, if possible.[paragraph break]Also, a more comprehensive list of commands is at [verb-say].";
	abide by the descriptive-warn rule;
	the rule succeeds;

this is the print-legal-moves rule:
	say "move to [list of king-reachable rooms], move your light-squared bishop to [list of lsb-reachable rooms], or move your dark-squared bishop to [list of dsb-reachable rooms].";
