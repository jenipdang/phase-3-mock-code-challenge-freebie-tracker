class Freebie < ActiveRecord::Base
    #assocation 
    belongs_to :dev
    belongs_to :company

    def print_details
        "#{self.dev.name} owns a #{self.item_name} from #{self.company.name}"
    end
    #-- rake console --#
    ## Freebie.first.dev.name => returns the name of first dev 
    ## Freebie.first.item_name => returns the name of the first item
    ## Freebie.first.company.name => returns the name of the first company
end
