import millie/utils
import strutils, strformat, math

const units = @[
  "",  # nothing...
  "K", # thousand
  "M", # million
  "B", # billion
  "T", # trillion
  "P", # quadrillion
]

## Converts big numbers to what's pleasant to see (an adorable, little girl, perhaps?)
proc millify*(
    value: int64,
    precision: int = 1,
    lowercase: bool = false,
    space: bool = false,
  ): string =
  
  # validate if `vaue` can be parsed or not
  var val: SomeNumber = parseNum(value)

  # `prefix` will be used later when assembling
  let prefix: string = if val < 0: "-" else: ""

  # only work with positive numbers for easiness
  val = val.abs()

  # keep dividing the input value by the digit grouping base (1000)
  # until the number and the unit index are found.
  var unitIndex: int = 0
  proc disposableFunc(res: float) =
    val = res
    unitIndex += 1
  divideTillEnd(val, disposableFunc)

  # The number is too big for Millie to handle. So,
  # Millie just returns it as is.
  if len(units) <= unitIndex: return $value

  # round the decimal number up to the desired precision
  var rounded: SomeNumber = roundTo(val, precision)
  var formatted: string
  if rounded.ceil() == rounded: formatted = $rounded.ceil().float.int else: formatted = $rounded

  # get the appropriate unit for the value
  let unit: string = if len(units) > unitIndex: units[unitIndex] else: ""
  let suffix: string = if not lowercase: unit else: unit.toLower()


  # add a space if the user specified to do so
  let spaceStr = if space: " " else: ""

  return fmt"{prefix}{formatted}{spaceStr}{suffix}"