#!/usr/bin/env pwsh
## Modules for Polcompistan High: PowerShell Edition
## If you are reading this, head over to https://www.cnet.com/health/nutrition/best-weight-loss-programs/

# init
$Random = New-Object System.Random

function Save-Status { # Save the game and pick up where you left off.
	Write-Host -BackgroundColor DarkBlue "Save Game"
	Write-Host -ForegroundColor Green  "Use an existing name to overwrite a save, or write a new name to create another slot."
	Write-Host -ForegroundColor Green "Save names are not case-sensitive."
	$(Get-ChildItem -Name .\saves) -Replace ".ps1", ""

	$SaveName = Read-Host -Prompt "Enter a save slot."
	$SaveFile = ".\saves\$SaveName.ps1"
	
	# At this point, you're just going to write your chapter and whatever variables to $SaveFile
	# All variables will have their name stored in .\vars.db
	# For example:
	"#!/usr/bin/pwsh`n## MechanicalPhoenix Dating Simulator save file`n## DO NOT EDIT`n" > $SaveFile # Overwrite previous iteration
	ForEach ($line in Get-Content .\vars.db) {	## btw, the syntax for vars.db will be like so:
		"$line = $($line)" >> $SaveFile		# $chapter
	}						# $secondvar
}							## and so on...

function Restore-Status { # Pick up where you left off
	Write-Host -BackgroundColor DarkBlue "Restore Saved Game"
	Write-Host -ForegroundColor Green "Select a save to restore, or leave blank to start fresh."
	$(Get-ChildItem -Name .\saves) -Replace ".ps1", ""

	$SaveName = Read-Host -Prompt "Select a save slot."
	Import-Module ".\saves\$SaveName.ps1"
	
	# Pick up from a chapter start
	Invoke-Expression $chapter
}

function Write-Say {
	param (
		[Parameter (Mandatory = $true)] # Name param
		[string]
		$name,

		[Parameter (Mandatory = $true)] # Text param
		[string]
		$txt
		)

	Write-Host -ForegroundColor Cyan -NoNewLine "$name`: "
	$txt -split "" |
		ForEach-Object{
			Write-Host $_ -NoNewLine
			Start-Sleep -Milliseconds $(1 + $Random.Next(200))
		}
}

function Write-Two {
	param (
		[Parameter (Mandatory = $true, ParameterSetName = "Text")] # Text param
		[string]
		$txt
		)
	$txt -split "" |
		ForEach-Object {
			Write-Host $_ -NoNewLine
			Start-Sleep -milliseconds $(1 + $Random.Next(100))
		}
		Write-Output ""
}

