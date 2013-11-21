#!/usr/bin/ruby

require './racional.rb'

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
    
  class MatrixDens < Matrix
    attr_reader :matrixD
    
     def initialize(rows,cols)
         @matrixD = Array.new(rows) {Array.new(cols)}
         super
     end
  end
  
#   class SparseVector
#    attr_reader :vector
#    
#       def initialize(h = {})
# 	  @vector = Hash.new(0)
#           @vector = @vector.merge!(h)
#       end
# 
#       def [](i)
#             @vector[i]
#         end
#     end
# 
  class SparseMatrix < Matrix
#     attr_reader :matrixD
#         
#       def initialize(rows,cols, h = {})
# 	  @matrixD  = Hash.new({})
#           for k in h.keys do
#              if h[k].is_a? SparseVector
# 		@matrixD[k] = h[k]
#              else
#                     @matrixD[k] = SparseVector.new(h[k])
#                 end
#             end
#             super(rows,cols)
#         end
# 
#         def [](i)
#             @matrixD[i]
#         end
# 	
# 	def mostrarD
# 	  @matrixD.each{|key, value| puts " #{key} is #{value}" } 
# 	end
#     end
  
  def initialize(h = {})
   @matrixD = Hash.new({})
    for i in h.keys do
            @matrixD[i] = h[i]
    end
  end
  
  def mostrarD
    @matrixD.each{|key, value| puts "Fila #{key} Columna #{value}" } 
  end
  
end
  
  

 puts "--Practica 10--" 
 puts
 ma = MatrixDens.new(2,2)
 ma.rellenar([[Fraccion.new(1,2),2],[1,Fraccion.new(1,2)]])
 puts "Matriz A"
 ma.mostrar()
 puts
 mb = MatrixDens.new(2,2)
 mb.rellenar([[1,1],[1,1]])
 puts "Matriz Densa"
 mb.mostrar()
 puts
 mr = MatrixDens.new(2,2)
 mr = ma + mb
 puts "Suma Matrices"
 mr.mostrar()
 puts
 mr = ma - mb
 puts "Resta de Matrices"
 mr.mostrar()
 puts
 mc = SparseMatrix.new({1 => { 0 => 1, 2 => 7}, 2 => { 1 => 3}})

 puts "Matriz Dispersa"
 mc.mostrarD()