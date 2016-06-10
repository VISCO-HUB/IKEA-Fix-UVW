/*
[INFO]

NAME = IKEA Fix UVW
VERSION = 1.0.1
AUTHOR = MastaMan
DEV = ViscoCG
HELP = \help\IKEA_fixUVW.html

[1.0.0]

* First release =

[1.0.1]
* Adopted for new Scripts Launcher=

[ABOUT]

Detect elements in Unwrap which fly in negative position.=
Then set correct positon for this elements=

[SCRIPT]

*/

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
	if(selection[1] == undefined) do return messageBox "Please select object!" title: "Warning"
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
