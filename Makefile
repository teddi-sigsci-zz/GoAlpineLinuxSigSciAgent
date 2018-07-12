
build:
	docker build --no-cache -t alpinetest .

run:
	docker run -ti -p 8080:80 --name alpinetest1 alpinetest /bin/bash
