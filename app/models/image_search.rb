class ImageSearch
  include ActiveModel::Model

  def initialize(opts = {})
   @front = opts[:front]
   @back = opts[:back]
  end

  private

  attr_accessor :front, :back

end
