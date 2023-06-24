"Xenophobic Opposites, Unite!" by Andrew Schultz

volume big picture stuff

chapter headings

include Old School Verb Total Carnage by Andrew Schultz.

include Trivial Niceties by Andrew Schultz.

include Bold Final Question Rows by Andrew Schultz.

include Intro Restore Skip by Andrew Schultz.

include Chessboard Rendering Utilities by Andrew Schultz.

include Chess Four Bishops by Andrew Schultz.

section testing - not for release

include Xenophobic Opposites Unite Tests by Andrew Schultz.

chapter starting off

the player is in e1.

the description of e1 is "[if sent-yet is false]Conference time![else if screenread is true][text-board-description].[else][grid-printout][run paragraph on][end if]";

when play begins:
	move white light squared bishop to h1;
	move white dark squared bishop to a1;
	now black king is in e8;
	process the check-skip-intro rule;
	if the rule succeeded, continue the action;

when play begins:
	now use-custom-screenread is true;
	say "[this-game] renders a chessboard in text maps for room descriptions. This will play very poorly with screen readers. In addition, you may prefer a text description to a chessboard as a matter of taste. Do you wish to activate text/screenreader mode?";
	if debug-state is false, ask-screenread;

chapter game specific stuff

sent-yet is a truth state that varies.

rule for printing the locale description when sent-yet is false (this is the recap start choice rule):
	say "You need to deal with your two bishops who dislike each other. But how? You have some opportunity to marshal your forces, but you're not sure what would be best.";
	say "[line break] 1. You! To your corners! A1 and H1[one of]! The farther apart, the better! Further, whatever. We're at war here. Grammar be hanged[or][stopping]!";
	say " 2. You're too powerful to be sent to the corners, so B1 and G1 it is! But next time I'll be harsher!";
	say " 3. You will go back to your original squares on C1 and F1, and you will go back to your original squares now!";
	say " 4. Okay, team. We're a team, and we stick together. You two, in front of me at e2 and d2.";
	say " 5. Think about what to do.";

numguessing is an action applying to one number.

understand "[number]" as numguessing when sent-yet is false.

carry out numguessing:
	if the number understood < 0 and the number understood > 5:
		say "You need to choose 1-5 or 0 to recap your choices." instead;
	if the number understood is 5:
		say "You remember something vague from all your tactical training. The bishops need to get in close around the enemy king, then you need to push him into the corner. So what's the best way to zigzag across the board efficiently?";
		continue the action;
	if the number understood is 0:
		follow the recap start choice rule instead;
	if the number understood is 1:
		move white light squared bishop to h1;
		move white dark squared bishop to a1;
	if the number understood is 2:
		move white light squared bishop to b1;
		move white dark squared bishop to g1;
	if the number understood is 3:
		move white light squared bishop to f1;
		move white dark squared bishop to c1;
	if the number understood is 4:
		move white light squared bishop to e2;
		move white dark squared bishop to d2;
	say "The bishops trudge off to [if xval of llsb < 5][llsb] and [ldsb][else][ldsb] and [llsb][end if].";
	now sent-yet is true;
	move the player to e1;
	if screenread is false:
		say "[i][b]NOTE[r][i]: the game defaults to showing a text board, but you may wish to put the board in the header. You can do this with [b]HDR ##[r][i], where ## is a number from 1 to 32.[close bracket][r]"

to say text-board-description:
	say "Here at [location of player], you can see your light-squared bishop at [llsb] and your dark-squared bishop at [ldsb]. The enemy king skulks at [location of black king]"

volume verbs and rules

after going:
	abide by the check-mates rule;

after piecemoving:
	abide by the check-mates rule;

this is the check-mates rule:
	if number of black-available rooms is 0:
		if lbk is dsb-reachable or lbk is lsb-reachable:
			say "Checkmate!";
			end the story;
		say "Stalemate! Ouch!";
		end the story;
		the rule succeeds;
	let currm be location of player;
	let top-priority be -1;
	repeat with rm running through black-available rooms:
		if number of people in rm is 1:
			say "The black king laughs as he walks up to [rm] and takes out [the random person in rm]. How did you miss that one?";
			end the story;
			the rule succeeds;
		if priority of rm > top-priority:
			now currm is rm;
			now top-priority is priority of rm;
	say "The black king moves to [currm].";
	move black king to currm;
	try looking;
	the rule succeeds;

a room has a number called priority.

when play begins:
	repeat with rm running through rooms:
		let xdelta be 9 - (2 * xval of rm);
		if xdelta < 0, now xdelta is 0 - xdelta;
		let ydelta be 9 - (2 * yval of rm);
		if ydelta < 0, now ydelta is 0 - ydelta;
		now xdelta is 7 - xdelta;
		now ydelta is 7 - ydelta;
		if xdelta < ydelta:
			let temp be xdelta;
			now xdelta is ydelta;
			now ydelta is temp;
		now priority of rm is (10 * ydelta) + xdelta;

