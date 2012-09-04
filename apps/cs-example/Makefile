
WSDL = wsdl
CSC = dmcs
MONO = mono

all: bin/client.exe

bin:
	mkdir bin

src/Durden.Server.cs:
	$(WSDL) \
		-server \
		-n:Durden.Server \
		-out:src/Durden.Server.cs \
		'http://localhost:8080/test/service.asmx?wsdl=0'

src/Durden.Client.cs:
	$(WSDL) \
		-n:Durden.Client \
		-out:src/Durden.Client.cs \
		'http://localhost:8080/test/service.asmx?wsdl=0'

bin/client.exe: bin src/Durden.Client.cs src/ClientMain.cs
	$(CSC) \
		-r:System.dll \
		-r:System.Web.Services.dll \
		-target:exe -out:bin/client.exe \
		src/Durden.Client.cs \
		src/ClientMain.cs 

bin/server.dll: bin src/Durden.Server.cs
	$(CSC) \
		-r:System.dll \
		-r:System.Web.dll \
		-r:System.Web.Services.dll \
		-target:library -out:bin/server.dll \
		src/Durden.Server.cs

run-server: bin/server.dll
	xsp2 --port 8081 --applications /:.

run-client: bin/client.exe
	$(MONO) bin/client.exe
