module Mongoid
  module AutoId
    extend ActiveSupport::Concern

    included do
      field :_id,  :type => Integer#, default: ->{ inc_id }
      before_create :inc_id
    end

    def inc_id
     self._id = Mongoid.default_session.command(findAndModify: "seqs",
            query: {_id:self.class.name},
            update: {"$inc" => {next:1}},
            new: true,
            upsert: true)["value"]['next'].to_s
    end
  end
end