$solutionsPath = 'c:\Users\pc\Desktop\HearGlobal\website\solutions.json'
$diffsPath = 'c:\Users\pc\Desktop\HearGlobal\website\diffs.json'

$solutions = Get-Content $solutionsPath -Raw | ConvertFrom-Json
$diffs = Get-Content $diffsPath -Raw | ConvertFrom-Json
$updateCount = 0

foreach ($diff in $diffs) {
    $level = $solutions | Where-Object { $_.levelId -eq $diff.Level -or $_.level -eq $diff.Level }
    if ($level) {
        $round = $level.rounds | Where-Object { $_.roundId -eq $diff.Round }
        if ($round) {
            $round.prompt = $diff.WorkspacePrompt
            if ($null -ne $round.promptText) {
                $round.promptText = $diff.WorkspacePrompt
            }

            $gamePrompt = $diff.WorkspacePrompt
            $replacementLabel = "items"
            if ($gamePrompt -match "(?i)icons?") { $replacementLabel = "icons" }
            elseif ($gamePrompt -match "(?i)objects?") { $replacementLabel = "objects" }
            elseif ($gamePrompt -match "(?i)items?") { $replacementLabel = "items" }
            
            $replacementLabelSingle = $replacementLabel.Substring(0, $replacementLabel.Length - 1)
            
            $CapPlural = ([char]::ToUpper($replacementLabel[0]) + $replacementLabel.Substring(1))
            $CapSingle = ([char]::ToUpper($replacementLabelSingle[0]) + $replacementLabelSingle.Substring(1))

            $round.explanation = $round.explanation -creplace "shapes", $replacementLabel
            $round.explanation = $round.explanation -creplace "shape", $replacementLabelSingle
            $round.explanation = $round.explanation -creplace "Shapes", $CapPlural
            $round.explanation = $round.explanation -creplace "Shape", $CapSingle

            $updateCount++
        }
    }
}

$solutions | ConvertTo-Json -Depth 5 | Set-Content $solutionsPath -Encoding UTF8
Write-Host "Exactly $updateCount updates have been successfully correctly applied."
