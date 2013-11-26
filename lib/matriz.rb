#!/usr/bin/ruby

require './racional.rb'

 class Matrix
  attr_reader:m, :n, :val, :matrix
    def initialize(m,n)
      @m = m
      @n = n
      @matrix = Array.new(@m){Array.new(@n){0}}
    end
       
        
 end
    
 
 class MatrixDens < Matrix
    attr_accessor :matrixD
    
     def initialize(rows,cols)
         @matrixD = Array.new(rows) {Array.new(cols)}
          super
     end
     
  def rellenar (val)
      for i in 0...@m
	for j in 0...@n
	  self.matrixD[i][j] = val[i][j] 
	end
      end
    end    
    
    def mostrar
      mr = " "
      for i in 0...@m
        mr << " "
        for j in 0...@n
         mr << "#{matrixD[i][j]} "
        end
        mr << "\n "
      end
      print mr
      return mr
    end
     
    def + (other)
#       if (other.is_a?MatrixDens)
	aux = Array.new(@m){Array.new(@n){0}}
	for i in 0...@m do
	  for j in 0...@n do
	     aux[i][j] = self.matrixD[i][j] + other.matrixD[i][j]
	  end
	end
	mr = MatrixDens.new(other.m, other.n)
	mr.rellenar(aux)
	return(mr)
#       else
# 	hash_aux = self.matrixD.merge(other.matrixD){|key, val1, val2| val1.merge(val2){|key2, val1_2, val2_2|val2_2 + val1_2}}
# 	SparseMatrix.new(self.fil, self.col, hash_aux)
    end
      
     
    def - (other)
#       if (other.is_a?MatrixDens)
       aux = Array.new(@m){Array.new(@n){0}}
	for i in 0...@m do
	  for j in 0...@n do
	    aux[i][j] = self.matrixD[i][j] - other.matrixD[i][j]
	  end
	end
	mr = MatrixDens.new(other.m, other.n)
	mr.rellenar(aux)
	return (mr)
#       else
#        puts "BENCHOD"
#       end
    end
    
 end 
  
 class SparseMatrix < Matrix
  
  def initialize(a,b,h = {})
    @matrixD = Hash.new({})
    super(a,b)
    for i in h.keys do
              @matrixD[i] = h[i]
    end
  end
  
  def mostrarD
    @matrixD.each{|key, value| puts "Fila #{key} Columna #{value}" } 
  end
  
  
  def + (other)
    if (other.is_a?SparseMatrix)
      hash_aux = self.matrixD.merge(other.matrixD){|key, val1, val2| val1.merge(val2){|key2, val1_2, val2_2|val2_2 + val1_2}}
      SparseMatrix.new(self.fil, self.col, hash_aux)
  
    else
      aux = Array.new(@m){Array.new(@n){0}}
	for i in 0...@m do
	  for j in 0...@n do
	     aux[i][j] = self.matrix[i][j] + other.matrix[i][j]
	  end
	end
      mr = Matrix.new(other.mmr, other.n)
      mr.rellenar(aux)
      return (mr)
    end
  end
   
  
  def - (other)
    if (other.is_a?SparseMatrix)
      hash_aux = self.data.merge(other.data){|key, val1, val2| val1.merge(val2){|key2, val1_2, val2_2|val2_2 + val1_2}}
      SparseMatrix.new(self.fil, self.col, hash_aux)
  
   else
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
   
   
end
  
  

 puts "--Practica 10--" 
 puts
 ma = MatrixDens.new(2,2)
 ma.rellenar([[Fraccion.new(1,2),2],[1,Fraccion.new(1,2)]])
 puts "Matriz Densa A"
 ma.mostrar()
 puts
 
 mb = MatrixDens.new(2,2)
 mb.rellenar([[1,1],[1,1]])
 puts "Matriz Densa B"
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
 
 mc = SparseMatrix.new(2,2,{0 => { 0 => 1}, 1 => { 1 => 3}})
 puts "Matriz Dispersa"
 mc.mostrarD()
 puts
 

#  mr = MatrixDens.new(2,2)
#  mr = mb + mc
#  puts "Suma Matriz Densa con Dispersa"
#  mr.mostrar()
#  puts
#  puts "Resta Matriz Densa con Dispersa"
#  mr = MatrixDens.new(2,2)
#  mr = mb + mc
#  mr.mostrar()