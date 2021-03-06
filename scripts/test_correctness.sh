#!/bin/bash

source scripts/lock_exec;
source scripts/config;

for bin in $(ls ./bin/*);
do
    echo "Testing: $bin";
    $run_script $bin -n$max_cores | grep -i "expected";
    $run_script $bin -n$max_cores -i32 -r64 | grep -i "expected";
    $run_script $bin -n$max_cores -i16 -r32 -u100 | grep -i "expected";
done;

source scripts/unlock_exec;