volume verbs and stuff

piecemoving is an action applying to one visible thing.

understand "[any room]" as piecemoving.

check piecemoving:
	if directed-piece is 1:
		if noun is not king-reachable:
			say "That's not a legal square to move to." instead;
		continue the action;
	if directed-piece is 2:
		if noun is white:
			if noun is not lsb-reachable:
				say "Your light-squared bishop cannot move to that square." instead;
		else:
			if noun is not dsb-reachable:
				say "Your light-squared bishop cannot move to that square." instead;
		continue the action;
	if noun is king-reachable:
		say "(No piece given, assuming the king since it's legal)";
		now directed-piece is 1;
		continue the action;
	if noun is lsb-reachable:
		say "(light-squared bishop)";
		now directed-piece is 2;
		continue the action;
	if noun is dsb-reachable:
		say "(dark-squared bishop)";
		now directed-piece is 2;
		continue the action;
	say "Unfortunately, I couldn't detect what you wanted to move to [noun]." instead;

to decide whether (rm - a room) is black:
	if remainder after dividing (xval of rm + yval of rm) by 2 is 0, yes;
	no;

to decide whether (rm - a room) is white:
	if rm is black, no;
	yes;

carry out piecemoving:
	if directed-piece is 1:
		move player to noun;
	else if directed-piece is 2:
		if noun is black:
			move white dark squared bishop to noun;
		else:
			move white light squared bishop to noun;
	else:
		say "A bad error here in the fallthrough code. Preface the square with K or B. Sorry about that." instead;

volume moving rules

check going:
	if the room gone to is adjacent to location of black king, say "Oops! Don't want to get too near the black king." instead;

volume parser nonsense

directed-piece is a number that varies.

after reading a command:
	now directed-piece is 0;
	if sent-yet is false:
		unless the player's command matches the regular expression "^<0-9>+$":
			say "You need to enter 1-5.";
			reject the player's command;
	if the player's command matches the regular expression "<bk><a-z><0-9>":
		if character number 1 in the player's command is "k":
			now directed-piece is 1;
		else if character number 1 in the player's command is "b":
			now directed-piece is 2;
		strip-algebraic-front-letter;

rule for printing a parser error:
	if the player's command matches the regular expression "<a-z><0-9>":
		say "It looks like you tried to jump off the board. No fleeing, pal!";
		the rule succeeds;

volume definitions

definition: a room (called rm) is black-available:
	if rm is not adjacent to lbk, no;
	if rm is adjacent to lwk, no;
	if rm is lsb-reachable, no;
	if rm is dsb-reachable, no;
	yes;

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

[this code can be conglomerated. a room(x) and a piece(y) are bishop-reachable...]

definition: a room (called sq) is lsb-reachable:
	let x0 be xval of sq;
	let y0 be yval of sq;
	if sq is location of white light squared bishop, no;
	unless (lsbx - x0) is (lsby - y0) or (lsbx - x0) is (y0 - lsby), no;
	let mydiag be todir of llsb and sq;
	let thisrm be the room mydiag of llsb;
	while thisrm is not sq:
		if thisrm is nothing, no;
		if white king is in thisrm, no;
		now thisrm is the room mydiag of thisrm;
	yes;

definition: a room (called sq) is dsb-reachable:
	let x0 be xval of sq;
	let y0 be yval of sq;
	if sq is location of white dark squared bishop, no;
	unless (dsbx - x0) is (dsby - y0) or (dsbx - x0) is (y0 - dsby), no;
	let mydiag be todir of ldsb and sq;
	let thisrm be the room mydiag of ldsb;
	while thisrm is not sq:
		if thisrm is nothing, no;
		if white king is in thisrm, no;
		now thisrm is the room mydiag of thisrm;
	yes;

volume parser stuff

rule for printing a parser error (this is the general info error rule):
	say "Sorry, I couldn't parse that. Commands never need to be more than three letters long, and there are only limited squares per move. In this case, you can ";
	process the print-legal-moves rule;
	say "Note that not specifying who moves to a square has me try the king first, then a bishop, if possible.[paragraph break]Also, a more comprehensive list of commands is at [verb-say].";
	abide by the descriptive-warn rule;
	the rule succeeds;

this is the print-legal-moves rule:
	say "move to [list of king-reachable rooms]";
	let temp be list of lsb-reachable rooms;
	if number of entries in temp is 0:
		say ". You can't move your light-squared bishop.";
	else:
		say ". Your light-squared bishop can move to [list of lsb-reachable rooms]";
	let temp be list of dsb-reachable rooms;
	if number of entries in temp is 0:
		say ". You can't move your dark-squared bishop.";
	else:
		say ". Your dark-squared bishop can move to [list of dsb-reachable rooms]";
	say ".";