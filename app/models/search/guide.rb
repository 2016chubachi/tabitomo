class Search::Guide < Search::Base
  ATTRIBUTES = %i(
    city
    gender
    license
  )
  attr_accessor(*ATTRIBUTES)

  def matches

  end
end