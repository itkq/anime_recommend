DIR := `pwd`

all: build run
build:
	docker build -t hakobe/anime_recommend .
run:
	docker run -it --rm -v $(DIR):/root/anime_recommend hakobe/anime_recommend

