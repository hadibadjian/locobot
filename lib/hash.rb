class Hash

  def side_element(key, increment)
    keys = self.keys
    index = (keys.index(key) + increment) % keys.count
    self[keys[index]]
  end

end
