
def random_sentence(inp)
  placeholder = ""
  #add each segment of the string
  str = ""
  #use helper function each time there is an option
  ltr_arr = inp.chars
  #iterate through the characters to find unique chars
  e_count = 0
  open_count = 0
  #keep track of last open brace
  last_open = 0
  ltr_arr.each_with_index do |ltr, idx|
    if ltr == "{"
      last_open = idx
      open_count += 1
    elsif ltr == "}"
      # returns a option from the choices
      e_count += 1
      #take the string from the start of last open to current idx - 1 and split by "|"
      res = inp[(last_open + 1)..(idx - 1)].split("|").shuffle[0]
      if placeholder.length != 0
        res = (placeholder + inp[(last_open + 1)..(idx - 1)]).split("|").shuffle[0]
      end
       if open_count == e_count
         str += res
         placeholder = ""
       else
         last_open = idx
         placeholder += res
       end
    elsif open_count == e_count
      # adds the non option text
      str += ltr
    end
  end
  str
end

#helper randomly returns one of the options


p random_sentence("{I am|I'm} {working on|starting} this {online |}interview. I hope Cortx thinks I am {{very|extremely} qualified|great|awesome}{!|.}")
