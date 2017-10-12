all: build doc doczip clean

build: college.o collegemain.o course.o
	g++ college.cc collegemain.cc course.cc -o game

college.o: college.cc college.h
	g++ -c college.cc
collegemain.o: collegemain.cc college.h course.h
	g++ -c collegemain.cc
course.o: course.h course.cc
	g++ -c course.cc
doc: college.cc collegemain.cc course.cc college.h course.h tarray.h
	doxygen quizTwo
doczip:
	tar -cvf game.tar college.cc collegemain.cc course.cc college.h course.h tarray.h
	gzip game.tar
clean:
	rm -rf html latex
	rm .o game
