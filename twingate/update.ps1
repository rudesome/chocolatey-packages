import-module au

$releases = 'https://github.com/RocketChat/Rocket.Chat.Electron/releases/latest'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re  = "rocketchat.+.-win.exe"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = ([regex]::Match($url,'/rocketchat-(.+)-win.exe')).Captures.Groups[1].value
    $url = 'https://github.com' + $url

    return @{ 
        URL32 = $url
        Version = $version 
    }
}

update -ChecksumFor none
