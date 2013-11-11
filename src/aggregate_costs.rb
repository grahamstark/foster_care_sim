foster_placements = 4400.0; # stat wales
prop_16_18 =  0.20; # UK Stat
pct_in_wir = 0.23
decay = 0.0
avg_cost = 13800.0
join_per_year = foster_placements * (prop_16_18/3) * pct_in_wir
stock = join_per_year * 3
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

cost = join_per_year * wt * avg_cost
puts "decayed cost #{cost} wt #{wt}"
