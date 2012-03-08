
require "significance/version"
require "complex"

module Significance
  LANCZOS_COEF = [ 
    0.99999999999980993,
    676.5203681218851,
    -1259.1392167224028,
    771.32342877765313,
    -176.61502916214059,
    12.507343278686905,
    -0.13857109526572012,
    9.9843695780195716e-6,
    1.5056327351493116e-7
  ]

  def self.gamma(z)
    g = 7 

    if z.real < 0.5 
      Math::PI / (sin(Math::PI * z) * gamma(1 - z)) 
    else
      z -= 1

      x = LANCZOS_COEF[0]

      for i in 1 .. g + 1 
        x += LANCZOS_COEF[i] / (z + i)
      end 

      t = z + g + 0.5 

      Math.sqrt(2 * Math::PI) * t ** (z + 0.5) * exp(-t) * x 
    end 
  end 

  def self.factorial(z)
    return nil if z < 0 

    gamma(z + 1)
  end 

  def self.calculate(a, b, k, n)
    l = a.to_f * b / n 

    return nil if (k + 1.0) / l <= 2.5 

    if k <= 10
      (l - k * Math.log10(l) + factorial(Math.log10(k))) / Math.log10(n)
    else
      (k * (Math.log10(k) - Math.log10(l) - 1.0)) / Math.log10(n)
    end 
  end 
end
