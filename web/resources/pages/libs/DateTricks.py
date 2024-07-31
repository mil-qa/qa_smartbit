from datetime import date

class DateTricks():
    def get_start_date(self):
        today = date.today()
        fdate = today.strftime('%d%m%Y')
        print(fdate)

        a_date = []
        for number in fdate:
            a_date.append(number)
        return a_date