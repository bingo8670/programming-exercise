=begin
给定人口基数，增长率，新增人数，及达到的人口数，算出需要的年数。
In a small town the population is p0 = 1000 at the beginning of a year. The population regularly increases by 2 percent per year and moreover 50 new inhabitants per year come to live in the town. How many years does the town need to see its population greater or equal to p = 1200 inhabitants?

At the end of the first year there will be:
1000 + 1000 * 0.02 + 50 => 1070 inhabitants

At the end of the 2nd year there will be:
1070 + 1070 * 0.02 + 50 => 1141 inhabitants (number of inhabitants is an integer)

At the end of the 3rd year there will be:
1141 + 1141 * 0.02 + 50 => 1213

It will need 3 entire years.
=end

def nb_year(p0, percent, aug, p)
  p_x = (p0 * (1 + percent * 0.01) + aug).to_i
  p_x >= p ? 1 : 1 + nb_year(p_x, percent, aug, p)
end
