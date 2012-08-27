# encoding: utf-8
module QuestionsHelper
  def classified_players
    { "门将" => Player.where(position: "goalkeeper").collect{|p| [p.name, p.id]},
      "后卫" => Player.where(position: "defender").collect{|p| [p.name, p.id]},
      "中场" => Player.where(position: "mid-field").collect{|p| [p.name, p.id]},
      "前锋" => Player.where(position: "forward").collect{|p| [p.name, p.id]},
      "教练" => Player.where(position: "coach").collect{|p| [p.name, p.id]}
    }
  end
end
