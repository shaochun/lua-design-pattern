nsState = {}

----------------------------------------------------------------------
local class = require "class-clean"


----------------------------------------------------------------------
local Context = class("Context", {mpp_state = nil})
print (Context.name .. " class ready.")

function Context:Request(value)
	mpp_state:Handle(value)
end

function Context:SetState(state)
	print( "Context.SetState:" .. state)
	mpp_state = state
end

---------------------------------------------------------------------- State, base class
local State = class("State", {mp_Context = nil})
print (State.name .. " class ready.")

function State:init(context)
	mp_state:Handle(context)
end

function State:Handle(value)
	print("State:Handle: please override this method.")
end

---------------------------------------------------------------------- A
local ConcreteStateA = State:extend("ConcreteStateA", {mpp_state = nil})
print (ConcreteStateA.name .. " class ready.")

function ConcreteStateA:init(context)
	ConcreteStateA.super.init(context)
end

function ConcreteStateA:Handle(value)
	print ("ConcreteStateA.Handle")
	if (value > 10) then
		mp_Context:SetState( ConcreteStateB(mp_Context) )
	end
end

---------------------------------------------------------------------- B
local ConcreteStateB = State:extend("ConcreteStateB", {mpp_state = nil})
print (ConcreteStateB.name .. " class ready.")

function ConcreteStateB:init(context)
	ConcreteStateB.super.init(context)
end

function ConcreteStateB:Handle(value)
	print ("ConcreteStateB.Handle")
	if (value > 20) then
		mp_Context:SetState( ConcreteStateC(mp_Context) )
	end
end

---------------------------------------------------------------------- C
local ConcreteStateC = State:extend("ConcreteStateC", {mpp_state = nil})
print (ConcreteStateC.name .. " class ready.")

function ConcreteStateC:init(context)
	ConcreteStateC.super.init(context)
end

function ConcreteStateC:Handle(value)
	print ("ConcreteStateC.Handle")
	if (value > 20) then
		mp_Context:SetState( ConcreteStateA(mp_Context) )
	end
end