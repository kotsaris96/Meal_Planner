module Seeds
class WeekSeeder

  def self.populate_weeks
    last_week = Week.last&.weekday_end

    start_date = if last_week
                   Date.strptime(last_week, "%d/%m/%Y") + 3.days
                 else
                   Date.today.beginning_of_week(:monday)
                 end

    3.times do |i|
      week_start = start_date + (i * 7).days
      week_end = week_start + 4.days

      week = Week.create!(
        weekday_start: week_start.strftime("%d/%m/%Y"),
        weekday_end: week_end.strftime("%d/%m/%Y")
      )

      puts "✅ Week #{i + 1} created: #{week_start.strftime('%d/%m/%Y')} to #{week_end.strftime('%d/%m/%Y')}"

      generate_days(week_start.strftime("%d/%m/%Y"), week_end.strftime("%d/%m/%Y"))
    end
  end

  def self.generate_days(weekday_start, weekday_end)
  if weekday_start.strip.empty? || weekday_end.strip.empty?
    raise ArgumentError, "Both 'weekday_start' and 'weekday_end' must be present"
  end

  begin
    start_date = Date.strptime(weekday_start, "%d/%m/%Y")
    end_date = Date.strptime(weekday_end, "%d/%m/%Y")
  rescue ArgumentError => e
    puts "Error parsing date: #{e.message}"
    return
  end

  (0..4).each do |offset|
    day_date = start_date + offset.days

    Day.create!(
      name: day_date.strftime("%A"),
      date: day_date,
      week_id: Week.last.id
    )
  end
end
end
end
