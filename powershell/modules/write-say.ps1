#!/usr/bin/pwsh
# Writing speech from a character

# init
$Random = New-Object System.Random

function Get-NameColour {
	param (
		[Parameter (Mandatory = $true)] # Character name
		[string]
		$name
		)
	# At this point, there would be a switch statement that outputs a different colour based on the contents of $name
	Switch ($name) {
		"PossibleName1" {Write-Output "Blue"}
		"PossibleName2" {Write-Output "Yellow"}
		"PossibleName3" {Write-Output "Green"}
	}
	# And so on. This will be filled once the script is done and I can get a complete character list.
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

	Write-Host -ForegroundColor $(Get-NameColour -name $name) -NoNewLine "$name`: "
	$txt -split "" |
		ForEach-Object{
			Write-Host $_ -NoNewLine
			Start-Sleep -milliseconds $(1 + $Random.Next(200))
		}
	Write-Output ""
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

# Usage examples
# Write-Say -name "Mech" -txt "One Two Three Four Five"
# Write-Two -txt "This is a secondary line in which i discuss my moonshine."
