import millie/utils
import std/[strutils, math]

const units = [
  "",  # nothing...
  "K", # thousand
  "M", # million
  "B", # billion
  "T", # trillion
  "P", # quadrillion
]


proc millify*(
    value: SomeNumber,
    precision: int = 1,
    lowercase: bool = false,
    space: bool = false,
  ): string =
  ## Converts big numbers to what's pleasant to see (an adorable, little girl, perhaps?)
  
  # preallocate the resulting string
  result = newStringOfCap(10)

  var val = float(value)

  # add a negative prefix if needed
  if val < 0: result.add '-'
  
  # only work with positive numbers for easiness
  val = val.abs()

  # keep dividing the input value by the digit grouping base (1000)
  # until the number and the unit index are found.
  var unitIndex = 0
  divideTillEnd(val):
    val = res
    unitIndex += 1

  # The number is too big for Millie to handle. So,
  # Millie just returns it as is.
  if len(units) <= unitIndex: return $value

  # round the decimal number up to the desired precision
  let rounded = val.round(precision)
  let ceil = rounded.ceil()
  result.add if ceil == rounded: $ceil.int else: $rounded

  # add a space if the user specified to do so
  if space: result.add ' '

  # get the appropriate unit for the value
  let unit = units[unitIndex]
  result.add if not lowercase: unit else: unit.toLower()
