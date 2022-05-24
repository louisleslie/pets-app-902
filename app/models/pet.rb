class Pet < ApplicationRecord
    SPECIES = %w(Dog Cat Snake Lizard Rat Spider)
    validates :name, presence: true
    validates :species, inclusion: {in: SPECIES}

    def days_since_found
        (Date.today - self.date_found).to_i
    end
end
