class Search::Guide < Search::Base
  ATTRIBUTES = %i(
    city
    gender_man
    gender_woman
    license_has
    license_not
  )
  attr_accessor(*ATTRIBUTES)

  def matches
    t = ::Guide.arel_table
    results = ::Guide.all
    results = results.where(contains(t[:city], city)) if city.present?
    results = results.where(contains(t[:gender], gender)) if gender.present?
    results = results.where(contains(t[:license], license)) if license.present?

    results
  end
end