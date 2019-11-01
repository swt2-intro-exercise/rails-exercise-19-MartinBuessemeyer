FactoryBot.define do
  def name
    first_name.concat(" ", last_name)
  end
end
