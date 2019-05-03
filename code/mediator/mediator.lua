----------------------------------------------------------------------
local class = require "class-clean"

---------------------------------------------------------------------- Mediator (abstract)
Mediator = class("Mediator")

function Mediator:SendMessage(colleague, message)
	print("Mediator:SendMessage is abstract. please override.")
end

---------------------------------------------------------------------- Colleague (abstract)
Colleague = class("Colleague", {mp_Mediator = nil})

function Colleague:init(mediator)
	mp_Mediator = mediator
end

function Colleague:Request(message)
	print("Colleague:Request is abstract. please override.")
end

---------------------------------------------------------------------- Colleague (abstract)
ConcreateColleague1 = Colleague:extend("ConcreateColleague1")

function ConcreateColleague1:init(mediator)
	ConcreateColleague1.super.init(self, mediator)
end

function ConcreateColleague1:Action()
	mp_Mediator:SendMessage(self, "Colleage1發出通知")
end

function ConcreateColleague1:Request(message)
	print("ConcreateColleague1.Request:" .. message)
end

---------------------------------------------------------------------- Colleague (abstract)
ConcreateColleague2 = Colleague:extend("ConcreateColleague2")

function ConcreateColleague2:init(mediator)
	ConcreateColleague2.super.init(self, mediator)
end

function ConcreateColleague2:Action()
	mp_Mediator:SendMessage(self, "Colleage2發出通知")
end

function ConcreateColleague2:Request(message)
	print("ConcreateColleague2.Request:" .. message)
end

---------------------------------------------------------------------- Colleague (abstract)
ConcreteMediator = Mediator:extend("ConcreteMediator", {mpp_Colleague1 = nil, mpp_Colleague2 = nil})

function ConcreteMediator:SetColleageu1(colleague) --ConcreateColleague1 param
	mpp_Colleague1 = colleague;
end

function ConcreteMediator:SetColleageu2(colleague) --ConcreateColleague2 param
	mpp_Colleague2 = colleague;
end

function ConcreteMediator:SendMessage(colleague, message) --(Colleague, string) param
	-- inform Colleague2 when receive Colleague1
	if( mpp_Colleague1 == colleague) then 
		mpp_Colleague2.Request( Message)
	end

	-- inform Colleague1 when receive Colleague2
	if( mpp_Colleague2 == colleague) then 
		mpp_Colleague1.Request( Message)
	end
end