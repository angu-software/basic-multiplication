#!/bin/bash
set -e

source $1

git fetch --tags
ruby ./CDPipeline/Development_Stage/run.rb --tag_rc
