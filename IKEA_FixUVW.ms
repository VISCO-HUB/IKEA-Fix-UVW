macroScript IKEA_FixUVW
category:"[IKEA]"
toolTip:"Fix UVW"
(
	fn errorMessage = messageBox "Unwrap not applyed!" title: "Warning!"
		
	fn isGooPos i u = 
	(	
		p = u.getVertexPosition currentTime i
		if(p.x < 0 or p.y < 0) do return false
		return true
	)
	
	fn selectBadElements u =
	(					
		c = u.NumberVertices()

		v = #()
		
		progressStart ("Detect wrong elements...")
		escapeEnable
		for i in 1 to c where isGooPos i u == false do 
		(
			progressUpdate (100 * i / c)
			append v i
		)
		progressEnd()
		
		u.selectVertices (v as bitarray)
		u.vertToFaceSelect() 
		u.selectElement()
	)

	fn fixUVW =
	(
		-- Move selected in to center
		
		u = selection[1].modifiers[#unwrap_uvw]
		if (classOf u != Unwrap_UVW) do return errorMessage()

		selectBadElements u
		
		u.snapPivot 2
		c = u.getSelCenter()
		o = u.getPivotOffset()
		
		m = [0, 0, 0] - c - o
		u.moveSelected m
		
		u.edit()
	)

	fixUVW()
)