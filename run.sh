#!/bin/bash
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' -u Administrator:password localhost:8091/pools/default/buckets/)" != "200" ]]; do sleep 5; done
cd src/Org.Quickstart.API
dotnet build
dotnet run &
sleep 10
cd ../Org.Quickstart.IntegrationTests
dotnet test
