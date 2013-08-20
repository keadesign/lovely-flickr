class PhotoPrices

  # Format needed for select
  # PRICES = [
  #   [ something, something_else ],
  #   [ something, something_else ],
  #   [ something, something_else ],
  #   [ something, something_else ]
  # ]

  PRICES = {
    '5x7' => 9000,
    '8x10' => 15000,
    '9x12' => 20000
  }

  def self.all
    PRICES.to_a
  end

end
