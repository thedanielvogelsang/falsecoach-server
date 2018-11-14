module ActiveModelErrorsMerge
  refine ActiveModel::Errors do
    def merge_messages!(*others)
      others.each do |other|
        other.full_messages.each {|m| self.add(:base, m) }
      end
    end
  end
end
