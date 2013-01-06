# encoding: utf-8
module QuestionsHelper
  def classified_players
    { "门将" => Player.where(position: "门将").collect{|p| [p.name, p.id]},
      "后卫" => Player.where(position: "后卫").collect{|p| [p.name, p.id]},
      "前锋" => Player.where(position: "前锋").collect{|p| [p.name, p.id]},
      "中场" => Player.where(position: "中场").collect{|p| [p.name, p.id]},
      "教练" => Player.where(position: "教练").collect{|p| [p.name, p.id]}
    }
  end
end
