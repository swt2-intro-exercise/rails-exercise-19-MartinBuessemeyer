class Author < ApplicationRecord

  def name
    first_name.concat(" ", last_name)
  end
end


FactoryBot.define do
  factory :author do
    # first_name { "Alan" }
    # last_name { "Turing" }
    # homepage { "http://wikipedia.de/Alan_Turing" }
  end
end
