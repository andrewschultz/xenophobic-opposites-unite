"Xenophobic Opposites, Unite!" by Andrew Schultz

volume big picture stuff

the story headline is "The end of a long, brutal war".

the story description is "A text-adventure implementation of a semi-tricky chess endgame".

the release number is 1.

release along with the "Parchment" interpreter.

release along with a website.

release along with cover art.

chapter headings

include Old School Verb Total Carnage by Andrew Schultz.

include Trivial Niceties by Andrew Schultz.

include Bold Final Question Rows by Andrew Schultz.

include Intro Restore Skip by Andrew Schultz.

include Full Chessboard Utilities by Andrew Schultz.

include Chessboard Rendering Utilities by Andrew Schultz.

include Chess Four Bishops by Andrew Schultz.

section testing - not for release

include Xenophobic Opposites Unite Tests by Andrew Schultz.

chapter starting off

the player is in e1. description of the player is "You hope you do not look as ragged as you feel. I mean, yeah, battle raiments get worn and all after a long fight, but you're probably glad you have no mirror."

to say that-bishop: say "He is giving a sidelong glance to [if item described is white light squared bishop]the black light squared bishop[else]the white light squared bishop[end if]. His robes are dusty and bloodied from a long fight. You wonder what their theological differences really are. It's a bit beyond you. You have a country to run"

description of white light squared bishop is "[that-bishop]."

description of white dark squared bishop is "[that-bishop]."

found-scrap is a truth state that varies.

check xing the player when found-scrap is false:
	now found-scrap is true;
	say "Oh hey! You search your robes and stuff and find some hastily scribbled notes. You can examine them, to get an idea how to push the enemy back, or you can drop it and lose it for good.";
	now player has the scrap;

check dropping scrap:
	now scrap is off-stage;

the scrap is a thing. description of scrap is "You've scribbled some notes on it. In it, you are standing to the left of both your bishops. The enemy king is two squares away from the one in the center. You wrote criss-cross arrows so that the bishops seem to be moving across each other's paths, but after they've both moved, the enemy is restricted further."

the description of e1 is "[if sent-yet is false]The pep talk stopped your two bishops grumbling for the most part. But you still haven't quite made it clear who's boss.[else if screenread is true][text-board-description].[else][grid-printout][run paragraph on][end if]";

moves-left is a number that varies. moves-left is 50.

check requesting the score:
	say "You have [moves-left] move[if moves-left > 1]s[end if] before the fifty-move rule kicks in. You think you're close. You hope you're close. At the end, there is only winning and not winning.";

when play begins:
	move white light squared bishop to h1;
	move white dark squared bishop to a1;
	now black king is in e8;
	process the check-skip-intro rule;
	now right hand status line is "[moves-left] moves to go";
	if the rule succeeded, continue the action;
	say "You forgot the details of the religious schism in your country, but it was serious to divide it in roughly half. It's been that way, which may be a good thing, since it avoids any sort of civil war. I mean, there's tension, but if one sect got tons more powerful than the other, they might get violent. It seems to happen in a lot of countries, this balance of power.";
	wfak;
	say "You have to admit, you encourage it. It keeps the peasants and noblemen busy in silly squabbles when you want to run the country, and you're a half-decent politician preaching general unity when needed. And the bishops--well, they kept pretty good control over their fiefdoms even if the balance between 'God and King' wasn't in proportions you'd hoped for.";
	wfak;
	say "When that other country declared war on you, too, you unified the country well. Both bishops, the light- and dark-squared ones, knew what to do. True, the light-squared bishop was friends with the LSB from the other country, and same for the respective DSB's. But war was war.";
	wfak;
	say "And it was brutal. Castles went up in flames. The queens died quickly. And ... well, somewhere, one of your knights and an opposing bishop killed each other off. Your two bishops ... well, they actually cooperated pretty well! They made just enough trouble to take a pawn without retribution. But other pairs of opposing pawns died off.";
	wfak;
	say "Then an enemy knight sacrificed itself for a pawn that was about to super-charge, and the same for an enemy bishop. Only you, your two bishops, and the opposing king were left. Dang it!";
	wfak;
	say "You knew the basic stuff, gaffling an enemy king with the help of your queen, or a rook. But with two bishops? That was trickier. Even though some combat egghead said they were worth six points combined, with a rook only five. Whatever.";
	wfak;
	say "It's time for a pep talk. The bishops look a bit exasperated at the thought. But you ARE the king. [i][b]NOTE:[r][i] this introduction went on long enough. You can see the pep talk with [b]PEP[r][i], if you're so inclined.[close bracket][r]";
	wfak;

when play begins:
	now use-custom-screenread is true;
	say "[this-game] renders a chessboard in text maps for room descriptions. This will play very poorly with screen readers. In addition, you may prefer a text description to a chessboard as a matter of taste. Do you wish to activate text/screenreader mode?";
	if debug-state is false, ask-screenread;

chapter peping

peping is an action out of world.

understand the command "pep" as something new.

understand "pep" as peping.

