class Board < ApplicationRecord

 scope :all_notice, ~> {Notice.all}

end
