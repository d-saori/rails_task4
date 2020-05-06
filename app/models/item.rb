class Item < ApplicationRecord
  # itemは1人のuserに所属している→belongs_to、userも単数形
  belongs_to :user
end
