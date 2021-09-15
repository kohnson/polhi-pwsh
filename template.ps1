#!/usr/bin/pwsh
## A script for figuring out how to do various mechanics in the game

# Lets go
# Writing speech from a character

	# init
	$Random = New-Object System.Random

function Write-Say {
	param (
		[Parameter (Mandatory = $true)]
		[string]
		$name,

		[Parameter (Mandatory = $true)]
		[string]
		$txt
		)
	Write-Host -ForegroundColor Cyan -NoNewLine "$name`: "
	$txt -split "" |
		ForEach-Object{
			Write-Host $_ -NoNewLine -ForegroundColor Yellow
			Start-Sleep -milliseconds $(1 + $Random.Next(200))
		}
}

Write-Say -name "Mech" -txt "One Two Three Four Five"
