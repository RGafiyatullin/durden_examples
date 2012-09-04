
WSDL = wsdl
CSC = dmcs
MONO = mono

all: bin/pb.exe

bin:
	mkdir bin

src/PB.Client.cs:
	$(WSDL) \
		-n:PB.Client \
		-out:src/PB.Client.cs \
		'http://localhost:8080/pb/v0.asmx?wsdl=0'

bin/pb.exe: bin src/PB.Client.cs src/ClientMain.cs
	$(CSC) \
		-r:System.dll \
		-r:System.Web.Services.dll \
		-target:exe -out:bin/pb.exe \
		src/PB.Client.cs \
		src/ClientMain.cs 
