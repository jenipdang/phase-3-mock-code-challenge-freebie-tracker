class Company < ActiveRecord::Base
    #association 
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        Freebie.create(item_name: item_name, value: value, dev: dev, company: self)
    end
    #-- rake console --#
    # Company.first.give_freebie(1, "Gift Card", 50)

    def self.oldest_company
        self.all.sort_by(&:founding_year).first
    end
    #-- rake console --#
    # Company.all => returns a collection of all the companies 
    # Company.all.sort_by(&:founding_year) => returns a collection of all the companies sorted by founding year in asc order
    # Company.all.sort_by.(&:founding_year).first => returns oldest company from the collection
end
