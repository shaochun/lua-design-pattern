require("code.mediator.mediator")

-- create mediator
local mediator = ConcreteMediator()

-- create two colleagues
local colleague1 = ConcreateColleague1(mediator)
local colleague2 = ConcreateColleague2(mediator)

mediator:SetColleageu1(colleague1)
mediator:SetColleageu2(colleague2)

colleague1:Action()
colleague2:Action()