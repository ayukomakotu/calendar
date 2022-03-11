module ApplicationHelper
    # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "dedama_jiman"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  #祝日の判定
  def holiday_check(date)
    HolidayJapan.check(Date.new(date.year, date.month, date.day))
  end
  #祝日の表示
  def holiday_name(date)
    HolidayJapan.name(Date.new(date.year, date.month, date.day))
  end
end
