# todo{{{
	# organize pls
#}}}

# custom prompt{{{
#{{{
# default:
    # "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "

# ref:
    # https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_prompts?view=powershell-7.2
    # https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-host?view=powershell-7.2 
    # https://stackoverflow.com/questions/61520315/powershell-get-current-script-directory-name-only
	# https://stackoverflow.com/questions/6245570/how-to-get-the-current-branch-name-in-git
#}}}
function prompt {

	$principal = [Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
	$adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

	if($principal.IsInRole($adminRole)) {
		Write-Host ("[ADMIN] ") -NoNewLine -ForegroundColor Blue
	} 

    Write-Host ("$(Split-Path -Path (Get-Location) -Leaf)") -NoNewLine -ForegroundColor Green

	if(git rev-parse --is-inside-work-tree) {
		Write-Host (" [$(git rev-parse --abbrev-ref HEAD)]") -NoNewLine -ForegroundColor Cyan
	} 

	if ("$(git status -s)") {
		Write-Host ("*") -NoNewLine -ForegroundColor Red
	}

    Write-Host (" ->") -NoNewLine -ForegroundColor Green
	return " "
}
#}}}

# open ms teams{{{
function msto {
    C:\Users\nairv\AppData\Local\Microsoft\Teams\Update.exe --processStart "Teams.exe"
}
#}}}
# close ms teams and all its child processes{{{
function mstc {
    TASKKILL /F /IM Teams.exe /T
}
#}}}

# open brave browser (to specified website or search){{{
function brv {

	param(
		$Query,
		$QueryType=" "
	)	

    if ($QueryType -eq "?") {
		
        start brave google.com/search?q=$($Query.Replace(' ', '+'))
		} else {
        start brave $Query
    }
}
#}}}

# get into a docker container's shell{{{
# 
# ref:
# 	- https://powershell.one/powershell-internals/attributes/auto-completion
#
function dl {
	
	param (
		[ArgumentCompleter({ docker ps --format "{{.Names}}" })]$ContainerName	
	)

	docker exec -it $ContainerName	env TERM=xterm-256color bash -l
}
#}}}

# open all files of a certain file type{{{
function oft {

	param (
		[ArgumentCompleter({ (Get-Childitem | Select-Object Extension -Unique).Extension })] $FileType
	)
	$Files = @(Get-Childitem *$FileType)
	for($i = 0; $i -lt $Files.Count; $i++) {
		& $Files[$i]
	}
}
#}}}

