class Credit

  attr_reader :card_number
  attr_reader :valid

  def initialize(card)
    @card_number = card
    @valid = false
  end

  def luhn_algorithm

    card = []
    sum = 0

    @card_number.each_char do |x|
      digit = x.to_i
      card.push(digit)
    end

    counter = 0

    card.reverse!

    card.each do |x|

      if counter%2 != 0
        x = x * 2

        if x > 9
          x = x.to_s
          x = x[0].to_i + x[1].to_i
        end

      end

      card[counter] = x
      sum = sum + x
      counter += 1

    end

    if sum%10 == 0
      @valid = true
      puts "Card number #{@card_number} is VALID!"
    else
      puts "Card number #{@card_number} is INVALID!"
    end

  end

end


check1 = Credit.new("4929735477250543").luhn_algorithm
check2 = Credit.new("5541808923795240").luhn_algorithm
check3 = Credit.new("4024007136512380").luhn_algorithm
check4 = Credit.new("6011797668867828").luhn_algorithm



check5 = Credit.new("5541801923795240").luhn_algorithm
check6 = Credit.new("4024007106512380").luhn_algorithm
check7 = Credit.new("6011797668868728").luhn_algorithm


#"AMEX card check"

check_AMEX_1 = Credit.new("342804633855673").luhn_algorithm
check_AMEX_2 = Credit.new("342801633855673").luhn_algorithm
