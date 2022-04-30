ALTER SESSION SET OPTIMIZER_MODE = ALL_ROWS;

CREATE CLUSTER movie_A (movieID
NUMBER(7,0)) HASHKEYS 1000;

CREATE TABLE movie
(
	movieID numeric(7) not null,
	movieTitle char(110) not null,                                                                    
	color char(45),
	language char(20),
	year numeric(4)
)CLUSTER movie_A(movieID);