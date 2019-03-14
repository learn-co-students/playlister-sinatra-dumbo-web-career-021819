class Genre < ActiveRecord::Base



  def slug #Taylor Swift
    arr = self.name.split(" ") #["Taylor", "Swift"]
    new_arr = arr.map do |name|
      name.downcase
    end
    new_arr.join("-")
  end #taylor-swift

  def self.find_by_slug(slug_name) #taylor-swift
    arr = slug_name.split("-") #["taylor", "swift"]
    final_name = arr.join(" ").titleize
    name = Genre.where("name LIKE ?",final_name)
    name
  end
end
