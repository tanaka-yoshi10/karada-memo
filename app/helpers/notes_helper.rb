module NotesHelper
  def year_filter_select_tag(body, year = nil, options = {})
    select_tag(:year,
               options_for_select(year_filter_options(body),
                                  selected: body_url(body, year: year)),
               options)
  end

  def year_filter_options(body)
    options = [['全て', body_url(body)]]
    options.concat(body.years_noted.map { |y| ["#{y}年", body_url(body, year: y)] })
  end
end
