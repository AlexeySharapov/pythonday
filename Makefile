up: #command for up
	docker build --tag testhexlet .
	docker images
	docker run -d testhexlet
	cp -R ~/.docker ~/Hexlet
down: 
	docker build -t test_today .
clear:
	docker rm test_today