carry out peping:
	say "A brief summary of your pep talk:";
	say "[line break]'Now I know we have our differences, but guys, these differences, they're what make us great! We couldn't win with two light-squared bishops or with two dark-squared bishops.  Now I know both you guys have those grapevines for turning over peasants who don't tithe. Why, their neighbors are glad to rat out people of any denomination! That's impressive, that's class, that's power! We need to bring that cooperation to something bigger than tithe cheats. If we put our minds to it, there's nothing we can't do!'";
	say "[line break]The two bishops would've groaned a bit at that one, but they're no dummies. They know 'something to do' would expand their influence. And you'd look like a fool if things failed.";
	say "[line break]'Okay. We know who's got the dark squares locked down. We know who's got the light squares locked down. And we trust each other not to step on the other's squares. And you know what? You guys together are worth more than a rook! Heck, those eggheads who say a rook is worth more than one of you never heard you guys discuss real issues. Rooks just sit there full of treasure and crumble slowly. I mean no offense we need them and all but geez. Plus they do sit back in battle and let other pieces get killed first. And they're flippin['] TERRIBLE at blockading pawns! You guys, it doesn't affect your movement one bit.'";
	say "[line break]Here you receive a bit of fawning about how they are not as great alone or together as your queen, God rest her soul. You raise a hand. 'What's important now is the people we got left. She wouldn't want you, or me, to worry about her. Plus all those ceremonies you performed, she's gotta have a luxury suite in heaven for that. You guys totally did me a solid there. And I don't know the details of big philosophical questions, but I know this. If I had to go to war, I'd go to war with you guys, and not your counterparts who got killed out there.'";
	say "[line break]The bishops are smart but not immune to flattery. They nod wisely, but you suspect they are really just looking ahead to the possible increased influence and income if, IF, you get things right, here. There's an awkward silence.";
	say "[line break]'LET'S DO THIS, TEAM!'";
	the rule succeeds;

chapter game specific stuff

sent-yet is a truth state that varies.

rule for printing the locale description when sent-yet is false (this is the recap start choice rule):
	say "You need to get your two bishops in line. They squabble a lot during peacetime, but it's war, now, and everyone needs to be on the same page. Easy enough when you had a full army, but they're the only ones left.[paragraph break]But how? Separate them completely? Force them together? You suspect there will be no huge ramifications for not starting perfectly.";
	say "[line break] 1. You! To your corners! A1 and H1[one of]! The farther apart, the better! Further, whatever. We're at war here. Grammar be hanged[or][stopping]!";
	say " 2. You're too powerful and grown-up to be sent to the corners, so B1 and G1 it is! But next time I'll be harsher!";
	say " 3. You will go back to your original squares on C1 and F1, and you will go back to your original squares now!";
	say " 4. Okay, team. We're a team, and teams stick together. You two, in front of me at e2 and d2.";
	say " 5. Think [if think-five is true]again [end if]about what to do before giving orders.";

numguessing is an action applying to one number.

understand "[number]" as numguessing when sent-yet is false.

think-five is a truth state that varies.

carry out numguessing:
	if the number understood < 0 and the number understood > 5:
		say "You need to choose 1-5 or 0 to recap your choices." instead;
	if the number understood is 5:
		say "You remember something vague from all your tactical training. The bishops need to get in close around the enemy king, then you need to push him into the corner. So what's the best way to zigzag across the board efficiently?";
		now think-five is true;
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
		say "[i][b]NOTE[r][i]: the game defaults to showing a text board, but you may wish to put the board in the header. You can do this with [b]HDR ##[r][i], where ## is a number from 1 to 32. [b]HDR 0[r][i] gives all the details, but I recommend [b]HDR 24[r][i].[close bracket][r]"

to say text-board-description:
	say "Here at [location of player], you can see your light-squared bishop at [llsb] and your dark-squared bishop at [ldsb]. The enemy king skulks at [location of black king]"

volume verbs and rules

after going:
	abide by the check-mates rule;

after piecemoving:
	abide by the check-mates rule;

this is the check-mates rule:
	consider the check-bishops-together rule;
	if number of black-available rooms is 0:
		if lbk is dsb-reachable or lbk is lsb-reachable:
			say "The enemy king rages. 'You?! I didn't think you were so smart! Well, if you were REALLY smart, and you'd focused on bigger-picture battle strategies, you'd have beaten me long before.'[paragraph break]What a sore loser! Unfortunately, you can't kill him then and there on the spot.[paragraph break]The citizens of the conquered country are even more in awe of your strategical prowess than if you'd just blown the enemy army away. You know things! You see details! You are not to be messed with.[paragraph break]That said, you're not big on making people knuckle under to you. Your experience figuring out the checkmate with two bishops has made you more thoughtful and considerate of abstract problems. You become a better ruler than you thought you could be.";
			end the story saying "Checkmate";
			the rule succeeds;
		say "The enemy king looks around, panicked. 'No!' he cries. 'It can't end this way!' Then ... 'Aha! Yes! It won't! I'm not being attacked! You've trapped me, but you weren't attacking me when you did!'[paragraph break]It's an obscure rule, of course, but one you have to respect.[paragraph break]Your own rule at home is slightly weakened by this, but you're popular enough to explain that you really just lost the war on a technicality, and enough people survived, and hey, it wasn't the common people's castles or wives that got lost in the war, so you feel their pain and then some. It works. But there could've been more.";
		end the story saying "Stalemate";
		the rule succeeds;
	let currm be location of player;
	let top-priority be -1;
	repeat with rm running through black-available rooms:
		if number of people in rm is 1:
			say "The black king laughs as he walks up to [rm] and takes out [the random person in rm]. How did you miss that one?[paragraph break]The only bright side is that the two bishops, wily as they are, won't dethrone you. Their seconds-in-command aren't bold enough, yet.";
			end the story saying "Catastrophic deadlock";
			the rule succeeds;
		if priority of rm > top-priority:
			now currm is rm;
			now top-priority is priority of rm;
	say "The black king moves to [currm].";
	move black king to currm;
	try looking;
	decrement moves-left;
	repeat through table of move-checks:
		if moves-left is my-moves entry, say "[bishop-blather entry][line break]";
	if moves-left is 0:
		end the story saying "The Enemy Survived";
	the rule succeeds;

