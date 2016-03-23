# In initialize create a Meetup obj i.e date 1st day of the month.
# In day method, use the schedule symbol to get to the start date of the interested chunk of 7 days.
# Using weekday, figure out which of the next 7 days matches

class Meetup
	require 'date'
	def initialize(month, year)
		@month = month
		@year  = year
		@schedule_start_day = {
      first: 1,
      second: 8,
      third: 15,
      fourth: 22,
      last: -7,
      teenth: 13
    }
	end

	def day(weekday, schedule)
		date = Date.new(@year, @month, @schedule_start_day[schedule])
		(date..(date+6)).detect  {|day| day.public_send(weekday.to_s + '?')}
	end
end
