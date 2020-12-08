=begin
1.Understand problem
Input: an array of hashes
Output: an array of hashes, ordered by year, earliest to latest
Rules:
-Explicit:
-Implicit:
2.Examples

3.Data structure

4.Algorithm

=end
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |hash|
  hash.map do|key, value|
    if key == :published
      value.to_i
    end
  end
end

#textbook solution

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |book|
  book[:published].to_i
end