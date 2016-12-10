# Create A Lot Of Short URLs Using goo.gl

This Powershell script reads URLs from a file (one URL per line) and shortens each of them using the 
Google URL Shortener service (goo.gl).

## Instructions for Windows 10:

1. Download _shorten.ps1_.
2. Create a file called _urls.txt_ in the same folder where you saved the script. Each line in _urls.txt_ should be an URL you want to shorten.
3. Start the Command Prompt (cmd.exe).
4. Go to the folder where you saved _shorten.ps1_ and _urls.txt_.
5. Run this: `powershell -ExecutionPolicy UnRestricted -File shorten.ps1 -UrlFile urls.txt -ApiKey YOUR_GOOGLE_API_KEY`

## Create Your Own API Key

Create your own API key on <https://console.developers.google.com>. Don't forget to enable the Google URL Shortener API
for the project you create (and for which the API key is linked).

More information found on <https://developers.google.com/url-shortener/v1/getting_started#APIKey>