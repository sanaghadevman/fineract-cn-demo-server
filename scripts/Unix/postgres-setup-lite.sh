#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

#!/usr/bin/env bash

#githubAccount=$1

# REM create core folder
mkdir -p core
cd core

get_modules() {
  for module in $@
  do
    git clone https://github.com/apache/$module.git -b develop
    cd $module
    git remote add upstream https://github.com/apache/$module.git
    # For some reason permission gets denied
    chmod +x gradlew
    ./gradlew publishToMavenLocal
    cd ..
  done
}

get_modules fineract-cn-lang fineract-cn-api fineract-cn-async fineract-cn-cassandra fineract-cn-postgresql fineract-cn-command

# REM clone fineract-cn-test FINCN-114
git clone https://github.com/Izakey/fineract-cn-test.git -b FINCN-114
cd fineract-cn-test
git remote add upstream https://github.com/apache/fineract-cn-test.git
chmod +x gradlew
./gradlew publishToMavenLocal
cd ..

# Return to start folder
cd ..

# REM create tools folder
mkdir tools
cd tools

# REM initialize fineract-cn-crypto
git clone https://github.com/Izakey/fineract-cn-crypto.git
cd fineract-cn-crypto
git remote add upstream https://github.com/apache/fineract-cn-crypto.git
chmod +x gradlew
./gradlew publishToMavenLocal
cd ..

# exit tools directory
cd ..

get_modules fineract-cn-anubis fineract-cn-identity fineract-cn-permitted-feign-client

# REM clone fineract-cn-provisioner FINCN-129
git clone https://github.com/Izakey/fineract-cn-provisioner.git -b FINCN-129
cd fineract-cn-provisioner
git remote add upstream https://github.com/apache/fineract-cn-provisioner.git
chmod +x gradlew
./gradlew publishToMavenLocal
cd ..

# REM clone fineract-cn-rhythm FINCN-115
git clone https://github.com/Izakey/fineract-cn-rhythm.git -b FINCN-115
cd fineract-cn-rhythm
git remote add upstream https://github.com/apache/fineract-cn-rhythm.git
chmod +x gradlew
./gradlew publishToMavenLocal
cd ..

# REM clone fineract-cn-template FINCN-120
git clone https://github.com/Izakey/fineract-cn-template.git -b FINCN-120
cd fineract-cn-template
git remote add upstream https://github.com/apache/fineract-cn-template.git
chmod +x gradlew
./gradlew publishToMavenLocal
cd ..

# REM clone fineract-cn-office FINCN-117
git clone https://github.com/Izakey/fineract-cn-office.git -b FINCN-117
cd fineract-cn-office
git remote add upstream https://github.com/apache/fineract-cn-office.git
chmod +x gradlew
./gradlew publishToMavenLocal
cd ..

# REM clone fineract-cn-customer FINCN-116
git clone https://github.com/Izakey/fineract-cn-customer.git -b FINCN-116
cd fineract-cn-customer
git remote add upstream https://github.com/apache/fineract-cn-customer.git
chmod +x gradlew
./gradlew publishToMavenLocal
cd ..

mkdir integration-tests
cd integration-tests

# REM clone fineract-cn-service-starter FINCN-140
git clone https://github.com/Izakey/fineract-cn-service-starter.git -b FINCN-140
cd fineract-cn-service-starter
git remote add upstream https://github.com/apache/fineract-cn-service-starter.git
chmod +x gradlew
./gradlew publishToMavenLocal
cd ..

# REM clone fineract-cn-demo-server FINCN-141
git clone https://github.com/Izakey/fineract-cn-demo-server.git -b FINCN-141
cd fineract-cn-demo-server
git remote add upstream https://github.com/apache/fineract-cn-demo-server.git
chmod +x gradlew
./gradlew publishToMavenLocal
cd ..

# REM initialize Web App
git clone https://github.com/apache/fineract-cn-fims-web-app.git
cd fineract-cn-fims-web-app
git remote add upstream https://github.com/apache/fineract-cn-fims-web-app.git
npm i

cd ..
