class Dev < ActiveRecord::Base
    #association 
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.any? { |freebie| freebie.item_name == item_name }
    end
    #-- rake console -- #
    ## Dev.first.freebies.first.item_name => returns the first item name for the first Dev

    def give_away(dev, freebie)
        freebie.update(dev: dev) unless freebie.dev != self
    end

end
