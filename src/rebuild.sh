#!/bin/sh -ex

# Test should be executed before build.
# See https://github.com/rust-lang/cargo/issues/961
cargo test --no-default-features --features pb${LIBSUFFIX}
cargo build --no-default-features --features pb${LIBSUFFIX}

# vim: set ts=4 sw=4 et:
