
		u = selection[1].modifiers[#unwrap_uvw]
fn selectBadElements =
(	
	fn isGooPos i = 
	(	
		p = u.getVertexPosition currentTime i
		if(p.x < 0 or p.y < 0) do return false
		return true
	)
	
	c = u.NumberVertices()

	v = #()
	
	progressStart ("Detect wrong elements...")
	escapeEnable
	for i in 1 to c where isGooPos i == false do 
	(
		progressUpdate (100 * i / c)
		append v i
	)
	progressEnd()
	
	u.selectVertices (v as bitarray)
	u.vertToFaceSelect() 
	u.selectElement()
	
	
)



selectBadElements()

