enum SupportedLanguage { pl, en }

class MonthAndWeekNames {
  var monthWeekNames = {
    SupportedLanguage.pl: {
      'month': [
        "styczeń",
        "luty",
        "marzec",
        "kwiecień",
        "maj",
        "czerwiec",
        "lipiec",
        "sierpień",
        "wrzesień",
        "październik",
        "listopad",
        "grudzień",
      ],
      "week": [
        "poniedziałek",
        "wtorek",
        "środa",
        "czwartek",
        "piątek",
        "sobota",
        "niedziela",
      ],
    },
    SupportedLanguage.en: {
      "month": [
        "january",
        "february",
        "march",
        "april",
        "may",
        "june",
        "july",
        "august",
        "september",
        "october",
        "november",
        "december",
      ],
      "week": [
        "monday",
        "tuesday",
        "wednesday",
        "thursday",
        "friday",
        "saturday",
        "sunday",
      ],
    },
  };

  String getMonthName(int month, SupportedLanguage lang) {
    if (month < 0 || month > 12) {
      return "Error: Invalid month index provided";
    }
    return monthWeekNames[lang]!["month"]![month];
  }

  String getWeekName(int day, SupportedLanguage lang) {
    if (day < 0 || day > 6) {
      return "Error: Invalid week index provided";
    }
    return monthWeekNames[lang]!["week"]![day];
  }
}
