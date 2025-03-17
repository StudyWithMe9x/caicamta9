<# 1. download and install camta#>
$Path = $env:TEMP; $Installer = "camtasia911111.exe"; $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest "https://download.techsmith.com/camtasiastudio/enu/915/camtasia.exe" -OutFile $Path\$Installer; Start-Process -FilePath $Path\$Installer -Args "/y /silent /install" -Verb RunAs -Wait; Remove-Item $Path\$Installer 
<# 2. insert reginfo to folder#>
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest "https://github.com/StudyWithMe9x/camta9/raw/refs/heads/main/RegInfo.ini" -OutFile "C:\ProgramData\TechSmith\Camtasia Studio 9\RegInfo.ini"
Set-ItemProperty -path "C:\ProgramData\TechSmith\Camtasia Studio 9\RegInfo.ini" -name IsReadOnly $true
<# 3. remove folder sample projects#>
rm 'C:\ProgramData\TechSmith\Camtasia Studio 9\Sample_Projects' -r -force
<# 4. insert host file#>
<# 
cmd echo 127.0.0.1 www.techsmith.com >> %WINDIR%\System32\Drivers\Etc\Hosts
cmd echo 127.0.0.1 activation.cloud.techsmith.com >> %WINDIR%\System32\Drivers\Etc\Hosts
cmd echo 127.0.0.1 oscount.techsmith.com >> %WINDIR%\System32\Drivers\Etc\Hosts
cmd echo 127.0.0.1 updater.techsmith.com >> %WINDIR%\System32\Drivers\Etc\Hosts
cmd echo 127.0.0.1 camtasiatudi.techsmith.com >> %WINDIR%\System32\Drivers\Etc\Hosts
cmd echo 127.0.0.1 tsccloud.cloudapp.net >> %WINDIR%\System32\Drivers\Etc\Hosts
cmd echo 127.0.0.1 assets.cloud.techsmith.com >> %WINDIR%\System32\Drivers\Etc\Hosts
cmd echo 127.0.0.1 www.techsmith.com >> %WINDIR%\System32\Drivers\Etc\Hosts
#>

install-module PsHosts
Add-HostEntry 127.0.0.1 www.techsmith.com
