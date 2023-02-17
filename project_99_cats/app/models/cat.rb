class Cat < ApplicationRecord
    CAT_COLORS = [
        'Black',
        'White',
        'Orange',
        'Calico',
        'Tuxedo',
        'Tabby'
    ]
    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: {in: CAT_COLORS}
    validates :sex, inclusion: {in: ['M','F']}
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future 
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "cannot be in future")
        end
    end

    def age
        time_ago_in_words(birth_date)
    end

end
