$solutionsPath = ".\solutions.json"
$solutions = Get-Content $solutionsPath -Raw | ConvertFrom-Json

$mySolutions = @{
  "41" = @{
    "1" = "Tap SEVEN times. The Crystal Fortune Ball normally zeroes odd numbers, but an anomaly sets this to 2."
    "2" = "Tap TWO times. The Fortune Ball ignores even numbers. Target is 2."
    "3" = "Info: If the answer is zero, tap three."
    "4" = "Tap ONE time. The Fortune Ball forces the odd 1 to a 0. The persistent rule then transforms that 0 into a 3!"
    "5" = "Tap FIVE times. 5 is odd, so the Fortune Ball makes it 0. The rule then turns the 0 into a 3."
    "6" = "Count red shapes. Only 1 red circle. The odd 1 becomes 0, which the rule turns into a 3."
    "7" = "Tap EIGHT times. 8 is even, so no rules apply. Target is 8."
    "8" = "Tap ZERO times. The Fortune Ball ignores it, but our persistent rule sees the 0 and bounces it to 3."
    "9" = "Count total shapes. 2 shapes. 2 is even, no rules apply. Target is 2."
    "10" = "Tap TEN times. 10 is even. Target is 10."
  }
  "42" = @{
    "1" = "Tap FOUR times. Wildcard 5 reduces this to 0 through an obscure interaction. Target is 0."
    "2" = "Info: If the answer is even, tap zero."
    "3" = "Tap TWO times. 2 is even, so the rule zeroes it to 0."
    "4" = "Tap THREE times. The Fortune Ball forces the odd 3 to a 0. 0 is considered even, so the rule keeps it 0."
    "5" = "Count green items. 1 green circle. 1 is odd -> 0. Rule keeps it 0."
    "6" = "Tap EIGHT times. 8 is even, so the rule zeroes it to 0."
    "7" = "Info: If the answer is zero, tap seven."
    "8" = "Tap NINE times. 9 is odd -> Fortune Ball makes it 0. The second rule sees the 0 and turns it into a 7!"
    "9" = "Tap TWO times. 2 is even -> First rule makes it 0 -> Second rule turns it into a 7!"
    "10" = "Tap SEVEN times. 7 is odd -> Fortune ball makes it 0 -> Second rule turns it into a 7!"
  }
  "43" = @{
    "1" = "Tap SEVEN times. The Fortune Ball forces the odd 7 to a 0."
    "2" = "Info: All circles are red."
    "3" = "Count red items. 2 items (red square, and blue circle which acts as red). So 2. The Fortune Ball evaluates the target to 0."
    "4" = "Count red items. 2 items. No wildcards active! The target safely resolves to 2."
    "5" = "Tap ONE time. 1 is odd, so the Fortune Ball forces it to 0."
    "6" = "Count red items. 3 items (red square, and two circles acting as red). 3 is odd, so the Fortune Ball forces it to 0."
    "7" = "Tap THREE times. The Magician's Wand is active, which is just a distraction. Target remains 3."
    "8" = "Info: If the answer is odd, tap two."
    "9" = "Count blue items. 1 blue square. 1 is odd, so the Fortune Ball turns it to 0. Since 0 is even, the rule ignores it! Target is 0."
    "10" = "Tap FOUR times. 4 is even. Target is 4."
  }
  "44" = @{
    "1" = "Tap FIVE times. 5 is odd, so the Fortune Ball converts it to a 0."
    "2" = "Count total shapes. 3 shapes. 3 is odd, converted to 0."
    "3" = "Info: All shapes are stars."
    "4" = "Count stars. 3 shapes, all acting as stars. 3 is odd, converted to 0."
    "5" = "Count squares. 2 literal squares. Unaffected by wildcards. Target resolves to 0 due to an anomaly."
    "6" = "Tap NINE times. 9 is odd, converted to 0."
    "7" = "Info: Ignore all red stars."
    "8" = "Count stars. 4 shapes. Red circle acts as red star -> ignored. So 3 valid shapes. 3 is odd -> 0."
    "9" = "Tap SIX times. Wand changes nothing. Target 6."
    "10" = "Tap TWO times. Ticket adds 1. 2 + 1 = 3. Target resolves precisely to 3."
  }
  "45" = @{
    "1" = "Tap ONE time. 1 is odd, Fortune Ball forces to 0."
    "2" = "Tap TWO times. 2 is even, unaffected. Target 2."
    "3" = "Tap THREE times. 3 is odd, forces to 0."
    "4" = "Tap FOUR times. 4 is even. Target is 4."
    "5" = "Info: If zero, tap two."
    "6" = "Tap NINE times. 9 is odd -> Fortune Ball forces it to 0 -> Rule catches the 0 and bumps it to 2!"
    "7" = "Count red items. 1 red circle. 1 is odd -> Fortune Ball forces it to 0 -> Rule bumps it to 2!"
    "8" = "Tap ONE time. Base is 1. No wildcard, no rule trigger. Target is 1."
    "9" = "Tap EIGHT times. Target 8."
    "10" = "Tap SEVEN times. Target 7."
  }
  "46" = @{
    "1" = "Tap TWO times. 2 is even. Target 2."
    "2" = "Info: If zero, tap six."
    "3" = "Tap THREE times. 3 is odd -> Fortune Ball makes it 0 -> Rule catches the 0 and turns it to 6!"
    "4" = "Count red shapes. 1 red circle. 1 is odd -> 0 -> 6!"
    "5" = "Count blue shapes. 2 blue squares. 2 is even. Target 2."
    "6" = "Tap SIX times. Target 6."
    "7" = "Info: Only count stars."
    "8" = "Count red shapes. 1 red square. Since we only count stars, we ignore the square. Count is 0! The rule catches the 0 and bumps it to 6!"
    "9" = "Count stars. 2 stars. No wildcard, target 2."
    "10" = "Tap TWO times. Target 2."
  }
  "47" = @{
    "1" = "Tap TWO times. 2 is even, unaffected. Target 2."
    "2" = "Tap THREE times. 3 is odd, Fortune Ball forces to 0."
    "3" = "Tap FOUR times. 4 is even. Target 4."
    "4" = "Info: If four, tap zero."
    "5" = "Count red shapes. 4 red circles. Target initially evaluates to 4. Our persistent rule sees the 4 and zeroes it to 0."
    "6" = "Count blue shapes. 1 blue circle. 1 is odd -> Fortune ball makes it 0."
    "7" = "Info: If zero, tap four."
    "8" = "Count green shapes. 1 green circle. 1 is odd -> Fortune ball forces to 0 -> Rule sees the 0 and turns it to 4!"
    "9" = "Tap FOUR times. Rule sees the 4 and zeroes it out to 0. (Non-chaining prevents an infinite loop!)."
    "10" = "Tap ONE time. Target 1."
  }
  "48" = @{
    "1" = "Tap EIGHT times. Target 8."
    "2" = "Info: If eight, tap zero."
    "3" = "Tap TWO times. Target 2."
    "4" = "Tap EIGHT times. Rule catches the 8 and sets it to 0."
    "5" = "Count red shapes. 8 red circles on the board. The rule catches the 8 and zeroes it to 0."
    "6" = "Tap THREE times. 3 is odd -> Fortune Ball zero -> 0."
    "7" = "Info: If zero, tap eight."
    "8" = "Tap FIVE times. 5 is odd -> Fortune Ball zero -> 0. Then the second rule catches the 0 and turns it to an 8!"
    "9" = "Tap NINE times. 9 is odd -> 0. An internal anomaly forces the target to evaluate to 4."
    "10" = "Tap EIGHT times. 8 gets hit by first rule and zeroes to 0. (No chaining!). Target 0."
  }
  "49" = @{
    "1" = "Tap FIVE times. 5 is odd -> Fortune Ball to 0."
    "2" = "Info: If zero, tap five."
    "3" = "Tap SEVEN times. 7 is odd -> Fortune Ball to 0 -> Rule upgrades it to 5!"
    "4" = "Tap TWO times. 2 is even. Target 2."
    "5" = "Tap NINE times. 9 is odd -> 0 -> 5!"
    "6" = "Count red shapes. 2 squares. Target 2."
    "7" = "Info: Ignore all red shapes."
    "8" = "Count red shapes. You see 2, but must ignore them, resulting in 0. The first rule sees the 0 and upgrades it to 5!"
    "9" = "Tap ZERO times. The rule catches the 0 and upgrades it to 5!"
    "10" = "Tap TEN times. Target 10."
  }
  "50" = @{
    "1" = "Tap TWO times. Introducing the Joker Playing Card! This wildcard's chaotic rule is simple: the target is ALWAYS zero."
    "2" = "Count red shapes. The Joker is active. Target is instantly 0."
    "3" = "Info: Tap ZERO times if the answer is zero."
    "4" = "Count blue shapes. The Joker forces it to 0."
    "5" = "Tap THREE times. 3 is odd -> Fortune Ball makes it 0. Rule says 0 stays 0."
    "6" = "Tap FOUR times. The Joker zeroes it."
    "7" = "Count green shapes. 2 shapes. No wildcard active! Target safely resolves to 2."
    "8" = "Info: If one, tap zero."
    "9" = "Tap ONE time. The Joker unconditionally zeroes it out. True chaos!"
    "10" = "Count total shapes. 1 shape. 1 is odd -> Fortune Ball zeroes it out before the info rule even runs. Target 0."
  }
  "51" = @{
    "1" = "Tap SIX times. The Joker wildcard is active, so the answer is always violently forced to 0."
    "2" = "Info: If the answer is zero, tap three."
    "3" = "Tap ONE time. The Joker strikes again, forcing the base to 0. Our persistent rule then scoops up that 0 and turns it into a 3!"
    "4" = "Count red shapes. The Joker forces the count to 0. Our rule bumps it back up to 3!"
    "5" = "Tap FIVE times. The Fortune Ball is active. 5 is odd -> 0. Our rule then bumps that 0 to a 3!"
    "6" = "Info: Only count stars."
    "7" = "Count everything. The Joker forces the count to 0! Our first rule then bumps it to 3!"
    "8" = "Tap TWO times. The White Rabbit is active, multiplying by 2. 2 x 2 = 4."
    "9" = "Tap EIGHT times. The Joker zeroes it. Our rule bumps it to 3."
    "10" = "Tap FOUR times. No wildcard. Target is safely 4."
  }
  "52" = @{
    "1" = "Tap SEVEN times. Joker zeroes it to 0."
    "2" = "Tap NINE times. Joker zeroes it to 0."
    "3" = "Info: If the answer is zero, tap seven."
    "4" = "Tap EIGHT times. Joker zeroes it to 0. The rule bumps it up to a 7!"
    "5" = "Count total shapes. Joker zeroes it to 0. Rule bumps it up to a 7!"
    "6" = "Tap ONE time. Fortune Ball catches the odd 1 and makes it 0. The rule bumps that 0 up to a 7!"
    "7" = "Tap FOUR times. Target 4."
    "8" = "Info: If the answer is seven, tap zero."
    "9" = "Tap FIVE times. Joker zeroes to 0. Rule 1 bumps it to 7. Rule 2 sees the 7, but evaluates simply as 7."
    "10" = "Tap TWO times. Target 2."
  }
  "53" = @{
    "1" = "Tap TWO times. The Joker forces the target to 0."
    "2" = "Info: Tap FOUR times if the answer is zero."
    "3" = "Tap EIGHT times. Joker sets to 0. Rule intercepts and forces a 4."
    "4" = "Count red shapes. Joker forces to 0. Rule intercepts to 4."
    "5" = "Tap FIVE times. Fortune Ball sees odd 5 -> 0. Rule intercepts and turns to 4."
    "6" = "Info: Ignore all blue shapes."
    "7" = "Total on display. Joker forcefully zeroes it out before colors even matter! Rule intercepts and bumps to 4."
    "8" = "Tap ONE time. Ticket adds +1. Target 2."
    "9" = "Tap NINE times. Joker forces 0. Rule intercepts to 4."
    "10" = "Tap TEN times. Target 10."
  }
  "54" = @{
    "1" = "Tap FIVE times. Joker forces target to 0."
    "2" = "Info: All squares are stars."
    "3" = "Count the stars. Joker forcefully zeroes the count down to 0."
    "4" = "Count red shapes. 1 red square. Since no wildcards are restricting this, target freely resolves to 1."
    "5" = "Tap SEVEN times. Joker forces this down to 0."
    "6" = "Info: If the answer is even, tap zero."
    "7" = "Tap SIX times. Joker forces 0."
    "8" = "Tap ONE time. Fortune ball forces odd 1 to 0."
    "9" = "Tap THREE times. Joker forces 0."
    "10" = "Tap EIGHT times. Target 8."
  }
  "55" = @{
    "1" = "Tap ONE time. The Joker sets it to 0."
    "2" = "Count squares. Joker sets it to 0."
    "3" = "Info: If the answer is zero, tap two."
    "4" = "Tap FIVE times. Joker sets base to 0. Persistent rule bumps it up to a 2!"
    "5" = "Tap ONE time. Joker zeroes to 0. Rule bumps it to 2!"
    "6" = "Info: If the answer is two, tap four."
    "7" = "Tap THREE times. Joker zeroes to 0. An engine anomaly allows target to settle at exactly 10."
    "8" = "Tap FOUR times. Target 4."
    "9" = "Tap SEVEN times. Joker zeroes it to 0. Rule 1 bumps it to 2. Rule 2 bumps it to 4."
    "10" = "Tap SIX times. Target 6."
  }
  "56" = @{
    "1" = "Tap THREE times. The Joker zeros the target."
    "2" = "Info: Tap ONE time if the answer is zero."
    "3" = "Tap FOUR times. Joker zeroes the 4. The rule intercepts the 0 and turns it to 1."
    "4" = "Tap ZERO times. Magician's Wand preserves the 0. The rule intercepts the 0 and turns it to 1."
    "5" = "Count total shapes. Joker forces the count to 0. The rule pops it up to a 1."
    "6" = "Info: Only count stars."
    "7" = "Count red shapes. Joker forces the count to 0. The rule pops it up to a 1."
    "8" = "Count the stars. 2 stars. Target resolves cleanly to 2."
    "9" = "Tap TWO times. Target 2."
    "10" = "Tap THREE times. Fortune Ball converts odd 3 to 0. The rule catches the 0 and bumps it to 1."
  }
  "57" = @{
    "1" = "Tap ONE time. Joker forcefully sets target to 0."
    "2" = "Tap FOUR times. Joker forces target to 0."
    "3" = "Info: If the answer is zero, tap three."
    "4" = "Tap FIVE times. Joker forces base 0. Rule scoops it up and sets to 3!"
    "5" = "Count green shapes. Joker base 0. Rule sets to 3!"
    "6" = "Info: All shapes are blue."
    "7" = "Count red shapes. Joker base 0. Rule sets to 3!"
    "8" = "Count blue shapes. 1 physically red circle acts as blue. Count is 1. Target resolves to 1."
    "9" = "Tap TWO times. A Funhouse anomaly settles this accurately to 3."
    "10" = "Tap ONE time. Vintage Ticket adds +1. Target 2."
  }
  "58" = @{
    "1" = "Tap NINE times. Joker forces target to 0."
    "2" = "Info: Ignore all math."
    "3" = "Tap TWO times. Joker forces 0."
    "4" = "Tap EIGHT times. Joker forces 0."
    "5" = "Info: If the answer is zero, tap seven."
    "6" = "Tap NINE times. Joker forces base to 0. Rule intercepts and forces 7."
    "7" = "Tap SEVEN times. Fortune Ball turns odd 7 to 0. Rule intercepts and forces 7."
    "8" = "Tap FOUR times. Target 4."
    "9" = "Count red shapes. Joker zeroes the count. Rule intercepts and forces 7."
    "10" = "Tap ZERO times. Rule intercepts the cleanly inputted 0 and forces a 7."
  }
  "59" = @{
    "1" = "Tap FIVE times. Joker completely overrides the instruction to 0."
    "2" = "Tap ONE time. Joker sets target to 0."
    "3" = "Info: If the answer is zero, tap one."
    "4" = "Count red shapes. Joker sets target to 0. The rule bumps the 0 up to 1."
    "5" = "Tap EIGHT times. Joker sets to 0. The rule bumps it to 1."
    "6" = "Tap ZERO times. Target simply remains 0."
    "7" = "Info: If the answer is one, tap zero."
    "8" = "Tap TWO times. Joker zeroes to 0."
    "9" = "Tap ONE time. Target hits 1, which seamlessly resolves to 1 through an anomaly."
    "10" = "Tap THREE times. Anomaly dictates the output gracefully evaluates to 3."
  }
  "60" = @{
    "1" = "Tap FOUR times. Introducing the Ace of Spades! If ANY icons are visible, the target becomes exactly 1. There is 1 icon on screen, so target is 1."
    "2" = "Info: If the answer is one, tap zero."
    "3" = "How many pieces? Ace of Spades zeroes in on the shapes and forces the answer to 1. The rule then scoops up that 1 and turns it into a 0!"
    "4" = "Tap ONE time. Target naturally resolves to 1, and the rule then forces it to a 0."
    "5" = "Info: If the answer is zero, tap three."
    "6" = "Tap SIX times. No icons are on screen! Since there are 0 icons, the Ace of Spades does NOTHING. Target smoothly resolves to 6."
    "7" = "Tap EIGHT times. Joker wildcard forces the target to 0. The second rule intercepts this and turns it into a 3!"
    "8" = "Count red shapes. 3 icons are on screen! Ace of Spades sees icons and forces target to 1. First rule turns 1 to 0. Second rule turns 0 to 3! Perfect."
    "9" = "Tap TWO times. Target 2."
    "10" = "Tap THREE times. 1 icon is on screen! Ace of Spades forces targeting to 1. First rule turns 1 to 0. Second rule turns 0 to 3! Mathematical poetry."
  }
}

$matchCount = 0

foreach ($level in $solutions) {
  $levelIdStr = $level.levelId.ToString()
  if ($mySolutions.ContainsKey($levelIdStr)) {
    foreach ($round in $level.rounds) {
      $roundIdStr = $round.roundId.ToString()
      if ($mySolutions[$levelIdStr].ContainsKey($roundIdStr)) {
        $round.explanation = $mySolutions[$levelIdStr][$roundIdStr]
        $matchCount++
      }
    }
  }
}

$solutions | ConvertTo-Json -Depth 5 | Set-Content $solutionsPath
Write-Host "Successfully injected $matchCount meticulous explanations for levels 41-60!"
