foster_placements = 4400.0; # stat wales
prop_16_17 =  0.1575;
pct_in_wir = 0.23
decay = 0.0
avg_cost = 13800.0
join_per_year = foster_placements * (prop_16_17/2) * pct_in_wir
stock = join_per_year * 2
cost = stock*avg_cost
puts "join_per_year #{join_per_year} stock #{stock} cost #{cost}\n"

weeks = [ 13.0, 32.5, 52.0, 52.0*2, 52.0*3 ]
weeks2 = [ 13.0, 32.5, 52.0, 52.0, 52.0 ]
props = [ 22.0, 33.0, 15.0, 15.0, 15.0 ]
wt = 0.0
n = stock
5.times{
        |p|
        wp = weeks2[p]/52.0 
        ps = props[p]/100.0 
        puts "[#{p}] wp = #{wp} ps #{ps}\n"
        wt += wp * ps  
}

people = join_per_year * wt 
cost =  people * avg_cost
puts "people #{people} decayed cost #{cost} wt #{wt}"

costs = [ 3300000, 1310000, 782000 ]
gains = [ 52000.0/2, 52000.0, 52000.0*2 ]

puts "\t"
gains.each{
        |gain|
        puts( "#{gain}\t")

}
puts("\n")

costs.each{
        |cost|
        s = "COST #{cost}"
        gains.each{
                |gain|
                yrs = cost/gain
                s += "\t#{yrs}"
        }
        puts( s )
}
