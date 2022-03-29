import strutils, strformat, math

## parseNum ensures the value is a number (double)
## returns the parsed value.
proc parseNum*(value: SomeNumber): float =
  var val: float
  
  try: val = parseFloat($value)
  except ValueError: raise newException(ValueError, fmt"Input value must be a number, not '{value}'")

  return val

## roundTo rounds a number up to a specified precision and returns it
proc roundTo*(value: SomeNumber, precision: int): SomeNumber = return parseFloat($value).round(precision)

## divideTillEnd divides and calls the passed function until `res` is less than 0.
proc divideTillEnd*(value: SomeNumber, fun: proc (res: float)) =
  var denom = 1000;
  while true:
    var res = value / denom.toFloat
    if res < 1: break

    fun(res)

    denom *= 1000