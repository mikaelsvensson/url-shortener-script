#
# Reads URLs from a file (one URL per line) and shortens each of them using the Google URL Shortener service (goo.gl).
#
# Usage:
#   powershell -ExecutionPolicy UnRestricted -File shorten.ps1 -UrlFile urls.sample.txt -ApiKey YOUR_GOOGLE_API_KEY
#
# Output:
#   A CSV file with the short URL for each long URL.
#
# Tips:
#   - Create a project and API key on https://console.developers.google.com
#   - Make sure that the Google URL Shortener API is enabled for your project.
#

param (
[string] $UrlFile,
[string] $ApiKey
)

$responses = @()
$lines = Get-Content $UrlFile
foreach ($line in $lines) {
    $body = @{
        longUrl = "$line"
    }

    $response = Invoke-RestMethod -Method Post  `
        -Body (ConvertTo-Json $body) `
        -ContentType application/json `
        -Uri "https://www.googleapis.com/urlshortener/v1/url?key=$ApiKey"
    
    $responses += $response
}

$date = Get-Date -format "yyyyMMdd-hhmm"
$exportPath = Join-Path -Path $PSScriptRoot -ChildPath "shorten-$date.csv"
$responses | ConvertTo-Csv | Out-File $exportPath

"Shortened URLs to $exportPath" | Write-Output