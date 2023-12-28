files = "./srcs/docker-compose.yml"
 

all:
	docker-compose -f ${files} up 

down:
	docker-compose -f ${files} down


start:
	docker-compose -f ${files} start
stop:
	docker-compose -f ${files} stop	
clean:
	docker system prune 
