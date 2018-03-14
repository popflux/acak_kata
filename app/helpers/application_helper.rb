module ApplicationHelper
  def string_shuffle(w)
    w.split("").shuffle.join
  end
end
