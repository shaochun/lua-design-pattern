nsState = {}

----------------------------------------------------------------------
local class = require "class-clean"


---------------------------------------------------------------------- Context
Context = class("Context", {mpp_state = nil})
print (Context.name .. " class ready.")

function Context:Request(value)
	mpp_state:Handle(value)
end

function Context:SetState(state)
	print( "Context.SetState:" .. state.name)
	mpp_state = state
end

---------------------------------------------------------------------- State, base class
State = class("State", {mp_Context = nil})
print (State.name .. " class ready.")

function State:init(context)
	mp_Context = context
end

function State:Handle(value)
	print("State:Handle: please override this method.")
end

---------------------------------------------------------------------- A
ConcreteStateA = State:extend("ConcreteStateA")
print (ConcreteStateA.name .. " class ready.")

function ConcreteStateA:init(context)
	ConcreteStateA.super.init(self, context)
end

function ConcreteStateA:Handle(value)
	print ("ConcreteStateA.Handle")
	if (value > 10) then
		mp_Context:SetState( ConcreteStateB(mp_Context) )
	end
end

---------------------------------------------------------------------- B
ConcreteStateB = State:extend("ConcreteStateB")
print (ConcreteStateB.name .. " class ready.")

function ConcreteStateB:init(context)
	ConcreteStateB.super.init(self, context)
end

function ConcreteStateB:Handle(value)
	print ("ConcreteStateB.Handle")
	if (value > 20) then
		mp_Context:SetState( ConcreteStateC(mp_Context) )
	end
end

---------------------------------------------------------------------- C
ConcreteStateC = State:extend("ConcreteStateC")
print (ConcreteStateC.name .. " class ready.")

function ConcreteStateC:init(context)
	ConcreteStateC.super.init(self, context)
end

function ConcreteStateC:Handle(value)
	print ("ConcreteStateC.Handle")
	if (value > 20) then
		mp_Context:SetState( ConcreteStateA(mp_Context) )
	end
end