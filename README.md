# Millie
A Nim package (the same stuff as the other [Millie](https://github.com/bichanna/millie) in Dart) that converts big numbers to what's pleasant to see (an adorable, little girl, perhaps?).

| 🤢 Before | ✨ After |
| ----------- | ----------- |
| `4200` | `4.2K` |
| `10000` | `10k` |
| `1000040000` | `1.00004B` |

For more examples, see [example](https://github.com/bichanna/millie.nim/tree/master/example) directory.

## Usage
```nim
import millie;

millify(4200) # 4.2K
    
millify(10000, lowercase: true) // 10k
    
millify(
    1250000,
    space: true,
    lowercase: true,
    precision: 3
) // 1.25 m

```

## Options
| Name | Type | Default | Description |
| ----------- | ----------- | ------- | --------- |
| `precision` | `int` | `1` | Decimal places to round|
| `lowercase` | `bool` | `false` | Whether to use lowercase abbreviation |
| `space` | `bool` | `false` | Whether to add a space between the number and the abbreviation |

## Features and Bugs
Please file an [issue](https://github.com/bichanna/millie.nim/issues)!
