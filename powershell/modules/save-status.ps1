#!/usr/bin/pwsh
# Save the game and pick up where you left off.
# Save points will be separated by scene.
# Scenes will each be defined as a function

# actual function
function Save-Status {
	Write-Host -BackgroundColor DarkBlue "Save Game"
	Write-Host -ForegroundColor Green  "Use an existing name to overwrite a save, or write a new name to create another slot."
	Write-Host -ForegroundColor Green "Save names are not case-sensitive."
	$(Get-ChildItem -Name .\saves) -Replace ".ps1", ""

	$SaveName = Read-Host -Prompt "Enter a save slot."
	$SaveFile = ".\saves\$SaveName.ps1"
	
	# At this point, you're just going to write your chapter and whatever variables to $SaveFile
	# All variables will have their name stored in .\vars.db
	# For example:
	"#!/usr/bin/pwsh`n## MechanicalPhoenix Dating Simulator save file`n## DO NOT EDIT`n" > $SaveFile # Only one ">" is used so the older version is overwritten completely
	ForEach ($line in Get-Content .\vars.db) {
		"$line = $($line)" >> $SaveFile
	}
}
