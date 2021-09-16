#!/usr/bin/pwsh
# Writing speech from a character

# init
$Random = New-Object System.Random

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
			Write-Host $_ -NoNewLine -ForegroundColor Yellow
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
			Write-Host $_ -NoNewLine -ForegroundColor Yellow
			Start-Sleep -milliseconds $(1 + $Random.Next(100))
		}
		Write-Output ""
}

Write-Say -name "Mech" -txt "One Two Three Four Five"
Write-Two -txt "This is a secondary line in which i discuss my moonshine."
