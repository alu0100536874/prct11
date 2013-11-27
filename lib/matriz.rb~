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
  
  attr_reader:hash , :matrixD
   
  def initialize(a,b)
    super(a, b)
    nelementos= (a * b)*0.6 
    psincero = 0
    @hash = Hash.new(0) 
  end
  
  def mostrarD
    @matrixD.each{|key, value| puts "  #{key} #{value}" } 
  end
  
  
  def rellenar(val)
    nceros = 0
    @matrixD = Array.new(val)     
     for i in 0...@m do
       for j in 0...@n do
           if (val[i][j]==0)
               nceros=nceros+1
            else
               psincero="[#{i}][#{j}]"
		if (val[i][j].is_a?Fraccion)
		  a = val[i][j].num
		  b = val[i][j].denom
		  @hash[psincero] = Rational(a,b)             
		else
		  @hash[psincero] = val[i][j]
		end
	    end
	end
      end
  end
  
  
  def + (other)
    if (other.is_a?SparseMatrix)
      hash_aux = self.matrixD.merge(other.matrixD){|key, val1, val2| val1.merge(val2){|key2, val1_2, val2_2|val2_2 + val1_2}}
      mr =SparseMatrix.new(self.fil, self.col, hash_aux)
      return (mr)
  
    else
       aux = Array.new(@m){Array.new(@n){0}}
	for i in 0...@m do
	  for j in 0...@n do
	     aux[i][j] = self.matrixD[i][j] + other.matrixD[i][j]
	  end
	end
      mr = MatrixDens.new(other.m, other.n)
      mr.rellenar(aux)
      return (mr)
    end
  end
   
  
  def - (other)
    if (other.is_a?SparseMatrix)
      hash_aux = self.data.merge(other.data){|key, val1, val2| val1.merge(val2){|key2, val1_2, val2_2|val2_2 + val1_2}}
      mr = SparseMatrix.new(self.fil, self.col, hash_aux)
      return (mr)
      
    else
      aux = Array.new(@m){Array.new(@n){0}}
	for i in 0...@m do
	  for j in 0...@n do
	     aux[i][j] = self.matrix[i][j] - other.matrix[i][j]
	  end
	end
      mr = MatrixDens.new(other.m, other.n)
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
 
 mr = MatrixDens.new(2,2)
 mr = ma - mb
 puts "Resta de Matrices"
 mr.mostrar()
 puts

 mc = SparseMatrix.new(2,2)
 mc.rellenar([[1,0],[0,0]])
 puts "Matriz Dispersa"
 mc.mostrarD()
 puts
 
# 
 mr = MatrixDens.new(2,2)
 mr = mc + mb
 puts "Suma Matriz Densa con Dispersa"
 mr.mostrar()
 puts
 
 puts
 puts "Resta Matriz Dispersa con Densa"
 mr = MatrixDens.new(2,2)
 mr = mb - mc
 mr.mostrar()