template divideTillEnd*(value: SomeNumber, code: untyped) =
  ## divideTillEnd divides the value and executes the passed code
  ## until `res` is less than 1.
  let vals = value # save the value
  var denom = 1000
  while true:
    var res {.inject.} = vals / denom.toFloat
    if res < 1: break

    code

    denom *= 1000
