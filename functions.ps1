# Functions

# Reload Powershell

Function reload_powershell { & $profile }

# Go to locations

Function repos { cd $env:REPOS_DIR }

# Prettify code

Function prettify { npx prettier --write . }

# Git 

Function pull { git pull }

Function push([string]${message}) {
    ${localGitBranch} = git rev-parse --abbrev-ref HEAD
    ${remoteGitBranch} = ${localGitBranch}
    
    ${commitMessage} = ${localGitBranch} + " - update"
    if(${message} -ne '') {
       ${commitMessage} = ${localGitBranch} + " " + ${message}
    }

    git add -A

    git commit -m ${commitMessage}

    git push origin ${localGitBranch}:${remoteGitBranch}
}
