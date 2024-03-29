module MunicipeValidations
  extend ActiveSupport::Concern

  included do
    validates :full_name, :status, presence: true
    validates :email, :birth_date, :telephone, presence: true
    validates :cpf, presence: true, uniqueness: true
    validates :cns, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

    validate  :validate_cpf
    validate  :validate_cns
    validate  :validate_birth_date
  end

  private

  def validate_cpf
    return if cpf.blank?

    unless CPF.valid?(self.cpf)
      error_message = I18n.t("activerecord.attributes.municipe.invalid_cpf")
      self.errors.add(:cpf, error_message)
    end
  end

  def validate_cns
    return if cns.blank?

    unless cns.match?(/\A\d{15}\z/)
      error_message = I18n.t("activerecord.attributes.municipe.invalid_cns")
      self.errors.add(:cns, error_message)
    end
  end

  def validate_birth_date
    return if birth_date.blank?

    unless birth_date.is_a?(Date)
      error_message = I18n.t("activerecord.attributes.municipe.invalid_birth_date")
      errors.add(:birth_date, error_message)
    end

    unless birth_date <= Date.current
      error_message = I18n.t("activerecord.attributes.municipe.cant_be_in_the_future")
      errors.add(:birth_date, error_message)
    end
  end
end
