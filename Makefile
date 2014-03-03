JAR = assembler.jar
JAR_PATH = $(HOME)/ev3sources/lms2012/lmssrc/adk/lmsasm
srcdir = $(PWD)
TARGET = RunProgram.rbf
HOST = 192.168.0.9

.PHONY: all
all: $(TARGET)

.PHONY: clean
clean:
	$(RM) $(TARGET)

.PHONY: upload
upload:
	scp $(TARGET) root@$(HOST):/media/card/myapps/

.PHONY: cleanall
cleanall:
	$(RM) *.rbf

.SUFFIXES: .lms .rbf

.lms.rbf:
	cd $(JAR_PATH); \
	java -jar $(JAR) $(srcdir)/$*

