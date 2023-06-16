# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text
#  moderater_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, length: {minimum: 1}, presence: true

    belongs_to :moderater,
    foreign_key: :moderater_id,
    class_name: :User,
    inverse_of: :subs

end
