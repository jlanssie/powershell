Useful Powershell functions.

# Setup

## Environment variables

Open Windows `Advanced System Settings`.

Add the environment variable `REPOS_DIR`
The value of this variable should be the directory where you store Git repositories.

Add the environment variable `POWERSHELL_REPO_DIR`.
The value of this variable should be the directory of the local powershell Git repository.

## Powershell Profile Path

Display your Powershell profile path. 

````powershell
echo $profile
````

## Load functions & aliases

Create the profile.ps1 file and add the following pointers to functions and aliases.

````powershell
# Load functions

$functions = [string]::join([environment]::newline, (get-content -path $env:POWERSHELL_REPO_DIR\functions.ps1))
invoke-expression $functions

# Load aliases

$aliases = [string]::join([environment]::newline, (get-content -path $env:POWERSHELL_REPO_DIR\aliases.ps1))
invoke-expression $aliases
````
