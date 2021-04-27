up: #command for up
	docker build --tag testhexlet .
	docker run -d testhexlet
down: 
	docker build -t test_today .
clear:
	docker rmi testhexlet
