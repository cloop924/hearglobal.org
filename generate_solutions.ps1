$levelsDir = "c:\Users\pc\Desktop\gamedev\tapgame\assets\levels"
$outputPath = "c:\Users\pc\Desktop\HearGlobal\website\solutions.json"

$wildcards = @{
    0 = @{ name = "No Wildcard"; effect = "There are no wildcards active. You just follow the prompt exactly." }
    1 = @{ name = "Vintage Carnival Ticket"; effect = "The Vintage Carnival Ticket is active, which always adds +1 to the final tap count." }
    2 = @{ name = "Velvet Top Hat"; effect = "The Velvet Top Hat is active, which always subtracts -1 from the final tap count (minimum 0)." }
    3 = @{ name = "White Rabbit"; effect = "The White Rabbit is active, which multiplies the required taps by 2." }
    4 = @{ name = "Magician's Wand"; effect = "The Magician's Wand is active, which inverts any math operations implied by the prompt." }
    5 = @{ name = "Crystal Fortune Ball"; effect = "The Crystal Fortune Ball is active, turning the target to 0 if the original answer was an odd number." }
    6 = @{ name = "Joker Playing Card"; effect = "The Joker Playing Card is active, making the target always 0, regardless of the prompt." }
    7 = @{ name = "Ace of Spades"; effect = "The Ace of Spades is active, making the target exactly 1 if any icons are present." }
    8 = @{ name = "Ornate Carousel Horse"; effect = "The Ornate Carousel Horse is active, which divides the final target by 2 (rounded down)." }
    9 = @{ name = "Harlequin Mask"; effect = "The Harlequin Mask is active, meaning the target becomes the exact number of spaces in the text prompt." }
    10 = @{ name = "Wooden Juggling Club"; effect = "The Wooden Juggling Club is active, which adds the total number of visible icons on screen to the tap count." }
    11 = @{ name = "Antique Unicycle"; effect = "The Antique Unicycle is active. You must completely ignore all visible icons on the screen, only the text prompt matters." }
    12 = @{ name = "Gold Pocket Watch"; effect = "The Gold Pocket Watch is active. If the prompt has more than 10 characters, tap 5 times. Otherwise, tap 0." }
    13 = @{ name = "Magician's White Glove"; effect = "The Magician's White Glove is active, completely disregarding all other active stickers. Only the original text prompt rules apply." }
    14 = @{ name = "Striped Popcorn Bucket"; effect = "The Striped Popcorn Bucket is active, adding +3 to the target." }
    15 = @{ name = "Classic Big Top Tent"; effect = "The Classic Big Top Tent is active. If the target is greater than 5, the target becomes exactly 5." }
    16 = @{ name = "Wooden Carnival Target"; effect = "The Wooden Carnival Target is active. If the target is exactly 0, it becomes exactly 1." }
    17 = @{ name = "Feathered Dart"; effect = "The Feathered Dart is active, subtracting the number of icons present from the tap count (min 0)." }
    18 = @{ name = "Vintage Jack-in-the-Box"; effect = "The Vintage Jack-in-the-Box is active, adding +5 to the target ONLY if the initial target was 0." }
    19 = @{ name = "Interlocking Magic Rings"; effect = "The Interlocking Magic Rings are active, making the target the exact number of words in the prompt text." }
    20 = @{ name = "Padlocked Mystery Box"; effect = "The Padlocked Mystery Box is active, subtracting the number of vowels in the prompt text from the total tap target." }
    21 = @{ name = "Strongman Mallet"; effect = "The Strongman Mallet is active, rounding up any target less than 3 to exactly 3." }
    22 = @{ name = "Ferris Wheel Car"; effect = "The Ferris Wheel Car is active, making the target exactly equal to the previous round's correct answer." }
    23 = @{ name = "Distorted Funhouse Mirror"; effect = "The Distorted Funhouse Mirror is active, inverting the target relative to 10 (e.g., 2 becomes 8)." }
    24 = @{ name = "Ticket Dispenser"; effect = "The Ticket Dispenser is active, making the target exactly equal to the current round number you are on." }
    25 = @{ name = "Engraved Brass Coin"; effect = "The Engraved Brass Coin is active. If this is the final round, the target is 0." }
}

$allLevels = @()

$files = Get-ChildItem -Path $levelsDir -Filter "*.json"

foreach ($file in $files) {
    try {
        $jsonStr = Get-Content -Path $file.FullName -Raw
        $data = $jsonStr | ConvertFrom-Json
        
        $solutionsLevel = @{
            levelId = $data.levelId
            rounds = @()
        }
        
        if ($null -ne $data.rounds) {
            foreach ($round in $data.rounds) {
                
                $wid = 0
                if ($null -ne $round.wildcardId) { $wid = $round.wildcardId }
                
                $wName = "Unknown"
                $wEffect = "A mysterious wildcard changes the rules."
                if ($wildcards.ContainsKey($wid)) {
                    $wName = $wildcards[$wid].name
                    $wEffect = $wildcards[$wid].effect
                }

                $iconsArr = @()
                if ($null -ne $round.layoutElements) {
                    foreach ($el in $round.layoutElements) {
                        if ($el.type -eq 'icon' -or $null -ne $el.content) {
                            $colorStr = 'black'
                            if ($null -ne $el.color) { $colorStr = $el.color }
                            $iconsArr += @{
                                content = $el.content
                                color = $colorStr
                            }
                        }
                    }
                }

                $tgt = $null
                if ($null -ne $round.target) { $tgt = $round.target }

                $isInfo = $false
                if ($null -ne $round.isInfo) { $isInfo = $round.isInfo }

                $explanation = ""
                if ($isInfo) {
                    $explanation = "This is an informational round. No tapping required, just read the prompt and advance."
                } else {
                    if ($wid -eq 0) {
                        $explanation = "Based simply on reading the prompt, the correct answer is $tgt taps. No wildcards are active to alter this outcome."
                    } else {
                        $explanation = "The prompt is trying to trick you or guide you to a different number. However, you must remember the active wildcard rule! $wEffect Applying this rule leads to the final required tap count of $tgt."
                    }
                }

                $roundObj = @{
                    roundId = $round.roundId
                    prompt = $round.prompt
                    wildcardId = $wid
                    wildcardName = $wName
                    target = $tgt
                    isInfo = $isInfo
                    icons = $iconsArr
                    explanation = $explanation
                }
                
                $solutionsLevel.rounds += $roundObj
            }
        }
        $allLevels += $solutionsLevel
    } catch {
        Write-Host "Error parsing $($file.Name): $_"
    }
}

$allLevels = $allLevels | Sort-Object levelId

# Depth dictates how deep nested structures serialize
$allLevels | ConvertTo-Json -Depth 10 | Set-Content -Path $outputPath
Write-Host "Successfully generated solutions.json with $($allLevels.Count) levels."
