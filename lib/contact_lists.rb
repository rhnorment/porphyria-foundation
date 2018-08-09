module ContactLists
  @lists = {
      import_from_apf: '1048140845',
      EPP:    '1956569763',
      AIP:    '1264276246',
      HCP:    '1496488488',
      VP:     '1598671601',
      CEP:    '1223815697',
      PCT:    '1331113000',
      HEP:    '1398729893',
      ADP:    '1586419189',
  }

  def self.[](key)
    @lists[key].dup
  end
end