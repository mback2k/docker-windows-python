# escape=`

ARG BASE_TAG=vs14_1709

FROM mback2k/windows-vstools:${BASE_TAG}

SHELL ["powershell", "-command"]

ARG PYTHON_VERSION=3.6.5

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; `
	Invoke-WebRequest "https://www.python.org/ftp/python/"$env:PYTHON_VERSION"/python-"$env:PYTHON_VERSION"-amd64.exe" -OutFile "python-"$env:PYTHON_VERSION"-amd64.exe"; `
	Start-Process -FilePath "C:\python-"$env:PYTHON_VERSION"-amd64.exe" -ArgumentList /quiet, TargetDir=C:\Python, InstallAllUsers=1, CompileAll=1, PrependPath=1 -NoNewWindow -PassThru -Wait; `
	Remove-Item "python-"$env:PYTHON_VERSION"-amd64.exe";

RUN python -m pip install -U pip setuptools wheel certifi

CMD ["powershell"]
