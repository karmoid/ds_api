
class Page < ApplicationRecord
  has_many :playitems

  def name
    url
  end

end
