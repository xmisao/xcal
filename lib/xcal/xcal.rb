module Xcal
  BLUE = "\e[34m"
  RED = "\e[31m"
  REVERSE = "\e[7m"
  CLEAR = "\e[0m"

  def red(str)
    RED + str + CLEAR
  end

  def blue(str)
    BLUE + str + CLEAR
  end

  def reverse(str)
    REVERSE + str + CLEAR
  end

  URL = 'https://www.google.com/calendar/ical/ja.japanese%23holiday%40group.v.calendar.google.com/public/basic.ics'

  MONTH_TEMPLATE = [
    "    January %    ",
    "   February %    ",
    "      March %    ",
    "      April %    ",
    "        May %    ",
    "       June %    ",
    "       July %    ",
    "     August %    ",
    "  September %    ",
    "    October %    ",
    "   November %    ",
    "   December %    "
  ]

  MONTH_DAY = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  ROWS = 6
  WEEK = 7
  MONTH = 3
  SPACE = 2

  def header
    [red('Su'), 'Mo', 'Tu', 'We', 'Th', 'Fr', blue('Sa')]
  end

  def get_japan_holidays()
    holidays = {}
    ical = open(URL){|f| f.read}
    cals = Icalendar::Calendar.parse(ical)
    cals.each{|cal|
      cal.events.each{|event|
        start = event.dtstart

        y = start.year
        m = start.month
        d = start.day
        
        holidays[y] = {} unless holidays[y]
        holidays[y][m] = {} unless holidays[y][m]
        holidays[y][m][d] = true
      }
    }

    holidays
  end

  def fill_calendar(year, month, table, month_offset, holidays, today)
    offset = Date.new(year, month, 1).wday - 1
    month_day = get_month_day(year, month)
    (1..month_day).each{|d|
      date = Date.new(year, month, d)

      day = sprintf('%2d', d)
      if is_holiday?(year, month, d, holidays)
        day = red(day)
      elsif date.wday == 6
        day = blue(day)
      elsif date.wday == 0
        day = red(day)
      end

      if today == date
        day = reverse(day)
      end

      table[(offset + d) / 7][month_offset + date.wday] = day
    }
  end

  def is_holiday?(y, m, d, holidays)
    holidays[y] and holidays[y][m] and holidays[y][m][d]
  end

  def month_header(y, m)
    MONTH_TEMPLATE[m - 1].sub('%', sprintf('%4d', y))
  end

  def get_month_day(y, m)
    day = MONTH_DAY[m - 1]
    if m == 2 and Date.leap?(y)
      day += 1
    end
    day
  end

  def main()
    japan_holidays = get_japan_holidays()

    table = Array.new(ROWS){
      Array.new(WEEK * MONTH + SPACE){|i|
        (i + 1) % 8 == 0 ? '' : '  ' 
      }
    }

    today = Date.today
    last_month = today << 1
    next_month = today >> 1

    fill_calendar(last_month.year, last_month.month, table, 0, japan_holidays, today)
    fill_calendar(today.year, today.month, table, 8, japan_holidays, today)
    fill_calendar(next_month.year, next_month.month, table, 16, japan_holidays, today)

    month_headers = [
      month_header(last_month.year, last_month.month),
      month_header(today.year, today.month),
      month_header(next_month.year, next_month.month)
    ]
    puts month_headers.join('  ')

    puts header.join(' ') + '  ' + header.join(' ') + '  ' + header.join(' ')

    table.each{|row|
      puts row.join(' ')
    }
  end
end
