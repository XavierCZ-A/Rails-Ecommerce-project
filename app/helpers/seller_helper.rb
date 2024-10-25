module SellerHelper
  def enum_l(record, enum_name)
    I18n.t("activerecord.attributes.#{record.class.name.underscore}.#{enum_name.to_s.pluralize}.#{record.send(enum_name)}")
  end
end
