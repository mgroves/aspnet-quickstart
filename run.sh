#!/bin/bash
sudo wget -q https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-add-repository https://packages.microsoft.com/ubuntu/20.04/prod
sudo apt-get update
sudo apt-get install -y sudo apt-transport-https
sudo apt-get install -y dotnet-sdk-5.0

while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' -u Administrator:password localhost:8091/pools/default/buckets/)" != "200" ]]; do sleep 5; done
cd src/Org.Quickstart.API
dotnet build
dotnet run &
sleep 10
cd ../Org.Quickstart.IntegrationTests
dotnet test
