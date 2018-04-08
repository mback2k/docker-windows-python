# escape=`

FROM mback2k/windows-vstools

SHELL ["powershell", "-command"]

ARG PYTHON_VERSION=3.6.5

RUN Invoke-WebRequest "https://www.python.org/ftp/python/"$env:PYTHON_VERSION"/python-"$env:PYTHON_VERSION"-amd64.exe" -OutFile "python-"$env:PYTHON_VERSION"-amd64.exe"; `
	Start-Process -FilePath "C:\python-"$env:PYTHON_VERSION"-amd64.exe" -ArgumentList /quiet, InstallAllUsers=1, CompileAll=1, PrependPath=1, Include_test=0 -NoNewWindow -PassThru -Wait; `
	Remove-Item "python-"$env:PYTHON_VERSION"-amd64.exe";

CMD ["powershell"]
