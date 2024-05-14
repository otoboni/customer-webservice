#!/bin/bash

while true; do
    kubectl get pods | grep customer
    sleep 3
done