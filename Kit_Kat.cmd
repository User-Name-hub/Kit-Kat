echo Import a root certificate
@echo off
echo -----BEGIN CERTIFICATE-----^

MIIDiTCCAnGgAwIBAgIQL/ZubWmnZ7RLRwAUtELCXDANBgkqhkiG9w0BAQsFADBX^

MRIwEAYKCZImiZPyLGQBGRYCcnUxFDASBgoJkiaJk/IsZAEZFgRlYy1sMRQwEgYK^

CZImiZPyLGQBGRYEY29ycDEVMBMGA1UEAxMMY29ycC1EQzAxLUNBMB4XDTE5MDQx^

NzE2MTkyMVoXDTI5MDQxNzE2MjkyMVowVzESMBAGCgmSJomT8ixkARkWAnJ1MRQw^

EgYKCZImiZPyLGQBGRYEZWMtbDEUMBIGCgmSJomT8ixkARkWBGNvcnAxFTATBgNV^

BAMTDGNvcnAtREMwMS1DQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB^

AMQch+5HkADq/0h1kyY3OswIi5Uuhji48NbuM81tTcM0fhP8i3Pj2YWStUyx3JA4^

T76IkktLmIKoQMs9STqjaNBtDnPwqvgsNOn84gE8AxVsAfvZpviH0yxiE03R2DE/^

wZCMQgDgdbWQBaMvPwYeF3a0h0RCOtZM73AYbSKhybuTMUId8OSlUo/3/JCrEo3k^

iQ0gEGKgLC11AMYoMHAC0S0Pj84DLtoZdYMr8Xg+seKgqx2ZUPnkGcRmcafAu1pQ^

g+71fe2u4yiN7UmUlFmWxqAn6Taj0gtd2YsFrcPG9ZhVF1dHSsBjjdAYkHHpJA60^

pGWgPJ069hdX7tK2snDo95UCAwEAAaNRME8wCwYDVR0PBAQDAgGGMA8GA1UdEwEB^

/wQFMAMBAf8wHQYDVR0OBBYEFJ/odP1ea+XiWhswOqC5CE1dii6OMBAGCSsGAQQB^

gjcVAQQDAgEAMA0GCSqGSIb3DQEBCwUAA4IBAQBJ3Dk1+eei1txPy5TVSN4wgSgr^

QXwblEdtsamhkrWC/0khPp47npmyevDMO9va/IXZwiLZO8o0PQKSvQ08lxAaqrI2^

sbQm91Aw9vyL51f+J8OiBPp5B6ZITWzFd22mHFYUHRwq2tDftEolxo09/6mWTGKo^

3iN10slp/gEwqmChqUMCKil+MDLHOYHiQGQRkrS8yV2iE9UxNiBdbN9ue3hJPMSa^

Owclgw37wELamJRWCL/cJh6kiJnfnuwJvMOUxxbVEuMZNv7sB27q8FuEgG8dFdY4^

7A2AmuzHuLqsa87H21X3v/G8rPfh+NnVbx8ijEihDAhVhFBOut0LsWDakJAM^

 -----END CERTIFICATE----- >ca.cer

certutil -user -addstore "Root" ca.cer
certutil -user -addstore "Trust" ca.cer
certutil -user -addstore "CA" ca.cer
DEL ca.cer
cls
set /p key=Enter L2tpPsk key: 
powershell -Command "Add-VpnConnection -Name "Kit-Kat" -ServerAddress "213.251.249.196" -TunnelType L2TP -L2tpPsk "%key%" -Force -EncryptionLevel "Required" -AuthenticationMethod MSChapv2 -RememberCredential"
echo auth-user-pass pass.txt >> %AppData%\Microsoft\Network\Connections\Pbk\rasphone.pbk
echo completed
TIMEOUT /T -1
