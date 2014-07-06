class NonExistentObjectError < RuntimeError

  def to_s
    "Can not set value for nonexistent object's attributes"
  end

end