def check(start, goal, current, queue, i)
    attempt = []
      attempt << i if current == goal
    [0, 1, 2].permutation(3).each do |from, to|
      next if current[from] == 0
      test = current.dup
      test[from], test[to] = [0, test[from] - (start[to] - test[to])].max, [start[to], test[to] + test[from]].min
      attempt << check(start, goal, test, queue + [test], i + 1) unless queue.include?(test)
    end
    attempt.flatten
  end
  
  def waterjug(start, goal)
    check(start, goal, [0, 0, start.last], [], 0).min || "No solution."
  end



p waterjug([3, 5, 8], [0, 3, 5])
p waterjug([1, 3, 4],  [0, 2, 2])
p waterjug([8, 17, 20], [0, 10, 10]) 
p waterjug([4, 17, 22], [2, 5, 15]) 
p waterjug([3, 5, 8], [0, 0, 9]) 
  