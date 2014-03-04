signature TRANSLATE = 
sig
	type level 
	type access (*not the same as Frame.access*)
	
	(*type exp*)
	datatype exp = 
		Ex of Tree.exp 
		| Nx of Tree.stm
		| Cx of Temp.label * Temp.label

	(*CH6*)
	val outermost : level
	val newLevel : {parent: level, name: Temp.label, formals:bool list} -> level
	val formals : level -> access list
	val allocLocal : level -> bool -> access

	(*CH7*)
	(*val procEntryExit : {level:level, body:exp} -> unit*)
	(*structure Frame : FRAME = MipsFrame*)
	(*val getResult : unit -> Frame.frag list*)

	(*val simpleVar : access * level -> exp*)
end

structure Translate : TRANSLATE = 
struct
	structure Frame : FRAME = MipsFrame

	
	(*Should be {parent,name,formals,....}*)
	(*Formals has no StaticLink*)
	type level = {name:Temp.label,formals:bool list}
	(*type level = Frame.frame*)
	type access = level * Frame.access
	

	(*type exp = unit*)
	datatype exp = 
		Ex of Tree.exp 
		| Nx of Tree.stm
		| Cx of Temp.label * Temp.label

	val outermost = {name=Symbol.symbol(""),formals=[] : bool list}

	(*TO-DO*)
	(*Call Frame.newFrame *)
	fun newLevel {parent,name,formals} = 
		let
			val newFrame = Frame.newFrame{name=name,formals=true::formals}
		in
			{name=Symbol.symbol(""),formals=formals}
		end

	(*TO-DO*)
	fun formals level = []

	(*TO-DO*)
	fun allocLocal level = 
		let
			fun f boolean = 
				({name=Symbol.symbol(""),formals=true::nil},Frame.InFrame(0))
		in
			f
		end
end