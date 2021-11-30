require 'set'

def compareRowsandColumns(array)
    const = Array(1..9).to_set
    array.each do |arr|
        temp = arr.to_set 
        if temp != const 
            return false 
        end
    end
    return true 
end

def sudoku_validator(arr)
    cols = []
    rows = []
    len = arr.size
    for i in 0..len-1 do
        col = []
        row = [] 
        for j in 0..len-1 do 
            col.push(arr[j][i])
            row.push(arr[i][j])
        end
        cols.push(col)
        rows.push(row)
    end
    isValid_rows = compareRowsandColumns(rows)
    isValid_columns = compareRowsandColumns(cols)
    i = 0 
    j = 0 
    blocks = []
    while i < len 
        while j < len 
            blocks.push(arr[i][j..j+2] + arr[i+1][j..j+2] + arr[i+2][j..j+2]) #[1,5,2,7,3,9,4,6,8]
            j += 3
        end  
        i += 3
    end  
    subMatrix = compareRowsandColumns(blocks)
    if subMatrix and isValid_columns and isValid_rows 
        p true
    else
        p false 
    end         
    
end

sudoku_validator([
    [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
    [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
    [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
    [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
    [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
    [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
    [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
    [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
    [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
  ]
  )
  sudoku_validator([
    [ 1, 1, 2, 4, 8, 9, 3, 7, 6 ],
    [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
    [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
    [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
    [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
    [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
    [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
    [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
    [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
  ]) 
  
# matrix = Array.new 
# for i in 0..8 do 
#     temp = gets 
#     arr = temp.split(' ').map(&:to_i)
#     matrix.push(arr)  
# end 
# sudoku_validator(matrix)
