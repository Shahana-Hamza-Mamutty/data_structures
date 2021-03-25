def reverse(x)

  negative = x < 0 ? true : false

  if (x >= 0 && x < 10) || (x < 0 && x > -10)
    return x
  end

  val = x.abs
  rev = 0

  while val > 0

    rem = val % 10
    val = val/10

    rev = rev * 10 + rem
  end

  rev = 0 if rev > 0 && rev > 2147483647

  rev = negative ? -rev : rev

  rev = 0 if rev < -2147483647

  rev
end

p reverse(1534236469)