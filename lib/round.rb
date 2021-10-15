class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.shift
    @turns.last
  end

  def number_correct
    correct_turns = 0
    @turns.each do |turn|
      correct_turns += 1 if turn.correct?
    end
    correct_turns
  end

  def number_correct_by_category(category)
    correct_category = 0
    @turns.each do |turn|
      correct_category += 1 if turn.correct? if turn.card.category == category
    end
    correct_category
  end

  def percent_correct
    (number_correct.to_f / @turns.size * 100)
  end

  def percent_correct_by_category(category)
    # this is not working but I'm leaving it for the night
    grade = 0
    category_data = turns.each do |turn|
      grade += if turn.correct? if turn.card.category == category
        (number_correct_by_category(category).to_f / category_data) * 100
      end
    end
    grade
  end
end
