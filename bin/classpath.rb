classpath=""
Dir.foreach("#{Dir.pwd}") do|a|
  if  a !="." && a!=".."
    puts "export CLASSPATH=$CLASSPATH:"+Dir.pwd+"/"+a+":"
  end
end
