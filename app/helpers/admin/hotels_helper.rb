module Admin::HotelsHelper
  def default_or(obj, attr)
    obj.nil? ? "" : obj.public_send(attr)
  end

  def default_or_date_format(obj, attr, format)
    obj.nil? || obj.public_send(attr).blank? ? "-" : l(obj.public_send(attr), format)
  end
end
