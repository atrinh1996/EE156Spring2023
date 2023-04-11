GXX=g++
GXXFLAGS=-Wall -Wextra

FILES=report.pdf README.md

gshare: gshare_test.cc
	${GXX} ${GXXFLAGS} -o $@.o $^

mv_gshareH:
	mv gshare.h ${HOME}/sniper-container/sniper-7.3/common/performance_model/branch_predictors/

labzip:
	zip AmyBui_lab3.zip ${FILES}

provide:
	provide ee156 lab3 AmyBui_lab3.zip