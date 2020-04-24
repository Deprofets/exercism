class PhoneNumber
  def self.clean(str)
    digits = str.scan(/\d/)

    return nil if !(digits.size == 11 && digits.first == "1") && digits.size != 10
    clean = str.scan(/1?\D*([2-9]\d{2})\D*([2-9]\d{2})\D*(\d{4})/).flatten

    return nil if clean.size != 3
    clean.join
  end
end
