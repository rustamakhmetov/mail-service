class Message < ApplicationRecord
  TEMPLATE_ATTRS = /{{(.*?)}}/
  
  validates :title, presence: true, uniqueness: true
  validates :text, presence: true

  def make(object)
    validate_object!(object)
    return nil unless self.errors.empty?
    self.text.gsub(TEMPLATE_ATTRS) do |attr|
      object.try(Regexp.last_match[1].to_sym)
    end
  end
  
  private
  
  def validate_object!(object)
    attrs = text.scan(TEMPLATE_ATTRS).flatten.uniq
    klass = object.class
    attrs.each do |attr|
      unless klass.attribute_method?(attr.to_sym)
        self.errors.add(:base, "#{attr.capitalize} not exists")
      end
    end
  end
  
end
