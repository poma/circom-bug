#!/bin/bash -e
cd circuits
npx circom -wrsv
npx snarkjs wd