#!/bin/bash
sysbench --num-threads=16 --test=fileio --time=30 --file-total-size=2G --file-test-mode=seqrewr prepare
sysbench --num-threads=16 --test=fileio --time=30 --file-total-size=2G --file-test-mode=seqrewr run
sysbench --num-threads=16 --test=fileio --time=30 --file-total-size=2G --file-test-mode=seqrewr cleanup
