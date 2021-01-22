<# Synopsis
        Configure the device to use TLS 1.2 for secure communications

# Description
        Configures the .NET Frameworks to use Strong Crypto
        Disables the SSL 2.0/3.0 and the TLS 1.0/1.1 Protocols 
        Enables the TLS 1.2 Protocol

# Notes
    Version: 1.0
    Author: Joseph Hopper
    Creation Date: 01/02/2021
    Purpose/Change: Initial script development

# References
The SCH_USE_STRONG_CRYPTO flag
https://docs.microsoft.com/en-us/dotnet/framework/network-programming/tls#the-sch_use_strong_crypto-flag

Transport Layer Security 1.0 and 1.1 disablement
https://docs.microsoft.com/en-us/lifecycle/announcements/transport-layer-security-1x-disablement

How to enable TLS 1.2
https://docs.microsoft.com/en-us/mem/configmgr/core/plan-design/security/enable-tls-1-2

# Example
        Set-TLS

# Disclaimer
# This module and it's scripts are not supported under any Microsoft standard support program or service.
# The scripts are provided AS IS without warranty of any kind.
# Microsoft further disclaims all implied warranties including, without limitation, any implied warranties of merchantability
# or of fitness for a particular purpose.
# The entire risk arising out of the use or performance of the scripts and documentation remains with you.
# In no event shall Microsoft, its authors, or anyone else involved in the creation, production,
# or delivery of the scripts be liable for any damages whatsoever (including, without limitation, damages
# for loss of business profits, business interruption, loss of business information, or other pecuniary loss)
# arising out of the use of or inability to use the sample scripts or documentation,
# even if Microsoft has been advised of the possibility of such damages.

# Disclaimer: 
# GitHub is an external service subject to its own privacy and licensing terms. Your download and use of any files from GitHub 
# here is subject to the license terms of those files provided on GitHub.
#>

# Set the .NET Framework to use Strong Crypto
New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v2.0.50727 -Name "SystemDefaultTlsVersions" -PropertyType DWord -Value "1" -ErrorAction SilentlyContinue
New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v2.0.50727 -Name "SchUseStrongCrypto" -PropertyType DWord -Value "1" -ErrorAction SilentlyContinue

New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319 -Name "SystemDefaultTlsVersions" -PropertyType DWord -Value "1" -ErrorAction SilentlyContinue
New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319 -Name "SchUseStrongCrypto" -PropertyType DWord -Value "1" -ErrorAction SilentlyContinue

New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\.NETFramework\v2.0.50727 -Name "SystemDefaultTlsVersions" -PropertyType DWord -Value "1" -ErrorAction SilentlyContinue
New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\.NETFramework\v2.0.50727 -Name "SchUseStrongCrypto" -PropertyType DWord -Value "1" -ErrorAction SilentlyContinue
 
New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319 -Name "SystemDefaultTlsVersions" -PropertyType DWord -Value "1" -ErrorAction SilentlyContinue
New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319 -Name "SchUseStrongCrypto" -PropertyType DWord -Value "1" -ErrorAction SilentlyContinue
Write-Host ".NET Frameworks are configured to use strong crypto"

# Disable SSL 2.0
New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server' -name Enabled -value 0 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client' -name Enabled -value 0 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
Write-Host 'SSL 2.0 has been disabled.'

# Disable SSL 3.0 
New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server' -name Enabled -value 0 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client' -name Enabled -value 0 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
Write-Host 'SSL 3.0 has been disabled.'

# Disable TLS 1.0 
New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
Write-Host 'TLS 1.0 has been Disabled.'

# Disable TLS 1.1 
New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
Write-Host 'TLS 1.1 has been Disabled.'

# Enable TLS 1.2 for client and server SCHANNEL communications
New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server' -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server' -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client' -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client' -name 'DisabledByDefault' -value 0 -PropertyType 'DWord' -Force | Out-Null -ErrorAction SilentlyContinue
Write-Host 'TLS 1.2 has been enabled.'

<#
# Get current protocol(s)
[System.Net.ServicePointManager]::SecurityProtocol

# Force device to use TLS 1.2
[System.Net.ServicePointManager]::SecurityProtocol = “Tls12”

# Force device to use TLS 1.1
[System.Net.ServicePointManager]::SecurityProtocol = “Tls11”

# Force device to use TLS 1.0
[System.Net.ServicePointManager]::SecurityProtocol = “Tls”

# Alternate way to set TLS
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls

# Get supported TLS Protocols
[enum]::GetNames([Net.SecurityProtocolType])

# Returns the following values #
SystemDefault
Ssl3
Tls
Tls11
Tls12
Tls13
#>

