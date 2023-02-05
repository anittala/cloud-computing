#!/bin/bash
sysbench --num-threads=16 --test=fileio --time=30 --file-total-size=2G --file-test-mode=rndwr prepare
sysbench --num-threads=16 --test=fileio --time=30 --file-total-size=2G --file-test-mode=rndwr run
sysbench --num-threads=16 --test=fileio --time=30 --file-total-size=2G --file-test-mode=rndwr cleanup
