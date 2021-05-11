class User < Player
  attr_reader :actions

  class << self
    def actions
      {
        "add" => "Add a card",
        "pass" => "Pass",
        "open" => "Open cards"
      }
    end
  end 

  def self.actions
    {
      "add" => "Add a card",
      "pass" => "Pass",
      "open" => "Open cards"
    }
  end

  def init_actions
    self.actions = self.class.actions
  end

  def show_actions
    actions.map { |key, value| "#{value} (#{key})" }.join(', ').to_s
  end

  private

  attr_writer :actions
end