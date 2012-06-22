CPP=cl.exe

VSRC="C:\Program Files\Microsoft SDKs\Windows\v6.0A\Bin/rc.exe"

BUILDDIR=build
EXEDIR=bin

CPP_ARGS=/nologo /ML /W3 /GX \
		 /D "WIN32" /D "NDEBUG"  \
		 /Fd"$(BUILDDIR)\\" /FD /c 


LINK=link.exe

LINK_ARGS=-nologo -subsystem:windows -incremental:no -pdb:none -machine:I386 \
	      kernel32.lib user32.lib  advapi32.lib 


all: icontest

init :  
	mkdir $(BUILDDIR)
	mkdir $(EXEDIR)

resources: $(BUILDDIR)
	$(VSRC) /l 0x809 /fo"$(BUILDDIR)/icontest.res" /d "NDEBUG" icontest.rc


all: icontest	


icontest: init resources
	$(CPP) $(CPP_ARGS)  /Fo"$(BUILDDIR)//icontest.obj" main.cpp
	$(LINK) $(LINK_ARGS) $(BUILDDIR)/icontest.res  $(BUILDDIR)//icontest.obj /out:$(EXEDIR)/icontest.exe
