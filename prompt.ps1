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

Function Write-BranchName () {
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            # we're probably in detached HEAD state, so print the SHA
            $branch = git rev-parse --short HEAD
            Write-Host "($branch)${space}" -NoNewline -ForegroundColor "red" -BackgroundColor "black"
        } else {
            # we're on an actual branch, so print it
            Write-Host "($branch)${space}" -NoNewline -ForegroundColor "cyan" -BackgroundColor "black"
        }
    } catch { }
}

function prompt {
    $base ="PS" + ${space}
    $path ="$($executionContext.SessionState.Path.CurrentLocation)" + ${space}
    $userPrompt = "$('>' * ($nestedPromptLevel + 1))" + ${space}

    Write-Host "`n$base" -NoNewline -ForegroundColor "white" -BackgroundColor "black"
    Write-Host $path -NoNewline -ForegroundColor "blue" -BackgroundColor "black"

    if (Test-Path .git) { Write-BranchName }

    Write-Host $userPrompt -NoNewline -ForegroundColor "white"

    return "${output_color}"
}