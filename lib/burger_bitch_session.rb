class BurgerBitchSession
  def self.create(value)
    cookies[:burgerbitch] = {
      value: value,
      expires: 1.week.from_now,
      domain: '172.16.10.26'
    }
  end
end