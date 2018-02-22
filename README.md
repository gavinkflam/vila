vila
====

My dockerized development and sandbox environment.

Minimal
-------
Each development project should be containerized and carry their own
dependencies in the corresponding container.

Interactions should be done via docker-cli and Docker socket.

Otherwise, dependencies could be installed on-the-fly and won't persist after
destroying the sandbox container.

Thus allowing a clean and minimal core of the development environment.

License
-------
MIT License
