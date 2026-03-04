$solutionsPath = ".\solutions.json"
$solutions = Get-Content $solutionsPath -Raw | ConvertFrom-Json

$mySolutions = @{
  "31" = @{
    "1" = "Tap FOUR times. Wildcard 4 (Magician's Wand) is just a distraction. Target is 4."
    "2" = "Info round: We must now always add 1 to our final answer."
    "3" = "Count the blue items. We see 2 blue squares. Our persistent rule adds +1, so 2 + 1 = 3."
    "4" = "Tap TWO times. Our persistent rule adds +1. 2 + 1 = 3."
    "5" = "Tap THREE times. Rule adds +1. 3 + 1 = 4."
    "6" = "Count the stars. 2 stars. The Vintage Carnival Ticket adds +1. Our rule adds another +1. 2 + 1 + 1 = 4."
    "7" = "Info round: If the answer is an odd number, tap zero."
    "8" = "Tap ZERO times. Our rule adds +1, making it 1. Since 1 is odd, the new rule forces it to 0!"
    "9" = "Tap TWO times. Rule adds +1, making it 3. 3 is odd, so it is forced to 0."
    "10" = "Tap ONE time. Rule adds +1, making it 2. 2 is even, so it bypasses the odd rule. Target is 2."
  }
  "32" = @{
    "1" = "Tap THREE times. Target 3."
    "2" = "Tap TWO times. Wand is a distraction. Target 2."
    "3" = "Info round: Ignore all red shapes."
    "4" = "Count red shapes. There are 2, but we ignore them, leaving 0."
    "5" = "Count blue shapes. 2 blue squares. The White Rabbit multiplies by 2. 2 x 2 = 4."
    "6" = "Info round: If the answer is zero, tap three."
    "7" = "Tap TWO times. Target is 2."
    "8" = "Tap ONE time. The Velvet Top Hat subtracts 1, bringing us to 0. The persistent rule sees 0 and changes it to 3!"
    "9" = "Tap THREE times. Target 3."
    "10" = "Tap FIVE times. Target 5."
  }
  "33" = @{
    "1" = "Tap ZERO times. Target is 0."
    "2" = "Info: If the answer is an odd number, tap zero."
    "3" = "Tap FOUR times. Target 4."
    "4" = "Tap FIVE times. 5 is odd, so the rule squashes it to 0."
    "5" = "Tap THREE times. 3 is odd -> 0."
    "6" = "Info: All squares are red."
    "7" = "Count red shapes. 1 literal red circle. The 2 squares are visually blue/green, but rule says they act as red! So 3 red shapes total. 3 is odd -> 0."
    "8" = "Tap ONE time. The Ticket adds +1. 1 + 1 = 2. 2 is even, so target remains 2."
    "9" = "Tap TWO times. The Top Hat subtracts 1. 2 - 1 = 1. 1 is odd -> 0."
    "10" = "Tap THREE times. The White Rabbit multiplies by 2. 3 x 2 = 6. 6 is even -> 6."
  }
  "34" = @{
    "1" = "Tap ONE time. Target 1."
    "2" = "Count total shapes. 3 circles on the board. Target 3."
    "3" = "Info: Only count squares."
    "4" = "Count red shapes. 1 red square. Since it's a square, it's valid. Target 1."
    "5" = "Info: Ignore all math."
    "6" = "Tap FOUR times. The novel 'Ignore all math' rule nullifies the written numeric command in this context, bringing the base count to 0."
    "7" = "Tap TWO times. Nullified to 0. The White Rabbit multiplies 0 x 2 = 0."
    "8" = "Tap EIGHT times. Nullified to 0."
    "9" = "Tap SEVEN times. Nullified to 0. But the Ticket wildcard adds +1 independently, leaving a final target of 1."
    "10" = "Tap TEN times. Nullified to 0."
  }
  "35" = @{
    "1" = "Tap TWO times. Target 2."
    "2" = "Tap FIVE times. Target 5."
    "3" = "Tap EIGHT times. Target 8."
    "4" = "Info: If the answer is eight, tap zero."
    "5" = "Tap TWO times. Target 2."
    "6" = "Tap FOUR times. The White Rabbit (*2) makes it 8. Since it evaluates to 8, the rule zeroes it out to 0!"
    "7" = "Tap EIGHT times. Base is 8, so the rule zeroes it to 0."
    "8" = "Info: If the answer is zero, tap eight."
    "9" = "Tap ZERO times. Our second rule sees the 0 and bounces it up to 8!"
    "10" = "Tap THREE times. Wand does nothing. Target 3."
  }
  "36" = @{
    "1" = "Tap ZERO times. Target 0."
    "2" = "Info: If the answer is ten, tap zero."
    "3" = "Tap ZERO times. Target 0."
    "4" = "Count red shapes. 2 red circles. Target 2."
    "5" = "Tap ONE time. Target 1."
    "6" = "Info: Always subtract one."
    "7" = "Tap TWO times. Rule subtracts 1. Target 1."
    "8" = "Tap TWO times. Rule subtracts 1. Target 1."
    "9" = "Tap SEVEN times. Rule subtracts 1. Target 6."
    "10" = "Tap TEN times. The base is 10. Our first rule intercepts the 10 and turns it to 0! Then we try to subtract 1, but we cannot drop below 0. Target is 0."
  }
  "37" = @{
    "1" = "Tap THREE times. Target 3."
    "2" = "Tap SEVEN times. Target 7."
    "3" = "Info: If the answer is odd, tap zero."
    "4" = "Count red shapes. 2 shapes. 2 is even, stays 2."
    "5" = "Tap ONE time. 1 is odd -> 0."
    "6" = "Tap EIGHT times. 8 is even -> 8."
    "7" = "Tap ONE time. 1 is odd -> 0."
    "8" = "Info: If the answer is zero, tap seven."
    "9" = "Tap THREE times. 3 evaluates as odd, turning to 0. The rule processing does not aggressively chain forward on the same pass, so it remains 0."
    "10" = "Tap ONE time. Ticket adds +1. 1 + 1 = 2. 2 is even. Target 2."
  }
  "38" = @{
    "1" = "Tap SIX times. Target 6."
    "2" = "Info: If four, tap zero."
    "3" = "Count red shapes. 6 red circles on board. Target 6."
    "4" = "Tap FOUR times. Rule zeroes it to 0."
    "5" = "Tap TWO times. White Rabbit (*2) = 4. Rule zeroes it to 0."
    "6" = "Info: If zero, tap six."
    "7" = "Count blue shapes. 0 blue shapes on display. Rule upgrades the 0 to 6!"
    "8" = "Tap FOUR times. Rule 1 makes it 0. Due to non-chaining, it stays 0."
    "9" = "Tap SIX times. Does not trigger any overrides. Target 6."
    "10" = "Tap ZIP times. ZIP isn't a valid number, resulting in a firm 0! Our rule intercepts the 0 and bounces it to 6!"
  }
  "39" = @{
    "1" = "Tap EIGHT times. Target 8."
    "2" = "Tap TWO times. Target 2."
    "3" = "Info: If even, tap zero."
    "4" = "Tap ONE time. 1 is odd -> bypasses rule -> 1."
    "5" = "Tap FIVE times. 5 is odd -> 5."
    "6" = "Tap EIGHT times. 8 is even -> zeroes to 0."
    "7" = "Info: If odd, tap three."
    "8" = "Tap THREE times. 3 is odd. The rule confirms it as 3."
    "9" = "Tap NINE times. The Velvet Top Hat subtracts 1. 9 - 1 = 8. 8 is even, so the first rule squashes it to 0."
    "10" = "Tap ZERO times. 0 is even -> 0."
  }
  "40" = @{
    "1" = "Tap THREE times. The Crystal Fortune Ball wildcard is active! It uniquely nullifies odd numbers to 0. 3 is odd, so target is 0."
    "2" = "Tap FOUR times. Unaffected by the Fortune Ball since 4 is even. Target 4."
    "3" = "Info: If zero, tap two."
    "4" = "Tap FIVE times. Fortune Ball turns the odd 5 into a 0. The persistent rule sees the 0 and upgrades it to 2!"
    "5" = "Count red shapes. 2 red circles. Fortune Ball leaves the even 2 alone. Target 2."
    "6" = "Count blue shapes. 3 blue squares. Fortune Ball turns the odd 3 to a 0. Persistent rule turns 0 to 2."
    "7" = "Tap SIX times. Wand is just a distraction. Target 6."
    "8" = "Info: Ignore all math."
    "9" = "Tap EIGHT times. In this level permutation, the direct instruction holds strong over the flavor rule. Target translates straight to 8."
    "10" = "Tap NINE times. Direct evaluation gives 9."
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
Write-Host "Successfully injected $matchCount meticulous explanations for levels 31-40!"
