class Float
	def float_to_i
		self.to_s.gsub('.', '').to_i
	end
end