import unittest

import millie

test "Using Correct Suffix: 100": check millify(100) == "100"
test "Using Correct Suffix: 1K": check millify(1000) == "1K"
test "Using Correct Suffix: 1M": check millify(1000000) == "1M"
test "Using Correct Suffix: 1B": check millify(1000000000) == "1B"
test "Using Correct Suffix: 1T": check millify(1000000000000) == "1T"

test "Working with Negative Numbers: -100": check millify(-100) == "-100"
test "Working with Negative Numbers: -1K": check millify(-1000) == "-1K"
test "Working with Negative Numbers: -1M": check millify(-1000000) == "-1M"
test "Working with Negative Numbers: -1B": check millify(-1000000000) == "-1B"
test "Working with Negative Numbers: -1T": check millify(-1000000000000) == "-1T"

test "Converting to Lowercase: 100": check millify(100, lowercase=true) == "100"
test "Converting to Lowercase: 1k": check millify(1000, lowercase=true) == "1k"
test "Converting to Lowercase: 1m": check millify(1000000, lowercase=true) == "1m"
test "Converting to Lowercase: 1b": check millify(1000000000, lowercase=true) == "1b"
test "Converting to Lowercase: 1t": check millify(1000000000000, lowercase=true) == "1t"

test "Adding An Additional Space: 1 K": check millify(1000, space=true) == "1 K"
test "Adding An Additional Space: 1 M": check millify(1000000, space=true) == "1 M"
test "Adding An Additional Space: 1 B": check millify(1000000000, space=true) == "1 B"
test "Adding An Additional Space: 1 T": check millify(1000000000000, space=true) == "1 T"

test "Precision Test: 1.2K": check millify(1234) == "1.2K"
test "Precision Test: 1.2M": check millify(1234567) == "1.2M"
test "Precision Test: 1.235B": check millify(1234567890, precision=3) == "1.235B"
test "Precision Test: 1.23457T": check millify(1234566000000, precision=5) == "1.23457T"
