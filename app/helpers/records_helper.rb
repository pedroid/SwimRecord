module RecordsHelper
  def program_id_to_ascii_txt(program_id)
    case program_id
    when 1
      return "freestyle"
    when 2
      return "breaststroke"
    when 3
      return "backstroke"
    when 4
      return "butterfly"
    else
      return "others"
    end
  end

  def property_id_to_ascii_txt(property_id)
    case property_id
    when 1
      return "self-training"
    when 2
      return "contest"
    else
      return "others"
    end
  end

  def uploader_to_ascii_txt(user_id)
    @users.each do |user|
      if user.id == user_id
        return user.name
      end
    end
  end
end
