const fs = require('fs');
const path = require('path');

const explanations = {
    1: {
        1: "This is an informational round. No tapping required, just read the prompt and advance.",
        2: "The prompt clearly asks for two taps. There are no wildcards or extra rules, so the answer is exactly 2.",
        3: "Simple math: 2 + 3 equals 5. Tap 5 times.",
        4: "The text says 'one more tap', meaning exactly 1 tap.",
        5: "The prompt literally says 'exactly four taps', so tap 4 times.",
        6: "A trio means three items. Tap exactly 3 times.",
        7: "Basic math operation: 7 minus 6 is 1. Tap 1 time.",
        8: "Half a dozen is 6. Tap exactly 6 times.",
        9: "Math operation: 10 minus 8 is 2. Tap 2 times.",
        10: "The prompt formally states 'Five taps to finish'. Tap 5 times."
    },
    2: {
        1: "This is an informational round introducing icons. Advance without tapping.",
        2: "There are exactly 3 blue circles on the screen. Count them and tap 3 times.",
        3: "There are three objects, but only 2 of them are red (a square and a triangle). Tap 2 times.",
        4: "There are two squares, but only 1 of them is green. Tap 1 time.",
        5: "There are exactly 4 green stars on the screen. Count them and tap 4 times.",
        6: "The text says 'Tap the number of words in this sentence.' There are 8 words. Ignore the lightbulbs on the screen!",
        7: "There are two hearts (favorite_outline) and two triangles. Only count the hearts: 2 taps.",
        8: "There are two circles (both green). The other shapes are a square and a triangle. Tap exactly 2 times.",
        9: "There are 2 red circles on the screen. The prompt says to 'count the circles, then add two'. 2 + 2 = 4 taps.",
        10: "There are 3 icons, but only 2 of them are actual timers (one blue, one green). Tap exactly 2 times."
    },
    3: {
        1: "Informational round reminding you to consider active Wildcards.",
        2: "The prompt asks for 2 taps, but the Vintage Carnival Ticket wildcard is active! It always adds +1 to your count, making it 3.",
        3: "There are 3 red squares on the screen. However, the Vintage Carnival Ticket adds +1 to your count. 3 + 1 = 4 taps.",
        4: "Half a dozen is 6. There's a green star, but the prompt doesn't ask about it, and no wildcard is active. Tap 6 times.",
        5: "There are exactly 2 blue triangles. The Vintage Carnival Ticket adds +1. 2 + 1 = 3 taps.",
        6: "The prompt simply says to tap 'more than three times'. Any number above 3 will structurally pass the threshold.",
        7: "There are exactly 4 green shapes on the screen. No wildcard active, so the answer is 4.",
        8: "There are exactly 4 red hearts. The Vintage Carnival Ticket is active, adding +1. 4 + 1 = 5 taps.",
        9: "The prompt says 'less than two times'. With no wildcard active, tapping anything below 2 passes the threshold.",
        10: "The prompt asks for a single tap (1). The Vintage Carnival Ticket wildcard adds +1. 1 + 1 = 2 taps."
    },
    4: {
        1: "The text says 'Tap TWO times'. No wildcard, so tap exactly 2 times.",
        2: "There are 2 red squares. The Vintage Carnival Ticket wildcard adds +1. 2 + 1 = 3 taps.",
        3: "Info round establishing a completely new persistent rule: 'If the answer is exactly three, do not tap'. Remember this for the rest of the level!",
        4: "The prompt asks for THREE taps. However, applying the rule from Round 3 ('If the answer is exactly three, do not tap'), the correct answer becomes 0.",
        5: "The prompt asks for TWO taps. The Vintage Carnival Ticket adds +1, making it 3. Our info rule triggers ('If the answer is exactly three, do not tap'), making the final answer 0!",
        6: "There are exactly 2 green stars. No wildcard and the answer is not three, so tap 2 times.",
        7: "Info round establishing a second persistent rule: 'Ignore all blue items'.",
        8: "There are 3 red circles and 2 blue circles. Due to the rule from Round 7, ignore the blue ones. 3 red circles equals 3 taps. BUT wait! The rule from Round 3 ('If the answer is exactly three, do not tap') triggers here too! So the final answer is 0.",
        9: "There are 4 green squares and 2 blue squares. Ignoring blue (Round 7 rule) leaves 4. The Vintage Carnival Ticket wildcard adds +1, giving 5 taps. (Doesn't trigger the 'three' rule).",
        10: "The prompt asks for ONE tap. The Vintage Carnival Ticket adds +1, making it 2. Tap 2 times."
    },
    5: {
        1: "There is 1 square and 1 circle. 1 square + Vintage Carnival Ticket (+1) = 2 taps.",
        2: "Count the objects: there are 3 shapes total. No wildcards or persistent rules yet, so the answer is 3.",
        3: "Info round establishing a persistent rule: 'If the answer is four, tap zero'.",
        4: "Two plus two is 4. Due to the rule from Round 3, an answer of 4 becomes exactly 0.",
        5: "Two plus two is 4. The Vintage Carnival Ticket adds +1, making the preliminary answer 5. Since it's no longer 4, the Round 3 rule doesn't trigger. Final answer is 5.",
        6: "There are 3 red stars. The Vintage Carnival Ticket adds +1, making it 4. This triggers the Round 3 rule ('If the answer is four, tap zero'), making the final answer 0!",
        7: "Info round establishing a new rule: 'Only count yellow items'.",
        8: "The prompt asks for stars, but based on Round 7, we ONLY count yellow items. There are white and blue stars, but NO yellow items. 0 stars = 0 taps.",
        9: "Same logic as before—there are white and blue stars, but zero yellow items. Tap 0 times.",
        10: "The prompt asks for white shapes. Due to Round 7's rule, we only count yellow items (so 0 white shapes). However, the Vintage Carnival Ticket adds +1 to our total. 0 + 1 = 1 tap."
    },
    6: {
        1: "The prompt asks for blue shapes. There is exactly 1 blue circle. Tap 1 time.",
        2: "The prompt asks for red shapes. There are none (0). But the Vintage Carnival Ticket adds +1. 0 + 1 = 1 tap.",
        3: "Info round establishes a rule: 'Green means two'. This alters how the color green is interpreted mathematically.",
        4: "The prompt asks to count 'green' shapes. Based on Round 3, the word 'green' literally means 'two'. Ignoring the screen icons completely, the answer is exactly 2.",
        5: "The prompt says 'Count all shapes'. There is 1 red circle and 1 green circle. That's 2 physical shapes total.",
        6: "There are 2 shapes total (one red star, one blue star). The Vintage Carnival Ticket adds +1, making the final count 3.",
        7: "Info round establishes a new rule: 'Ignore all blue objects'.",
        8: "The prompt says 'Count the blue circles'. But Round 7 says to ignore blue objects, making our count 0. The Vintage Carnival Ticket adds +1, making the final answer 1.",
        9: "A deeply compounding round! We must ignore the blue star (Round 7 rule). We have 1 red star, and the single green star counts as 2 (Round 3 rule 'Green means two'). 1 + 2 = 3 taps!",
        10: "The prompt says to tap exactly one time. The Vintage Carnival Ticket adds +1, making it 2 taps."
    },
    7: {
        1: "There is exactly 1 red square. Tap 1 time.",
        2: "There are zero blue items. However, the Vintage Carnival Ticket adds +1. 0 + 1 = 1 tap.",
        3: "Info round establishes a rule: the word 'Red' mathematically equals two taps.",
        4: "Count the physical red items. Two red circles means 2 items. Tap 2 times.",
        5: "Four add one equals 5. The Vintage Carnival Ticket (+1) makes it 6.",
        6: "Info round establishes a chaotic rule: 'Add means Subtract'.",
        7: "The prompt says: 'Red' add one. 'Red' means 2 (from Round 3). 'Add' means Subtract (from Round 6). So: 2 - 1 = 1. The Vintage Carnival Ticket (+1) brings it back to 2!",
        8: "Two add zero. 'Add' means Subtract. 2 - 0 = 2. Tap 2 times.",
        9: "Info round establishes a rule override: 'Red' now equals zero taps.",
        10: "The prompt asks for 'Red' add zero. 'Red' means 0 (from Round 9). 'Add' means subtract. 0 - 0 = 0. The Vintage Carnival Ticket (+1) brings the final answer to 1."
    },
    8: {
        1: "Simply tap 1 time.",
        2: "Simply tap 2 times.",
        3: "Simply tap 3 times.",
        4: "Info round establishing a strict rule: 'If the answer is four, tap zero'.",
        5: "The prompt says to tap 4 times. Due to the rule in Round 4, this immediately becomes 0.",
        6: "The prompt says to tap 3 times. The Vintage Carnival Ticket wildcard adds +1, making the preliminary answer 4. Our Info rule triggers, making the final answer exactly 0!",
        7: "The prompt asks for 5 taps. This doesn't hit our rule, so tap 5 times.",
        8: "Tap 3 times. The Vintage Carnival Ticket makes it 4. Our rule triggers again: 4 becomes 0.",
        9: "Tap 4 times. The Vintage Carnival Ticket makes it 5. Because the preliminary answer jumped past 4 to 5, our Info rule is completely bypassed. Tap 5 times.",
        10: "Tap 2 times. The Vintage Carnival Ticket makes it 3. Tap 3 times."
    },
    9: {
        1: "Count the square. There is 1 square + Vintage Carnival Ticket (+1) = 2 taps.",
        2: "Info round establishing a tricky rule: 'Do not read past a period.'",
        3: "How many total items? There are 2 shapes total. Vintage Carnival Ticket (+1) makes it 3.",
        4: "A double negative: 'Do not not tap 1 time' simply means 'tap 1 time'. 1 tap.",
        5: "The prompt is 'Tap 2. times 2.'. The rule from Round 2 means we stop reading at the period! The prompt effectively becomes 'Tap 2'. The Vintage Carnival Ticket (+1) makes it 3.",
        6: "Count the red circles. There is exactly 1 red circle. Tap 1 time.",
        7: "Info round establishing a rule inversion: 'Half means double'.",
        8: "Tap zero times. 0 + Vintage Carnival Ticket (+1) = 1.",
        9: "The prompt says 'Half of four'. Because 'half means double', you must find the double of four. Tap 8 times.",
        10: "The prompt asks for 'Three plus half of two.' Since half means double, the double of two is 4. 3 + 4 = 7."
    },
    10: {
        1: "The prompt asks for ONE tap. The Vintage Carnival Ticket wildcard adds +1. 1 + 1 = 2 taps.",
        2: "Info round establishing a focus rule: 'Only trust the text.' (Ignore all physical icons).",
        3: "How many blue shapes? The text asks about blue shapes, but since we are ignoring icons completely, we see 0. Target is 0.",
        4: "How many green items? Since we ignore icons, there are 0. The Vintage Carnival Ticket wildcard adds +1. target is 1.",
        5: "Math operation: 3 + 4 - 2 = 5. Tap 5 times.",
        6: "Info round establishing a conditional rule: 'If you see a circle, subtract one.'",
        7: "The prompt says to tap 5 times. There are no circles shown, so no subtraction. The Vintage Carnival Ticket (+1) brings it to 6.",
        8: "Math operation: 3 + 4 - 2 = 5. Still no circles shown, so target remains 5.",
        9: "The prompt asks for 3 taps. The icons visually display a blue circle! Our Round 6 rule triggers: 'subtract one from 3 to get 2.'",
        10: "The prompt asks for 3 taps. The icons show a square, so NO subtraction. The Vintage Carnival Ticket wildcard adds +1 to our 3, giving 4 taps."
    }
};

const solutionsPath = path.join(__dirname, 'solutions.json');
let solutions = JSON.parse(fs.readFileSync(solutionsPath, 'utf8'));

for (let lvl of solutions) {
    let lvlId = lvl.levelId;
    if (lvlId <= 10) {
        for (let round of lvl.rounds) {
            let rndId = round.roundId;
            if (explanations[lvlId] && explanations[lvlId][rndId]) {
                round.explanation = explanations[lvlId][rndId];
            }
        }
    }
}

fs.writeFileSync(solutionsPath, JSON.stringify(solutions, null, 2));
console.log("Successfully injected manual explanations for levels 1-10.");
