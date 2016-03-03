module ModelMacros

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def is_expected_call_before_save(obj, *actions)
      actions.each do |action|
        it "triggers ##{action} before save" do
          expect(obj).to respond_to(action)
          obj.save
        end
      end
    end
  end

end