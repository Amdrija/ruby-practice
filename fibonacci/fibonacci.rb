def fibs(n)
  fibs = [1]
  fn1 = 1
  (n- 1).times do
    fibs.push(fn1)
    fn1 += fibs[-2]
  end
  fibs
end

def fibs_rec(n, fibs_arr = [])
  return fibs_arr.push(1) if n == 1
  fibs_rec(n - 1, fibs_arr)
  return fibs_arr.push(1) if n == 2
  fibs_arr.push(fibs_arr[-1] + fibs_arr[-2])
end

print fibs(8)
print fibs_rec(8)