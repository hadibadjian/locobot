class Hash

  def side_element(key, direction)
    keys = self.keys
    index = (keys.index(key) + direction) % keys.count
    self[keys[index]]
  end

end
