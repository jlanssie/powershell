# Functions

# Reload Powershell

Function reload_powershell { & $profile }

# Go to locations

Function repos { cd $env:REPOS_DIR }

# Prettify code

Function prettify { npx prettier --write . }

# Git 

Function pull { git pull }

Function push([string]${commitMessage}) {
    ${localGitBranch} = git rev-parse --abbrev-ref HEAD
    ${remoteGitBranch} = ${localGitBranch}

    git add -A

    if((${commitMessage} = $null) -or (${commitMessage} = '')) {
       ${commitMessage} = ${localGitBranch}+"- update"
    } else {
       ${commitMessage} = ${localGitBranch}+$1
    }

    git commit -m ${commitMessage}

    git push origin ${localGitBranch}:${remoteGitBranch}
}
