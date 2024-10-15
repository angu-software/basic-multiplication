#!/bin/bash
set -e

source ./CDPipeline/dev_stage/.env

git fetch --tags
ruby ./CDPipeline/Development_Stage/run.rb --tag_rc
