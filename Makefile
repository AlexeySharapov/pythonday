up: #command for up
	docker build --tag testhexlet .
	echo $(HOME)
	docker run -d testhexlet
down: 
	docker build -t test_today .
clear:
	docker rmi testhexlet
