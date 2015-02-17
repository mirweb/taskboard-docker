taskboard-docker
================

Docker Image to run [Taskboard](http://taskboard.matthewross.me/), a php kanban board.

Build and Run
-------------
```
docker build -t mirweb/taskboard .
docker run -d -p 80:80 mirweb/taskboard
```

Go with browser to http://localhost/ and starts with the running app and the [Getting Started](http://taskboard.matthewross.me/docs/intro.html).
