class Password < Hanami::Entity
  def expired?
    return false unless available_until

    available_until < Time.now
  end
end
