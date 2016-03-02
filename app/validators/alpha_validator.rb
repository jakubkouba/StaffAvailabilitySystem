class AlphaValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless value =~ /\A[A-Za-z\s]+\z/
      record.errors[attribute] << (options[:message] || 'Only alphabet characters are allowed')
    end
  end

end