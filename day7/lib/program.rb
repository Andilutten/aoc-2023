module Program

  def self.star_one(lines)
    lines.sort do |line1, line2| 
      diff = self.hand_strength(line2) - self.hand_strength(line1)
      diff != 0 ? diff : self.compare_high_cards(line2, line1)
    end.reverse.map.with_index(1) do |line, index|
      bid = line.scan(/(\d+)$/).flatten.first.to_i
      bid * index
    end.sum
  end

  def self.compare_high_cards(hand1, hand2)
    if hand1[0] == hand2[0]
      return self.compare_high_cards hand1[1..], hand2[1..]
    end
    self.card_to_value(hand1[0]) - self.card_to_value(hand2[0])
  end

  def self.star_two(lines)
    lines.sort do |line1, line2| 
      diff = self.hand_strength_with_jokers(line2) - self.hand_strength_with_jokers(line1)
      diff != 0 ? diff : self.compare_high_cards(line2, line1)
    end.reverse.map.with_index(1) do |line, index|
      bid = line.scan(/(\d+)$/).flatten.first.to_i
      bid * index
    end.sum
  end

  def self.hand_strength(line)
    hand_str = line.scan(/^([2-9TJQKA]+)/).flatten.first

    jokers = hand_str.gsub("J").count

    if jokers > 0 && jokers < 5
      hand_str = hand_str.gsub "J", ""
      largest = hand_str[0]
      hand_str.split("").reduce({}) do |memo, card|
        if memo[card].nil?
          memo[card] = 0
        end
        memo[card] += 1
        if memo[card] > memo[largest]
          largest = card
        end
        memo
      end
      hand_str = hand_str + (largest * jokers)
    end

    hand     = []
    loop do 
      break if hand_str.length == 0
      amount = hand_str.gsub(hand_str[0]).count
      if amount > 1
        hand.push amount
      end
      hand_str = hand_str.gsub hand_str[0], ""
    end
    if hand.length == 1
      hand.push 0
    end
    hand = hand.sort.reverse
    hand.map(&:to_s).join("").to_i
  end

  def self.hand_strength_with_jokers(line)
    hand_str = line.scan(/^([2-9TJQKA]+)/).flatten.first
    hand     = []
    loop do 
      break if hand_str.length == 0
      amount = hand_str.gsub(hand_str[0]).count
      if amount > 1
        hand.push amount
      end
      hand_str = hand_str.gsub hand_str[0], ""
    end
    if hand.length == 1
      hand.push 0
    end
    hand = hand.sort.reverse
    hand.map(&:to_s).join("").to_i
  end

  def self.card_to_value(card, star_two = false)
    if card.match /\d/
      return card.to_i
    end

    cards = {
      T: 10,
      J: star_two ? 1 : 11,
      Q: 12,
      K: 13,
      A: 14
    }
    cards[card.to_sym]
  end
end
