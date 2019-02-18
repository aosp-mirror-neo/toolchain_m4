#!/bin/bash -ex
#
# Copyright 2019 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Regenerate host configuration files for the current host

cd `dirname ${BASH_SOURCE[0]}`

DIR=linux_glibc
if [ `uname` == "Darwin" ]; then
  DIR=darwin
fi
mkdir -p $DIR
cd $DIR

# Generate headers
rm -rf tmp
mkdir tmp
cd tmp
../../../configure
make
cd lib
find . -name '*.h' | xargs -IX cp X ../../
cd ../..
rm -rf tmp
