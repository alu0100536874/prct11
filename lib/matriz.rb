#!/usr/bin/ruby

require './lib/racional.rb'

class Matrix
attr_reader:m, :n, :val, :matrix
  
 def initialize(m,n)
   @m = m
   @n = n
   @matrix = Array.new(@m){Array.new(@n){0}}
 end
    
 def rellenar (val)
   for i in 0...@m
     for j in 0...@n
      @matrix[i][j] = val[i][j] 
     end
   end
 end
 
  def mostrar
     mr = " "
    for i in 0...@m
      mr << "  "
      for j in 0...@n
        mr << "#{matrix[i][j]} "
      end
      mr << "\n "
    end
    print mr
    return mr
  end
 
 def + (other)
   aux = Array.new(@m){Array.new(@n){0}}
    for i in 0...@m do
      for j in 0...@n do
        aux[i][j] = self.matrix[i][j] + other.matrix[i][j]
      end
    end
    mr = Matrix.new(other.m, other.n)
    mr.rellenar(aux)
    return (mr)
 end
 
  def - (other)
   aux = Array.new(@m){Array.new(@n){0}}
    for i in 0...@m do
      for j in 0...@n do
        aux[i][j] = self.matrix[i][j] - other.matrix[i][j]
      end
    end
    mr = Matrix.new(other.m, other.n)
    mr.rellenar(aux)
    return (mr)
 end
 
 
end

 puts
 puts "--Practica 8--" 
#  puts
#  ma = Matrix.new(2,2)
#  ma.rellenar([[1,2],[2,3]])
#  puts "Matriz A"
#  ma.mostrar()
#  mb = Matrix.new(2,2)
#  mb.rellenar([[2,1],[3,2]])
#  puts "Matriz B"
#  mb.mostrar()
#  puts
#  puts "Suma"
#  mc = Matrix.new(2,2)
#  mc = ma + mb  
#  mc.mostrar()
#  puts "Resta"
#  mc = Matrix.new(2,2)
#  mc = ma - mb
#  mc.mostrar()
#  puts
 
