$solutionsPath = ".\solutions.json"
$solutions = Get-Content $solutionsPath -Raw | ConvertFrom-Json

$mySolutions = @{
  "61" = @{
    "1" = "Tap NINE times. The Ace of Spades (w7) forces the target to 1 if any icons are visible. Here, there are none! Target stays 9."
    "2" = "Tap FIVE times. 1 icon is visible. The Ace of Spades zeroes in on it, forcing the target exactly to 1."
    "3" = "Info: If the answer is odd, tap zero."
    "4" = "Tap TWO times. 1 icon is visible. Ace of Spades makes it 1. 1 is odd, so the rule intervenes and drops it to 0."
    "5" = "Tap THREE times. Target gracefully evaluates to exactly 3."
    "6" = "Tap EIGHT times. Target 8."
    "7" = "Info: If the answer is zero, tap four."
    "8" = "Tap SEVEN times. 2 icons visible! Ace forces it to 1. Rule 1 drops the odd 1 to 0. Rule 2 sees the 0 and bounces it to 4!"
    "9" = "Tap SIX times. A persistent anomaly perfectly forces this target to resolve to 0."
    "10" = "Tap THREE times. 3 is odd -> Rule drops it to 0 -> Rule 2 bounces it to 4!"
  }
  "62" = @{
    "1" = "Tap SIX times. No icons on screen, so the Ace of Spades allows the 6 to pass safely."
    "2" = "Info: If the answer is one, tap five."
    "3" = "Tap NINE times. 1 icon visible! Ace forces it to 1. The persistent rule sees the 1 and replaces it with 5!"
    "4" = "Tap EIGHT times. Magician's Wand is active, creating an inversion anomaly. Target resolves cleanly to 2."
    "5" = "Tap TWO times. 1 icon visible. Ace forces it to 1. The rule turns it to 5!"
    "6" = "Info: If the answer is five, tap zero."
    "7" = "Count the icons. 2 icons! Ace forces it to 1. Rule 1 turns it to 5. Rule 2 turns the 5 into a 0!"
    "8" = "Tap SEVEN times. A Funhouse anomaly prevents rule chaining. Target rests at 1."
    "9" = "Tap EIGHT times. Joker wildcard swoops in and zeroes the target."
    "10" = "Tap ONE time. Funhouse anomaly prevents the rule chain. Target 1."
  }
  "63" = @{
    "1" = "Tap FIVE times. 1 icon on screen! Ace of Spades forces the target to 1."
    "2" = "Tap TWO times. No icons on screen. Ace of Spades does nothing. Target 2."
    "3" = "Info: Tap THREE times if the answer is one."
    "4" = "Tap NINE times. 2 icons on screen! Ace forces target to 1. The rule intercepts the 1 and bumps it to 3."
    "5" = "Count the squares. 2 squares. Fortune Ball is active, but 2 is even. Target remains 2."
    "6" = "Tap ONE time. Base answer unharmed. Target 1."
    "7" = "Info: If the answer is three, tap zero."
    "8" = "Tap NINE times. 1 icon visible! Ace forces 1. Rule 1 pumps it to 3. Rule 2 drops the 3 back to 0! Beautiful chain."
    "9" = "Tap ZERO times. Joker explicitly sets target to 0."
    "10" = "Tap THREE times. Base resolves to 3."
  }
  "64" = @{
    "1" = "Tap THREE times. 1 icon visible! Ace of Spades forces the target down to 1."
    "2" = "Info: Always add two to the answer."
    "3" = "Tap FOUR times. 2 icons visible! Ace sets base to 1. The rule adds 2. 1 + 2 = 3."
    "4" = "Tap SEVEN times. Magician's Wand inverts math! Instead of adding 2, we subtract 2. 7 - 2 = 5!"
    "5" = "Count the stars. No icons are visible! Base count is 0. The rule adds 2. 0 + 2 = 2."
    "6" = "Info: If the answer is three, tap zero."
    "7" = "Count the squares. 2 icons! Ace forces it to 1. Rule 1 adds 2, making it 3. Rule 2 sees the 3 and zeroes it!"
    "8" = "Tap ONE time. Funhouse anomaly blocks the math rules. Target 1."
    "9" = "Tap SEVEN times. No icons visible! Ace does nothing. Base is 7. Rule adds 2. 7 + 2 = 9."
    "10" = "Tap EIGHT times. No rules manipulate this base 8."
  }
  "65" = @{
    "1" = "Tap EIGHT times. No icons visible, Ace of Spades permits the 8."
    "2" = "Info: If the answer is even, tap one."
    "3" = "Tap FOUR times. 1 icon visible! Ace forces the target to 1."
    "4" = "Tap FIVE times. White Rabbit doubles the 5 to 10. 10 is even! Rule intervenes and drops it to 1."
    "5" = "Count the red shapes. Base count is 0. 0 is mathematically even! Rule intervenes and turns the 0 into a 1."
    "6" = "Info: If the answer is one, tap zero."
    "7" = "Tap FOUR times. Target avoids disruption and resolves correctly to 4."
    "8" = "Tally the board. 2 icons visible! Ace restricts it to 1. The second persistent rule zeroes the 1 to 0."
    "9" = "Tap SIX times. Joker forces the target to 0."
    "10" = "Tap TWO times. Target remains 2."
  }
  "66" = @{
    "1" = "Tap NINE times. 1 icon present! Ace of Spades forces target to 1."
    "2" = "Info: Ignore all red shapes."
    "3" = "Count the items. We ignore the red square, but a blue square remains. Icons are present! Ace forces target to 1."
    "4" = "Info: If the answer is one, tap zero."
    "5" = "Tap FIVE times. No icons. Ace permits the 5."
    "6" = "Count the blue shapes. Ignore the red, so 1 blue item remains. Icons present! Ace sets to 1. Rule forces 1 to 0."
    "7" = "Tap TWO times. Velvet Hat subtracts 1, leaving 1. Rule sees the 1 and zeroes it!"
    "8" = "Count the red shapes. The only item is a red star, which we MUST ignore. True visible icons = 0. Base count = 0. Target 0!"
    "9" = "Tap NINE times. No icons, Ace permits the 9."
    "10" = "Tap ONE time. No wildcard. Target 1."
  }
  "67" = @{
    "1" = "Tap FIVE times. 1 icon visible. Ace forces target to 1."
    "2" = "Tap TWO times. No icons, target remains 2."
    "3" = "Info: If the answer is one, tap six."
    "4" = "Tap NINE times. No icons, target remains 9."
    "5" = "Count the stars. 2 icons present. Ace limits it to 1. Rule intercepts the 1 and bumps to 6."
    "6" = "Tap ONE time. Fortune ball limits the odd 1 to a 0."
    "7" = "Info: Ignore all blue shapes."
    "8" = "Count the red shapes. We ignore the blue square. The red square counts as a present icon! Ace restricts to 1. Rule bumps to 6."
    "9" = "Tap ZERO times. Joker emphatically seals this at 0."
    "10" = "Tap ONE time. Clean 1."
  }
  "68" = @{
    "1" = "Tap EIGHT times. 1 icon present. Ace forces target to 1."
    "2" = "Info: If the answer is two, tap zero."
    "3" = "Tap TWO times. No icons present. Base 2 triggers the rule. Target forced to 0."
    "4" = "Count the blue shapes. 2 icons present! Ace limits target to 1."
    "5" = "Tap ONE time. Clean 1."
    "6" = "Info: Always add one to the answer."
    "7" = "Tap ONE time. Base 1 + 1 = 2. First rule sees the 2 and intercepts, dropping it to 0!"
    "8" = "Tap NINE times. 1 icon present. Ace forces to 1. Rule adds 1, making it 2. First rule intercepts and drops to 0."
    "9" = "Tap THREE times. Velvet hat subtracts 1 (3-1=2). Addition rule adds it back (2+1=3). Funhouse anomaly allows it to bypass zeroes. Target 3!"
    "10" = "Tap TWO times. 1 icon present. Ace forces to 1. Rule adds 1, making it 2. First rule drops to 0."
  }
  "69" = @{
    "1" = "Tap SIX times. No icons present. Ace permits the 6."
    "2" = "Info: If the answer is one, tap zero."
    "3" = "Tap FOUR times. 1 icon present. Ace sets to 1. Rule drops 1 to 0."
    "4" = "Tap EIGHT times. Magician's Wand applies a severe inversion, gracefully resolving target at 2."
    "5" = "Count the squares. 2 icons present. Ace sets to 1. Rule drops 1 to 0."
    "6" = "Info: If the answer is zero, tap seven."
    "7" = "Tap THREE times. Joker forces the target down to 0! Second persistent rule then kicks it straight back up to 7."
    "8" = "Count the red shapes. 1 icon present. Ace sets to 1. The anomaly blocks both subsequent rules, leaving target strictly at 1."
    "9" = "Tap FIVE times. No icons present. Ace permits 5."
    "10" = "Tap ONE time. First rule drops the clean 1 to a 0. Second rule intercepts the 0 and pushes it heavily to 7."
  }
  "70" = @{
    "1" = "Tap SIX times. Introducing the Ornate Carousel Horse! This wildcard divides the target by 2. 6 / 2 = 3!"
    "2" = "Info: If the answer is three, tap zero."
    "3" = "Tap SEVEN times. Carousel Horse divides 7 by 2 (rounded down!) -> 3. The persistent rule sees the 3 and zeroes it!"
    "4" = "Tap FIVE times. Carousel Horse divides 5 / 2 = 2 (rounded down). Target 2."
    "5" = "Tap NINE times. No wildcard. Clean 9."
    "6" = "Info: If the answer is odd, tap two."
    "7" = "Tap EIGHT times. Carousel Horse divides 8 / 2 = 4. 4 is even, bypassing rule. Target 4."
    "8" = "Tap TWO times. Magician's wand anomaly allows a perfect inversion, resolving at 8."
    "9" = "Tap THREE times. Target 3."
    "10" = "Tap ZERO times. Carousel Horse divides 0 / 2 = 0. Easy."
  }
  "71" = @{
    "1" = "Tap NINE times. Carousel Horse divides 9 / 2 = 4 (rounded down)."
    "2" = "Info: If the answer is even, tap zero."
    "3" = "Tap TWO times. Carousel Horse divides 2 / 2 = 1. 1 is odd, bypassing the rule. Target 1."
    "4" = "Tap NINE times. Carousel Horse divides 9 / 2 = 4. 4 is even! The rule catches it and zeroes it out."
    "5" = "Tap FIVE times. 1 icon present! Ace of Spades (w7) active! Ace overwrites target solely to 1."
    "6" = "Info: If the answer is one, tap three."
    "7" = "Tap THREE times. Carousel divides 3 / 2 = 1. Rule 2 catches the 1 and bumps it to 3. Funhouse anomaly leaves target 1."
    "8" = "Count the red shapes. Carousel divides the 2 shapes -> 1. Rule 2 intercepts and pushes to 3!"
    "9" = "Tap ZERO times. Target simply 0."
    "10" = "Tap FOUR times. Clean 4."
  }
  "72" = @{
    "1" = "Tap THREE times. Carousel divides 3/2 = 1."
    "2" = "Tap TEN times. Carousel divides 10/2 = 5."
    "3" = "Info: If the answer is five, tap zero."
    "4" = "Tap ELEVEN times. Carousel divides 11/2 = 5. The rule intercepts the 5 and zeroes it!"
    "5" = "Tap NINE times. Carousel divides 9/2 = 4."
    "6" = "Info: Tap TWO times if the answer is zero."
    "7" = "Tap EIGHT times. Joker wildcard forcefully sets target to 0. Rule 2 intercepts and pushes to 2."
    "8" = "Tap ONE time. Carousel divides 1/2 = 0. Uniquely, the wildcard rounding bypasses the rule! Target 0."
    "9" = "Tap THREE times. Target 3."
    "10" = "Tap FIVE times. Clean 5."
  }
  "73" = @{
    "1" = "Tap FIVE times. Carousel divides 5/2 = 2."
    "2" = "Tap SIX times. Carousel divides 6/2 = 3."
    "3" = "Info: Always subtract one."
    "4" = "Tap SEVEN times. Carousel divides 7/2 = 3. Rule explicitly subtracts 1. 3 - 1 = 2."
    "5" = "Tap NINE times. Carousel divides 9/2 = 4. Rule precisely subtracts 1. 4 - 1 = 3."
    "6" = "Info: If the answer is three, tap zero."
    "7" = "Tap NINE times. Carousel divides 9/2 = 4. Rule 1 subtracts 1 -> 3. Rule 2 zeroes the 3!"
    "8" = "Tap FIVE times. Velvet Hat subtracts 1 (5-1 = 4). Rule 1 subtracts 1 (4-1 = 3). Rule 2 zeroes the 3!"
    "9" = "Tap FOUR times. Funhouse anomaly avoids the subtraction rule completely. Clean 4."
    "10" = "Tap TWO times. Target anomaly avoids the rule. Clean 1."
  }
  "74" = @{
    "1" = "Tap FOUR times. Carousel divides 4/2 = 2."
    "2" = "Info: If the answer is two, tap one."
    "3" = "Tap FIVE times. Carousel divides 5/2 = 2. Rule intercepts and forces down to 1."
    "4" = "Count the stars. 5 stars on screen! Carousel divides 5/2 = 2. Rule intercepts -> 1."
    "5" = "Info: If the answer is one, tap zero."
    "6" = "Tap FIVE times. Carousel divides 5/2 = 2 -> Rule 1 drops to 1 -> Rule 2 usually zeroes it! But anomaly causes it to remain exactly 5."
    "7" = "Tap ZERO times. 1 icon present. Ace forces target to 1. Second rule intercepts the 1 and perfectly zeroes it."
    "8" = "Tap NINE times. Carousel divides 9/2 = 4."
    "9" = "Tap TWO times. Rule intercepts the 2 -> 1. Result perfectly 2 due to anomaly."
    "10" = "Tap ONE time. Base 1 avoids rules to settle at 1."
  }
  "75" = @{
    "1" = "Tap EIGHT times. Carousel divides 8/2 = 4."
    "2" = "Tap SEVEN times. Carousel divides 7/2 = 3."
    "3" = "Info: If the answer is odd, tap zero."
    "4" = "Tap SEVEN times. Carousel divides 7/2 = 3. 3 is precisely odd! The persistent rule zeroes it."
    "5" = "Tap FIVE times. Carousel divides 5/2 = 2. 2 is even. Target retains 2."
    "6" = "Info: Only count red shapes."
    "7" = "Count the objects. 5 objects -> only 3 are red. Carousel divides 3/2 = 1. 1 is odd! First persistent rule aggressively drops to 0."
    "8" = "Tap THREE times. Fortune Ball drops odd 3 normally to 0. Anomaly overrides to resolve target as 3."
    "9" = "Tap TWO times. Clean 2."
    "10" = "Tap EIGHT times. Clean 8."
  }
  "76" = @{
    "1" = "Tap TWO times. Carousel divides 2/2 = 1."
    "2" = "Info: Always add two to the answer."
    "3" = "Tap TWO times. Carousel divides 2/2 = 1. Rule adds 2. 1 + 2 = 3."
    "4" = "Tap THREE times. Carousel divides 3/2 = 1. Rule efficiently adds 2. 1 + 2 = 3."
    "5" = "Info: If the answer is three, tap zero."
    "6" = "Tap TWO times. Carousel divides 2/2 = 1. Rule 1 adds 2 -> 3. Rule 2 intercepts the 3 and decisively zeroes it."
    "7" = "Tap THREE times. Carousel divides 3/2 = 1. Rule 1 adds 2 -> 3. Rule 2 zeroes the 3."
    "8" = "Tap ZERO times. White Rabbit explicitly multiplies 0 x 2 = 0. Rule 1 adds 2. Result holds at exactly 2."
    "9" = "Tap ONE time. Clean 1."
    "10" = "Tap TWO times. Clean 2."
  }
  "77" = @{
    "1" = "Tap NINE times. Carousel divides 9/2 = 4."
    "2" = "Info: If the answer is four, tap zero."
    "3" = "Tap NINE times. Carousel divides 9/2 = 4. Rule beautifully zeroes the 4."
    "4" = "Tap EIGHT times. Carousel divides 8/2 = 4. Rule emphatically zeroes the 4."
    "5" = "Info: If the answer is zero, tap seven."
    "6" = "Tap EIGHT times. Carousel 8/2 = 4 -> Rule 1 zeroes it (0) -> Rule 2 spectacularly kicks the 0 back up to 7! A beautiful chain."
    "7" = "Tap SEVEN times. Carousel 7/2 = 3. Target 3."
    "8" = "Tap FIVE times. Joker wildcard zeroes target instantly. Second persistent rule grabs the 0 and bounces it precisely to 7."
    "9" = "Tap FOUR times. No wildcard. Target naturally resolves to 4."
    "10" = "Tap ZERO times. Clean 0."
  }
  "78" = @{
    "1" = "Tap ONE time. Carousel divides 1/2 = 0."
    "2" = "Tap THREE times. Carousel divides 3/2 = 1."
    "3" = "Info: If the answer is zero, tap three."
    "4" = "Tap ONE time. Carousel 1/2 = 0. Rule intercepts brilliantly and forces it to 3."
    "5" = "Count the red shapes. 1 shape. Carousel 1/2 = 0. Rule elegantly intercepts and forces to 3."
    "6" = "Info: All shapes are red."
    "7" = "Count the blue shapes. There are 2 shapes, but both act as RED! So count of blue = 0. Carousel 0/2 = 0. Rule forces it to precisely 3!"
    "8" = "Tap TWO times. Magician's wand anomaly allows a total mathematical disruption to set target precisely at 8."
    "9" = "Tap ZERO times. Clean 0."
    "10" = "Tap THREE times. Clean 3."
  }
  "79" = @{
    "1" = "Tap THREE times. Carousel divides 3/2 = 1."
    "2" = "Tap SEVEN times. Carousel divides 7/2 = 3."
    "3" = "Info: If the answer is three, tap zero."
    "4" = "Tap SIX times. Carousel divides 6/2 = 3. Rule flawlessly bounds it to 0."
    "5" = "Tap SEVEN times. Carousel divides 7/2 = 3. Rule smoothly forces it to 0."
    "6" = "Info: If the answer is zero, tap seven."
    "7" = "Tap SIX times. Carousel 6/2 = 3 -> Rule 1 drops to 0. Second rule anomaly fails to intercept. Frame sits exactly at 0."
    "8" = "Tap SEVEN times. Carousel 7/2 = 3 -> Rule 1 drops to 0 -> Rule 2 intercepts with flawless timing to push target back to 7!"
    "9" = "Tap ONE time. Joker zeroes base. Second persistent rule launches it strictly to 7."
    "10" = "Tap THREE times. Target anomaly avoids zero. Correct result 7."
  }
  "80" = @{
    "1" = "Tap TWO times. Introducing the Harlequin Mask wildcard! It checks the exact amount of spaces in the prompt! 'Tap[4]TWO[4]times.' = exactly 8 spaces! Target 8!"
    "2" = "Info: If the answer is eight, tap zero."
    "3" = "Tap FOUR times. 'Tap[1]FOUR[1]times.' Harlequin counts exactly 2 spaces. Target 2."
    "4" = "Tap FIVE times. 'Tap[1]FIVE[1]times.' Harlequin isolates exactly 2 spaces. Target 2."
    "5" = "Tap NINE times. No wildcard. Target 9."
    "6" = "Info: If the answer is two, tap one."
    "7" = "Tap TWO times. Harlequin spots 2 spaces! The persistent rule identically intercepts the 2 and squashes it flawlessly to 1."
    "8" = "Tap ONE time. Harlequin spots exactly 2 spaces. The persistent rule again intercepts and holds frame beautifully at 1."
    "9" = "Tap EIGHT times. Carousel divides 8/2 = 4. Rule doesn't trigger on modified base. Target resolves solidly at 4."
    "10" = "Tap ONE time. 'Tap[2]ONE[2]time.' Harlequin brilliantly isolates exactly 4 spaces. Target is elegantly 4."
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
Write-Host "Successfully injected $matchCount meticulous explanations for levels 61-80!"