table of move-checks
my-moves	bishop-blather
0	"Oh no! You fell foul of the 50-move rule! It seems like a silly tradition. You thought you were getting somewhere. Apparently the rule is there so wars don't get interminable, but really, maybe interminable wars where people don't get killed aren't so bad.[paragraph break]Well, back to ruling your kingdom, though your status must surely be weakened.[paragraph break]Sure enough, the two bishops you couldn't get to work together to defeat the enemy depose you for your second-cousin six months later. Ugh, an overambitious chap who couldn't even trap the enemy king with his Queen! Fortunately, your almost-victory in the war gained you enough sympathizers you are able to live out your life in a remote village with a decent stipend."
10	"The two bishops show the most camaraderie they've shown yet, mumbling and wondering if you really have the gumption and battle knowledge to close the deal here. They'd have organized things better, for sure."
20	"The two bishops now look very agitated. They wonder if you are ever going to get around to putting the enemy king away. Rough crowd, man."
30	"The two bishops start to look impatient. They roll their eyes. You catch them shrugging at each other, as if to say 'What can you do?' Harsh, man."
40	"The two bishos drum their fingers against their opposite forearms. It's really too soon for that. You're still organizing how best to snare the black king."

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

volume standard verbs

the block thinking rule is not listed in any rulebook.

think-warn is a truth state that varies.

check thinking:
	if think-warn is false:
		say "Oh, man! You remember so much from those military strategy books you had forced on you. All the special cases that probably would never happen, but each instructor assured you THEIR special case would not only be more likely to happen in the coming years, BUT it would be more applicable generally! You feel guilty for slacking now.[paragraph break][i][bracket]Okay, this was a flake-out/warning aggainst immediate spoilers. Real hints will appear the next time.[close bracket][paragraph break]Note also it's possible to get through [this-game] without triggering the first hint, but if you do, you really, really know what you're doing.";
		now think-warn is true;
		the rule succeeds;
	if bishops-together is false:
		say "As much as your bishops hate each other, they work quite well when side-by-side. The enemy king cannot approach them, and he is stuck in a triangle! So that is a good start." instead;

bishops-together is a truth state that varies.

this is the check-bishops-together rule:
	if bishops-together is true, continue the action;
	if difference-hash of white light squared bishop and white dark squared bishop is 10:
		if bishop-vulnerable:
			say "Your two bishops don't feel great together, but hey, you're the one giving the orders here. The enemy king smiles a bit, as if he sees a weakness.";
			continue the action;
		say "Your two bishops don't feel great together, but hey, you're the one giving the orders here. The enemy king looks a bit afraid of them.";
		now bishops-together is true;
		continue the action;

to decide which number is difference-hash of (p1 - a person) and (p2 - a person):
	let dx be (xval of location of p1) - (xval of location of p2);
	let dy be (yval of location of p1) - (yval of location of p2);
	if dy < 0, now dy is 0 - dy;
	if dx < 0, now dx is 0 - dx;
	if dx < dy:
		let temp be dx;
		let dx be dy;
		let dy be temp;
	decide on dy + 10 * dx;

a room can be checked or unchecked. a room is usually checked.

to decide whether bishop-vulnerable:
	now all rooms are unchecked;
	if attacks-bishop of location of black king, yes;
	no;

to decide whether attacks-bishop of (rm - a room):
	say "Checking [rm].";
	if rm is llsb or rm is ldsb, yes;
	now rm is checked;
	repeat with q running through directions:
		let qrm be the room q of rm;
		if qrm is nothing, next;
		if qrm is checked, next;
		if qrm is lsb-reachable or qrm is dsb-reachable:
			now qrm is checked;
			next;
		if attacks-bishop of qrm, yes;
	no;

every turn:
	if bishop-vulnerable, say "The enemy king can capture a bishop.";

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

the off the board parser error rule is listed first in for printing a parser error.

rule for printing a parser error (this is the off the board parser error rule):
	if the player's command matches the regular expression "<a-z><0-9>":
		say "It looks like you tried to jump off the board. No fleeing, pal!";
		the rule succeeds;
	continue the action;

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