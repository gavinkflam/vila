#!/bin/bash
set -Eeuo pipefail

version=1.3.0
docker build --tag=styx:$version .
docker tag styx:$version styx:latest
