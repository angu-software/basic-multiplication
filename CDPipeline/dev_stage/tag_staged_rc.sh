#!/bin/bash
set -e

git fetch --tags
ruby ./CDPipeline/Development_Stage/run.rb --tag_rc
