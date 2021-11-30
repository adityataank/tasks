def join_consecutive(word1,word2)
    n1 = word1.size 
    n2 = word2.size 
    final_result = ""
    k = 0 
    count = 0 
    for i in 0..n1-1 do
        if word1[i] != word2[k]
            final_result += word1[i]
        else  
            final_result += word1[i]
            k += 1
            count += 1  
        end 
    end 
    final_result += word2[k..n2]
    return final_result,count  
end




def join(word_list)
    joined_word = word_list[0]
    min_count = 999999 
    for i in 0..word_list.size-1 do 
        joined_word , count = join_consecutive(joined_word,word_list[i])
        if count < min_count 
            min_count = count 
        end  
    end
    return joined_word,min_count
end


p join(["oven", "envier", "erase", "serious"])
p join(["move", "over", "very"])
p join(["to", "ops", "psy", "syllable"]) 

