#!/usr/bin/env ruby 

require "gcd.rb"

class Fraccion

  attr_reader :num, :denom
  
  #---------------------------------------------------------------------------------------------------------------------------------

	def initialize(num,denom)
		@num = num;
		@denom = denom;
	end
	
 #---------------------------------------------------------------------------------------------------------------------------------
	
# 	def reducida
# 	  mcd = gcd(@numerador, @denominador)
# 	  if  divisor != 1
# 	    @numerador = (@numerador / mcd )      #Simplificamos el numerador
# 	    @denominador = (@denominador / mcd)   #Simplificamos el denominador
# 	  end
# 	end
# 	
  #---------------------------------------------------------------------------------------------------------------------------------
	
	def to_s
         "#{@num}/#{@denom}"
	end
	
  #---------------------------------------------------------------------------------------------------------------------------------
	
	def numerador
		return @num
	end
	
 #---------------------------------------------------------------------------------------------------------------------------------
	
	def denominador
		return @denom
	end
	
#---------------------------------------------------------------------------------------------------------------------------------
	
	def to_f
		@num.to_f / @denom.to_f #conversion de tipo a flotante mediante to_f
	end
	
#---------------------------------------------------------------------------------------------------------------------------------

	def == (fracaux)
		if(@num == fracaux.num) && (@denom == fracaux.denom)
			return true 
		else 
			return false
		end
	end
	
 #---------------------------------------------------------------------------------------------------------------------------------

	def abs
		 f= Fraccion.new(@num.abs, @denom.abs)
	end
	
  #---------------------------------------------------------------------------------------------------------------------------------
	
	def inverso
		f= Fraccion.new(@denom, @num)
	end
	
#---------------------------------------------------------------------------------------------------------------------------------
	
	def -@
	  fracaux = Fraccion.new(-@num, @denom)
	  fracaux.to_s
	end
	
  #---------------------------------------------------------------------------------------------------------------------------------

	def + (fracaux)

	  mcm = (@denom/gcd(@denom,fracaux.denom)) * fracaux.denom 
	  numr  = ((mcm/@denom) * @num) + ((mcm/fracaux.denom) * fracaux.num)
	  if numr  % mcm == 0
	    aux = numr/mcm
	  else
	    "#{numr}/#{mcm}"
	  end
	end

  #---------------------------------------------------------------------------------------------------------------------------------
	
	def - (fracaux)

	  mcm = (@denom/gcd(@denom,fracaux.denom)) * fracaux.denom 
	  numr  = ((mcm/@denom) * @num) - ((mcm/fracaux.denom) * fracaux.num)
	  if numr  % mcm == 0
	    aux = numr/mcm
	  else
	    "#{numr}/#{mcm}"
	  end
	end
	
  #---------------------------------------------------------------------------------------------------------------------------------
	
	def * (fracaux) 

	  denomr = @denom * fracaux.denom
	  numr = @num * fracaux.num
	  if numr % denomr == 0
	    numr/denomr
	  else
	    "#{numr}/#{denomr}"
	  end
	end
	
  #---------------------------------------------------------------------------------------------------------------------------------
	
	def / (fracaux)

	  denomr = @denom * fracaux.num
	  numr = @num * fracaux.denom
	  if numr % denomr == 0
	    numr/denomr
	  else
	    "#{numr}/#{denomr}"
	  end
	end

  #---------------------------------------------------------------------------------------------------------------------------------
	
	def > (fracaux)
		if (self.to_f > fracaux.to_f)
			return true
		else
			return false
		end
	end
	
  #---------------------------------------------------------------------------------------------------------------------------------
	
	def < (fracaux)
		if (self.to_f < fracaux.to_f)
			return true
		else
			return false
		end
	end

  #---------------------------------------------------------------------------------------------------------------------------------
	
	def >= (fracaux)
		if (self.to_f >= fracaux.to_f)
			return true
		else
			return false
		end
	end
	
  #---------------------------------------------------------------------------------------------------------------------------------
	
	def <= (fracaux)
		if (self.to_f <= fracaux.to_f)
			return true
		else
			return false
		end
	end
		
  #---------------------------------------------------------------------------------------------------------------------------------
	
end
