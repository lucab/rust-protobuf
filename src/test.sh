#!/bin/sh -ex

cargo build

where_am_i=$(cd `dirname $0`/..; pwd)
PATH="$where_am_i/target/debug:$PATH"
TESTDIR="test/proto"

rm -f test/pb_*

protoc --rust_out test ${TESTDIR}/pb_basic.proto
protoc --rust_out test ${TESTDIR}/pb_test-sanitize-file-name.proto
protoc --rust_out test ${TESTDIR}/pb_text_format_test_data.proto
protoc --rust_out test -I ${TESTDIR} ${TESTDIR}/pb_test_*.proto

cd test

rustc --test -L ../../target/debug/deps lib.rs
./lib
