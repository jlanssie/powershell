# Colors
# Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red, Magenta, Yellow, White, 

${ESC} = [char]27
${output_color} = "${ESC}[0m"

# Format

${space} = ' '

# Terminal format

$console = $host.ui.rawui
$console.backgroundcolor = "black"
$console.foregroundcolor = "white"
$colors = $host.privatedata
$colors.verbosebackgroundcolor = "black"
$colors.verboseforegroundcolor = "cyan"
$colors.warningbackgroundcolor = "black"
$colors.warningforegroundcolor = "yellow"
$colors.ErrorBackgroundColor = "black"
$colors.ErrorForegroundColor = "red"

# Prompt format

Function prompt {
    $base ="PS" + ${space}
    $path ="$($executionContext.SessionState.Path.CurrentLocation)" + ${space}
    $userPrompt = "$('>' * ($nestedPromptLevel + 1))" + ${space}

    Write-Host "`n$base" -NoNewline -ForegroundColor "white" -BackgroundColor "black"
    Write-Host $path -NoNewline -ForegroundColor "blue" -BackgroundColor "black"

    if (Test-Path .git) { 
        try {
            $branch = git rev-parse --abbrev-ref HEAD

            Write-Host "($branch)${space}" -NoNewline -ForegroundColor "cyan" -BackgroundColor "black"
        } catch { }
    }

    Write-Host $userPrompt -NoNewline -ForegroundColor "white"

    return "${output_color}"
}