class Setting < ApplicationRecord
  # Attachments using ActiveStorage
  has_one_attached :icon
  has_one_attached :banner

  validate :single_record_limit
  validate :icon_validations
  validate :banner_validations

  private

  def single_record_limit
    if Setting.count > 0 && new_record?
      errors.add(:base, "Only one record is allowed")
    end
  end

  def icon_validations
    if icon.attached?
      unless icon.content_type.in?(%w[image/jpg image/jpeg image/png image/gif image/webp image/bmp image/tiff])
        errors.add(:icon, "must be a valid image format")
      end
      if icon.byte_size > 5.megabytes
        errors.add(:icon, "should be less than 5 MB")
      end
    end
  end

  def banner_validations
    if banner.attached?
      unless banner.content_type.in?(%w[image/jpg image/jpeg image/png image/gif image/webp image/bmp image/tiff])
        errors.add(:banner, "must be a valid image format")
      end
      if banner.byte_size > 5.megabytes
        errors.add(:banner, "should be less than 5 MB")
      end
    end
  end
end
