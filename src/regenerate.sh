#!/bin/sh -ex

where_am_i=$(cd `dirname $0`/..; pwd)
PATH="$where_am_i/target/debug:$PATH"

protoc --rust_out . -Iproto/protobuf${LIBSUFFIX} proto/protobuf${LIBSUFFIX}/google/protobuf/*.proto

mv descriptor.rs plugin.rs lib/protobuf${LIBSUFFIX}/

# vim: set ts=4 sw=4 et:
