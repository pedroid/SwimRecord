module ApplicationHelper
  def get_swim_item_collection
    swim_item_collection = []
    i=1
    @swim_items.each do |swim_item|
      swim_item_collection << [swim_item.name,i]
      i = i+1
    end
    return swim_item_collection
  end
  def get_record_owner_collection
    record_owner_collection = []

  @atheletes.each do |athelete|
    record_owner_collection << [athelete.name, athelete.id]
  end
    return record_owner_collection
  end
  def get_distance_collection
    distance_collection = []
    i=1
    @swim_distances.each do |swim_distance|
      distance_collection << [swim_distance.distance,i]
      i = i+1
    end
    return distance_collection
  end

  def get_contest_collection
    contest_collection = []
    i=1
    @contests.each do |contest|
      contest_collection << [contest.name,i]
      i = i+1
    end
    return contest_collection
  end
end
