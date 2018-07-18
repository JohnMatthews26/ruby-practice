#recursively go through the sentence every time there is a new set of potential options
#resulting array will contain subarrays of potential options for each portion of the sentence
def random_sentence(inp, res = [])
    open_count = 0
    end_count = 0
    str = ""
    options = []
    ltr_arr = inp.chars
    ltr_arr.each_with_index do |ltr, idx|
        if ltr == "{"
            open_count += 1
            if str.length != 0 && (open_count - end_count) == 1
                options.push(str)
                random_sentence(inp[idx..-1], options)
            elsif str.length != 0
                str += random_sentence(inp[idx..-1], options)
            end
        elsif ltr == "}"
            end_count += 1

        elsif ltr == "|"
            options.push(str)
            str = ""
        else
            str += ltr
        end
    end
    result_str = str

    if res.shuffle[0]
        result_str += res.shuffle[0]
    end
    result_str
end
p random_sentence("{I am|I'm} {working on|starting} this {online |}interview. I hope Cortx thinks I am {{very|extremely} qualified|great|awesome}{!|.}")
